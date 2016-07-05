/*
This class advertises our odometry position and a cmd_vel to RosAria.
*/
#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>

// Command velocity publisher
ros::Publisher cmd_vel_pub;

// Odometry state publishers
ros::Publisher odom_pub;

// Odometry transformation broadcaster (for RViz and similar functions)
tf::TransformBroadcaster *odom_broadcaster;

// Called whenever a new Odometry message is received
void poseCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
  /*** First, we'll publish the transform over tf ***/
  
  // Create the transform message
  geometry_msgs::TransformStamped odom_trans;
  
  // Stamp the message
  odom_trans.header.stamp = ros::Time::now();
  odom_trans.header.frame_id = "odom";
  odom_trans.child_frame_id = "base_link";

  // Se the odom transformation message quaternion
  odom_trans.transform.translation.x = msg->pose.pose.position.x;
  odom_trans.transform.translation.y = msg->pose.pose.position.y;
  odom_trans.transform.translation.z = msg->pose.pose.position.z;
  odom_trans.transform.rotation = msg->pose.pose.orientation;

  // Send the transform message
  odom_broadcaster->sendTransform(odom_trans);

  // Publish the odom message
  odom_pub.publish(*msg);
}

// Called whenver a new cmd_vel message is received
void cmdCallback(const geometry_msgs::Twist::ConstPtr& msg){
    //Forward the message to our publisher
    cmd_vel_pub.publish(*msg);
}

int main(int argc, char** argv){
  ros::init(argc, argv, "odom");
  
  // Node handles
  ros::NodeHandle cmd_vel_pub_n;
  ros::NodeHandle odom_pub_n;
  ros::NodeHandle pose_sub_n;
  ros::NodeHandle cmd_vel_sub_n;
  
  // Publish our odometry message and forward our received cmd_vel messages
  odom_pub = odom_pub_n.advertise<nav_msgs::Odometry>("odom", 50);
  cmd_vel_pub = cmd_vel_pub_n.advertise<geometry_msgs::Twist>("RosAria/cmd_vel", 50);
  
  // We need to create a broadcaster in the main loop, even though it isn't used here. So we just create a temporary one and forward it
  tf::TransformBroadcaster temp_broadcaster;
  odom_broadcaster = &temp_broadcaster;
  
  // Subscribe to the topics we need
  ros::Subscriber pose_sub = pose_sub_n.subscribe("RosAria/pose", 50, poseCallback);
  ros::Subscriber cmd_vel_sub = cmd_vel_sub_n.subscribe("cmd_vel", 50, cmdCallback);

  ros::spin();
}
