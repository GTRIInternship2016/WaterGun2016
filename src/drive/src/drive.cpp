#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <camera/Target.h>
#include <math.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/tf.h>

ros::Publisher pub;
nav_msgs::Odometry odom;

#define pi 3.141592653589793238462643383279502884197169399375106

void targetCallback(const camera::Target::ConstPtr& tar)
{
    double dist = sqrt(tar->x*tar->x + tar->z*tar->z);
    geometry_msgs::PoseStamped toR;
    toR.header.stamp = ros::Time::now();
    toR.header.frame_id = "odom";
    if(dist > 1){
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
    }else{
        toR.pose.position.x = odom.pose.pose.position.x;
        toR.pose.position.y = odom.pose.pose.position.y;
        toR.pose.position.z = 0;
    }
    pub.publish(toR);
}

void odomCallback(const nav_msgs::Odometry::ConstPtr& odm){
    odom = *odm;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "drive");
  ros::NodeHandle nh_tar;

  ros::Subscriber sub_tar = nh_tar.subscribe("target", 1, targetCallback);
  ros::NodeHandle nh_pub;
  pub = nh_pub.advertise<geometry_msgs::PoseStamped>("move_base_simple/goal",10);
  ros::NodeHandle nh_odom;
  ros::Subscriber sub_odom = nh_odom.subscribe("odom", 10, odomCallback);
  ros::spin();
}
