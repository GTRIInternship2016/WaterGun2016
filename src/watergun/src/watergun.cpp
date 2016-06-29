#include <ros/ros.h>
#include <camera/Target.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Bool.h>
#include <math.h>

ros::Publisher angle_pub, doshoot_pub;

void targetCallback(const camera::Target::ConstPtr& msg)
{
    std_msgs::UInt16 angle;
    std_msgs::Bool doshoot;

    //Takes target coordinates and turns it into a degree
    angle.data = atan(msg->y/msg->z);
    //Publishes each time target is a certain distance away
    doshoot.data = msg->z < 10;

    angle_pub.publish(angle);
    doshoot_pub.publish(doshoot);

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "watergun");
    ros::NodeHandle n;
    angle_pub = n.advertise<std_msgs::UInt16>("angle", 100);
    ros::Subscriber target_sub = n.subscribe("target", 100, targetCallback);
    doshoot_pub = n.advertise<std_msgs::Bool>("doshoot", 100);

    ros::spin();
    return 0;
}
