#include <ros/ros.h>
#include <camera/BoundBox.h>
#include <camera/Target.h>
#include <math.h>
#include <iostream>

using namespace camera;

#define MAX_X 550 //this should be 1920 when we fix camera
#define MAX_Y 275 //ditttto
#define BX (2.0/MAX_X)
#define BY (2.0/MAX_Y)
#define CAMERA_BOT_ANGLE 1.0
#define BOT_HEIGHT 1.0

ros::Publisher pub;
ros::Rate* r;

double pxToReal(int px, double dist, double B)
{
    return dist * tan(B * px);
}

void boxCallback(const BoundBox::ConstPtr& box)
{
    int cx = box->x + (box->w / 2);
    int mid_x = MAX_X / 2;
    double angle_elevation = CAMERA_BOT_ANGLE - (BY * (MAX_Y - box->y - box->h));
    Target tar;
    tar.z = BOT_HEIGHT / tan(angle_elevation);
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

int main(int argc, char **argv)
{
    ros::init(argc, argv, "cameralogic");

    ros::NodeHandle pub_n;
    ros::NodeHandle sub_n;

    ros::Rate temp(5);
    r = &temp;

    ros::Subscriber sub = sub_n.subscribe("img_target", 10, boxCallback);

    pub = pub_n.advertise<Target>("target", 10);

    ros::spin();

    return 0;
}
