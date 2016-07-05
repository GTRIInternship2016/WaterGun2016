/*
Simple class that takes target inputs and converts them into neccessary Arduino inputs (degrees for the servo and a shoot/don't shoot bool.)
*/

#include <ros/ros.h>
#include <camera/Target.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Bool.h>
#include <math.h>

// Publishers for the different fields
ros::Publisher angle_pub, doshoot_pub;

// Called every time a new target is received so that the new Arduino fields are publishes
void targetCallback(const camera::Target::ConstPtr& msg)
{
    std_msgs::UInt16 angle;
    std_msgs::Bool doshoot;

    //Takes target coordinates and turns it into a degree
    angle.data = atan(msg->y/msg->z);
    //Publishes each time target is a certain distance away
    doshoot.data = msg->z < 10;
    
    // Publish the data upon generation. Publishers are put here so that the looping nature of the callback minimizes the need for user created while loops
    angle_pub.publish(angle);
    doshoot_pub.publish(doshoot);

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "watergun");
    ros::NodeHandle n;
    
    // Subscribe to the target topipc
    ros::Subscriber target_sub = n.subscribe("target", 100, targetCallback);
    
    // Create our publishers
    angle_pub = n.advertise<std_msgs::UInt16>("angle", 100);
    doshoot_pub = n.advertise<std_msgs::Bool>("doshoot", 100);

    // Spin
    ros::spin();
    return 0;
}
