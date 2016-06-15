#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>

ros::Publisher cmd_vel_pub;
ros::Publisher odom_pub;
tf::TransformBroadcaster *odom_broadcaster;

void poseCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
  //first, we'll publish the transform over tf
  geometry_msgs::TransformStamped odom_trans;
  odom_trans.header.stamp = ros::Time::now();
  odom_trans.header.frame_id = "odom";
  odom_trans.child_frame_id = "base_link";

  odom_trans.transform.translation.x = msg->pose.pose.position.x;
  odom_trans.transform.translation.y = msg->pose.pose.position.y;
  odom_trans.transform.translation.z = msg->pose.pose.position.z;
  odom_trans.transform.rotation = msg->pose.pose.orientation;

  //send the transform
  odom_broadcaster->sendTransform(odom_trans);

  odom_pub.publish(*msg);
}

void cmdCallback(const geometry_msgs::Twist::ConstPtr& msg){
    cmd_vel_pub.publish(*msg);
}

int main(int argc, char** argv){
  ros::init(argc, argv, "odom");

  ros::NodeHandle cmd_vel_pub_n;
  ros::NodeHandle odom_pub_n;
  ros::NodeHandle pose_sub_n;
  ros::NodeHandle cmd_vel_sub_n;
  odom_pub = odom_pub_n.advertise<nav_msgs::Odometry>("odom", 50);
  cmd_vel_pub = cmd_vel_pub_n.advertise<geometry_msgs::Twist>("RosAria/cmd_vel", 50);
  tf::TransformBroadcaster temp_broadcaster;
  odom_broadcaster = &temp_broadcaster;
  ros::Subscriber pose_sub = pose_sub_n.subscribe("RosAria/pose", 50, poseCallback);
  ros::Subscriber cmd_vel_sub = cmd_vel_sub_n.subscribe("cmd_vel", 50, cmdCallback);

  ros::spin();
}
