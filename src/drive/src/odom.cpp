#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>

ros::Time last_time;

double x = 0.0;
double y = 0.0;
double v = 0.0;
double vth = 0.0;
double th = 0.0;

ros::Publisher odom_pub;
tf::TransformBroadcaster *odom_broadcaster;

void moveCallback(const geometry_msgs::Twist::ConstPtr& msg)
{

  ros::Time current_time = ros::Time::now();

  //compute odometry in a typical way given the velocities of the robot
  double dt = (current_time - last_time).toSec();

  x += (v * cos(th)) * dt;
  y += (v * sin(th)) * dt;
  th += vth * dt;

  //since all odometry is 6DOF we'll need a quaternion created from yaw
  geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(th);

  //first, we'll publish the transform over tf
  geometry_msgs::TransformStamped odom_trans;
  odom_trans.header.stamp = current_time;
  odom_trans.header.frame_id = "odom";
  odom_trans.child_frame_id = "base_link";

  odom_trans.transform.translation.x = x;
  odom_trans.transform.translation.y = y;
  odom_trans.transform.translation.z = 0.0;
  odom_trans.transform.rotation = odom_quat;

  //send the transform
  odom_broadcaster->sendTransform(odom_trans);

  //next, we'll publish the odometry message over ROS
  nav_msgs::Odometry odom;
  odom.header.stamp = current_time;
  odom.header.frame_id = "odom";

  //set the position
  odom.pose.pose.position.x = x;
  odom.pose.pose.position.y = y;
  odom.pose.pose.position.z = 0.0;
  odom.pose.pose.orientation = odom_quat;

  //set the velocity
  odom.child_frame_id = "base_link";
  odom.twist.twist.linear.x = v;
  odom.twist.twist.linear.y = 0;
  odom.twist.twist.angular.z = vth;

  //publish the message
  odom_pub.publish(odom);

  last_time = current_time;

  v = msg->linear.x;
  vth = msg->angular.z;
}

int main(int argc, char** argv){
  ros::init(argc, argv, "odom");

  ros::NodeHandle pub_n;
  ros::NodeHandle sub_n;
  odom_pub = pub_n.advertise<nav_msgs::Odometry>("odom", 50);
  tf::TransformBroadcaster temp_broadcaster;
  odom_broadcaster = &temp_broadcaster;
  ros::Subscriber sub = sub_n.subscribe("cmd_vel", 50, moveCallback);

  ros::spin();
}
