/*
This handles the creation of the target coordinates out of a bound box
*/
#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/Float32.h>
#include <camera/BoundBox.h>
#include <camera/Target.h>
#include <math.h>
#include <iostream>

using namespace camera;

// Macro constants
#define MAX_X 1920 // Maximum x value
#define MAX_Y 1080 // Maximum y value
#define BX 0.00064013588 // Pixel to unit conversion for x
#define BY 0.00069489961 // Pixel to unit conversion for y
#define CAMERA_BOT_ANGLE 1.29249667 // Angle to the ground
#define BOT_HEIGHT 0.3556 // How far off the ground the camera is

#define BIG 5 // (was 60 The largest tolerable distance for z
#define SMALL 1 //(was 2.5) The smallest tolerable distance for z
#define THRESH 0.5 // How much distance the target is allowed to change
#define TOLERANCE 0.25 // Range on either side of big(?)/small that is considered tolerable

// Publishers
ros::Publisher pub;
ros::Publisher laserpub;

// Rate
ros::Rate* r;

// Vector to take laser input to get distance and angle of increment for the laser
std::vector<float> z_array = std::vector<float>(0);
double angle_increment;

// Previous Z value
double prev = -1;

// Convert pixels to real units
double pxToReal(int px, double dist, double B){
    return dist * tan(B * px);
}

double lasermin(double theta){
    
    // std::cout << "halfway: " << z_array[z_array.size() / 2] << std::endl;
    // std::cout << "halfway index " << z_array.size() /2 << std::endl;
    // std::cout << "512: " << z_array[512];
    // std::cout << "513: " << z_array[513];
    
    // Half way point (angle 0)
    int index = 363 - theta/angle_increment;
    
    // Total distance to look
    const int sweep = (int)(.25/angle_increment);
    
    double min = 1000000;
    for(int i=0;i<sweep;i++){
        // Get our numbers from the laser z_array
        double temp = z_array[index - (int)(sweep/2.0) + i];
        if(temp < .05) continue;
        
        // Update the min value
        if(temp < min) min = temp;
    }
    return min;
}

// Check for the sanity of our values
bool insanityCheck(double value){
    if(prev == -1) prev = value; // Log our past values
    ///As long as the value is in range/And the rate of change isn't too high
    if(BIG > value && value > SMALL && abs(value - prev) < THRESH){
        return true;
    }
    prev = -1; // If we haven't returned leave it at -1 and return an 'insane' flag
    return false;
}

// Called when a new box is received
void boxCallback(const BoundBox::ConstPtr& box){
    // Create our target message
    Target tar;
    
    // Get the center of the box
    int cx = box->x + (box->w / 2);
    
    // Get the middle of the image
    int mid_x = MAX_X / 2;
    
    // Get the angle of elevation
    double angle_elevation = CAMERA_BOT_ANGLE + (BY * (MAX_Y - box->y - box->h));
    
    // Set the target's theta
    tar.theta = BX * (cx - mid_x);

    // Get the laser_z
    double laser_z = lasermin(tar.theta);
    
    // Set the laser_z message
    std_msgs::Float32 lasermsg;
    lasermsg.data = laser_z;
    laserpub.publish(lasermsg);
    //in the future, check z_array[... +- 1] as well, and pick the most likely candidate
    
    // Set the target's z message (based on the camera)
    tar.z = BOT_HEIGHT * tan(angle_elevation);

    if(insanityCheck(tar.z)){ // If the camera is not insane...
        if(insanityCheck(laser_z)){ // If the laser is also not insane...
            // Optional priority logic
//            if(abs(laser_z - prev) < abs(tar.z - prev)){
                tar.z = laser_z; // Defaults to laser right now
//            }
        }
    }else{ // If the camera is insane...
        if(insanityCheck(laser_z)){ // But not the laser...
            tar.z = laser_z; // Set it to the laser
        }else return; // If BOTH are insane, quit
    }
    prev = tar.z; // If we didn't quit, log the previous

    // Set the x and y based off the camera
    tar.x = pxToReal(cx - mid_x, tar.z, BX);
    tar.y = pxToReal(box->h / 2, tar.z, BY);

//    std::cout << "x: " << tar.x << std::endl;
//    std::cout << "\ty: " << tar.y << std::endl;
//    std::cout << "\t\tz: " << tar.z << std::endl;
//    std::cout << "\t\t\tbox->x: " << box->x << std::endl;
//    std::cout << "\t\t\t\tbox->y: " << box->y << std::endl;

    // Publish the target
    pub.publish(tar);

    r->sleep();
}

// Called whenever new laser data is received
void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg){
    // Set our z array to the array of values given in the msg
    z_array = msg->ranges;
    
    // Set out angle increment to the values given in the msg
    angle_increment = msg->angle_increment;
}

int main(int argc, char **argv){
    ros::init(argc, argv, "cameralogic");

    // Create our node handles
    ros::NodeHandle pub_n;
    ros::NodeHandle pub_laser_n;
    ros::NodeHandle sub_n;

    // Do the rate stuff
    ros::Rate temp(60);
    r = &temp;

    // Subscribe to our image and scan data
    ros::Subscriber cam_sub = sub_n.subscribe("img_target", 10, boxCallback);
    ros::Subscriber urg_sub = sub_n.subscribe("scan", 10, laserCallback);

    // Publish our target coordinates and laser_z value
    pub = pub_n.advertise<Target>("target", 10);
    laserpub = pub_laser_n.advertise<std_msgs::Float32>("laser_z", 10);

    ros::spin();

    return 0;
}
