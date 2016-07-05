/*
This class takes in the target vector and generates a poseStamped message.
*/

#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <camera/Target.h>
#include <math.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/tf.h>
#include <iostream>

// Odometry message to publish
nav_msgs::Odometry odom;

// Pose stamped message to publish
geometry_msgs::PoseStamped prev;

ros::Publisher pub;
ros::Rate *r;

// Pi constant
#define pi 3.141592653589793238462643383279502884197169399375106

// Distance thresholding
#define THRESH 1.5

// Takes in any number and returns it as a positive float (Math::abs returns a truncated int, so we needed to make our own)
float sign(float num){
    if(num < 0){
        return num*-1;
    }else{ return num;}
}

// Given PoseStamped message, takes the x and y position and returns the distance between them
double distance(geometry_msgs::PoseStamped msg){
    return sqrt(pow(msg.pose.position.x - prev.pose.position.x,2)
              + pow(msg.pose.position.y - prev.pose.position.y,2));
}

// Called whenever a target message is received
void targetCallback(const camera::Target::ConstPtr& tar)
{
    // Gets the distance between the TARGET's x and z (different from the distance() function)
    double dist = sqrt(tar->x*tar->x + tar->z*tar->z);
    
    // Motion PoseStamped message. Only published when the P3AT needs to translate
    geometry_msgs::PoseStamped toR;
    
    // Rotation only PoseStamped. Only published when the P3AT needs to rotate but NOT translate
    geometry_msgs::PoseStamped theta;
    
    // Set the stamp part of the poseStamped messages
    toR.header.stamp = ros::Time::now();
    toR.header.frame_id = "odom";
    theta.header.stamp = ros::Time::now();
    theta.header.frame_id = "odom";
    
    if(dist > 2){
        double rx,ry;
        double tx,tz;
        double theta;
        
        // Set the position message x and y
        rx = odom.pose.pose.position.x;
        ry = odom.pose.pose.position.y;
        
        // Set the target position as the same as the robot's position
        tx = tar->x;
        tz = tar->z;
        
        // Set the publish theta value
        theta = tf::getYaw(odom.pose.pose.orientation);
        
        // Move the target position forward by tz
        rx += tz*cos(theta);
        ry += tz*sin(theta);
        // Rotate to the x axis
        theta -= pi/2;
        // Move the target "forward" (sideways) by tx
        rx += tx*cos(theta);
        ry += tx*sin(theta);
        
        // Publish
        toR.pose.position.x = rx;
        toR.pose.position.y = ry;
        toR.pose.position.z = 0;
        //std::cout << "distance greater than 2" << tar->theta << "\n";
        //std::cout << "d >2" << dist << "\n";
     }else if(dist < 1.4){
         
         /***  Here we do the same thing except adding 180 degrees to theta to make it go in reverse ***/
        double rx,ry;
        double tx,tz;
        double theta;
        
        rx = odom.pose.pose.position.x;
        ry = odom.pose.pose.position.y;
        
        tx = tar->x;
        tz = tar->z;
        
        theta = pi + tf::getYaw(odom.pose.pose.orientation);
        
        rx += tz*cos(theta);
        ry += tz*sin(theta);
        theta -= pi/2;
        rx += tx*cos(theta);
        ry += tx*sin(theta);
        
        toR.pose.position.x = rx;
        toR.pose.position.y = ry;
        toR.pose.position.z = 0;
         //std::cout << "distance less than 1.4" << tar->theta << "\n";
         //std::cout << "d >1.4" << dist << "\n";
    }else{
        // Default case: Don't move (sets) the publish message to the current position.
        // Only called when distance is between 1.4 and 2
        toR.pose.position.x = odom.pose.pose.position.x;
        toR.pose.position.y = odom.pose.pose.position.y;
        toR.pose.position.z = 0;
    }
    
    // Set the orientation to the target theta
    toR.pose.orientation = tf::createQuaternionMsgFromYaw(
                tf::getYaw(odom.pose.pose.orientation)-tar->theta
    );
    
    // If our distance is larger than the threshold we log our previous value for insantiy checking.
    if(distance(toR) > THRESH){
        prev = toR;
        pub.publish(toR);
    }
    
    // If we're not moving (within the THRESH) and our theta is too large...
    if(distance(toR) < THRESH && sign(tar->theta) > 0.1){
        // Don't change our translational position
        theta.pose.position.x = odom.pose.pose.position.x;
        theta.pose.position.y = odom.pose.pose.position.y;
        theta.pose.position.z = 0;
        
        // Continue to change our theta
        theta.pose.orientation = tf::createQuaternionMsgFromYaw(
                    tf::getYaw(odom.pose.pose.orientation) - tar->theta);
                    
        // Publish our theta change message
        pub.publish(theta);
    }
    r->sleep();
}

// Odometry callback. Sets the local odom variable.
void odomCallback(const nav_msgs::Odometry::ConstPtr& odm){
    odom = *odm;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "drive");

  ros::Rate temp(0.5);
  r = &temp;
  
  ros::NodeHandle nh_pub;
  ros::NodeHandle nh_tar;
  ros::NodeHandle nh_odom;
  
  // Subscribe to our current odom position and the target
  ros::Subscriber sub_tar = nh_tar.subscribe("target", 1, targetCallback);
  ros::Subscriber sub_odom = nh_odom.subscribe("odom", 10, odomCallback);
  
  // Advertise to the move_base goal
  pub = nh_pub.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal",10);
  
  ros::spin();
}
