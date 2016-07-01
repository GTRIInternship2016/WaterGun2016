#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <camera/Target.h>
#include <math.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/tf.h>
#include <iostream>

ros::Publisher pub;
nav_msgs::Odometry odom;
ros::Rate *r;
geometry_msgs::PoseStamped prev;

#define pi 3.141592653589793238462643383279502884197169399375106
#define THRESH 1.5

float sign(float num){
    if(num < 0){
        return num*-1;
    }else{ return num;}
}

double distance(geometry_msgs::PoseStamped msg){
    return sqrt(pow(msg.pose.position.x - prev.pose.position.x,2)
              + pow(msg.pose.position.y - prev.pose.position.y,2));
}

void targetCallback(const camera::Target::ConstPtr& tar)
{
    double dist = sqrt(tar->x*tar->x + tar->z*tar->z);
    geometry_msgs::PoseStamped toR;
    geometry_msgs::PoseStamped theta;
    toR.header.stamp = ros::Time::now();
    toR.header.frame_id = "odom";
    theta.header.stamp = ros::Time::now();
    theta.header.frame_id = "odom";
    if(dist > 2){
        double rx,ry;
        double tx,tz;
        double theta;

        rx = odom.pose.pose.position.x;
        ry = odom.pose.pose.position.y;

        tx = tar->x;
        tz = tar->z;

        theta = tf::getYaw(odom.pose.pose.orientation);

        rx += tz*cos(theta);
        ry += tz*sin(theta);
        theta -= pi/2;
        rx += tx*cos(theta);
        ry += tx*sin(theta);

        toR.pose.position.x = rx;
        toR.pose.position.y = ry;
        toR.pose.position.z = 0;
        //std::cout << "distance greater than 2" << tar->theta << "\n";
        //std::cout << "d >2" << dist << "\n";
     }else if(dist < 1.4){
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
        toR.pose.position.x = odom.pose.pose.position.x;
        toR.pose.position.y = odom.pose.pose.position.y;
        toR.pose.position.z = 0;
    }
    toR.pose.orientation = tf::createQuaternionMsgFromYaw(
                tf::getYaw(odom.pose.pose.orientation)-tar->theta
    );
    if(distance(toR) > THRESH){
        prev = toR;
        std::cout << "before 1st pub" << "\n";
        pub.publish(toR);
        std::cout << "after 1st pub" << "\n";
    }

    /////////////////////////////////////////////////////////////////
    std::cout << "before Ben's code" << "\n";
    //std::cout << "before ben" << tar->theta << "\n";
    //std::cout << "d before ben" << dist << "\n";
    if(distance(toR) < THRESH && sign(tar->theta) > 0.1){
        theta.pose.position.x = odom.pose.pose.position.x;
        theta.pose.position.y = odom.pose.pose.position.y;
        theta.pose.position.z = 0;
        theta.pose.orientation = tf::createQuaternionMsgFromYaw(
                    tf::getYaw(odom.pose.pose.orientation) - tar->theta);
        std::cout << "before Ben's pub" << "\n";
        pub.publish(theta);
        std::cout << "after Ben's pub" << "\n";
    }

    r->sleep();
}

void odomCallback(const nav_msgs::Odometry::ConstPtr& odm){
    odom = *odm;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "drive");
  ros::NodeHandle nh_tar;

  ros::Rate temp(0.5);
  r = &temp;

  ros::Subscriber sub_tar = nh_tar.subscribe("target", 1, targetCallback);
  ros::NodeHandle nh_pub;
  pub = nh_pub.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal",10);
  ros::NodeHandle nh_odom;
  ros::Subscriber sub_odom = nh_odom.subscribe("odom", 10, odomCallback);

  geometry_msgs::Quaternion helloWorld;
  helloWorld.x = -0.1;
  helloWorld.y = 0;
  helloWorld.z = 0;
  helloWorld.w = 1;
  pub.publish(helloWorld);

  ros::spin();
}
