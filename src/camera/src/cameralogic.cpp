#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/Float32.h>
#include <camera/BoundBox.h>
#include <camera/Target.h>
#include <math.h>
#include <iostream>

using namespace camera;

#define MAX_X 1920
#define MAX_Y 1080
#define BX 0.00064013588
#define BY 0.00069489961
#define CAMERA_BOT_ANGLE 1.29249667
#define BOT_HEIGHT 0.3556

#define BIG 5//6 /the largest tolerable distance for z
#define SMALL 1//2.5 //the smallest tolerable distance for z
#define THRESH 0.5 //how much distance the target is allowed to change
#define TOLERANCE 0.25 // Range on either side of big(?)/small that is considered tolerable

ros::Publisher pub;
ros::Publisher laserpub;
ros::Rate* r;
std::vector<float> z_array = std::vector<float>(0);
double angle_increment;
double prev = -1;

double pxToReal(int px, double dist, double B)
{
    return dist * tan(B * px);
}

double lasermin(double theta){
    //std::cout << "halfway: " << z_array[z_array.size() / 2] << std::endl;
    //std::cout << "halfway index " << z_array.size() /2 << std::endl;
   // std::cout << "512: " << z_array[512];
    //std::cout << "513: " << z_array[513];
    int index = 363 - theta/angle_increment;
    const int sweep = (int)(.25/angle_increment);
    double min = 1000000;
    for(int i=0;i<sweep;i++){
        double temp = z_array[index - (int)(sweep/2.0) + i];
        if(temp < .05) continue;
        if(temp < min) min = temp;
    }
    return min;
}

bool insanityCheck(double value){
    if(prev == -1) prev = value;
    if(BIG > value && value > SMALL && abs(value - prev) < THRESH){
        return true;
    }
    prev = -1;
    return false;
}

void boxCallback(const BoundBox::ConstPtr& box)
{
    Target tar;
    int cx = box->x + (box->w / 2);
    int mid_x = MAX_X / 2;
    double angle_elevation = CAMERA_BOT_ANGLE + (BY * (MAX_Y - box->y - box->h));

    tar.theta = BX * (cx - mid_x);

    double laser_z = lasermin(tar.theta);
    std_msgs::Float32 lasermsg;
    lasermsg.data = laser_z;
    laserpub.publish(lasermsg);
    //in the future, check z_array[... +- 1] as well, and pick the most likely candidate

    tar.z = BOT_HEIGHT * tan(angle_elevation);

    if(insanityCheck(tar.z)){
        if(insanityCheck(laser_z)){
            //priority logic
//            if(abs(laser_z - prev) < abs(tar.z - prev)){
                tar.z = laser_z;
//            }
        }
    }else{
        if(insanityCheck(laser_z)){
            tar.z = laser_z;
        }else return;
    }
    prev = tar.z;


    tar.x = pxToReal(cx - mid_x, tar.z, BX);
    tar.y = pxToReal(box->h / 2, tar.z, BY);

//    std::cout << "x: " << tar.x << std::endl;
//    std::cout << "\ty: " << tar.y << std::endl;
//    std::cout << "\t\tz: " << tar.z << std::endl;
//    std::cout << "\t\t\tbox->x: " << box->x << std::endl;
//    std::cout << "\t\t\t\tbox->y: " << box->y << std::endl;

    pub.publish(tar);

    r->sleep();
}

void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg){
    z_array = msg->ranges;
    angle_increment = msg->angle_increment;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "cameralogic");

    ros::NodeHandle pub_n;
    ros::NodeHandle pub_laser_n;
    ros::NodeHandle sub_n;

    ros::Rate temp(60);
    r = &temp;

    ros::Subscriber cam_sub = sub_n.subscribe("img_target", 10, boxCallback);
    ros::Subscriber urg_sub = sub_n.subscribe("scan", 10, laserCallback);

    pub = pub_n.advertise<Target>("target", 10);
    laserpub = pub_laser_n.advertise<std_msgs::Float32>("laser_z", 10);

    ros::spin();

    return 0;
}
