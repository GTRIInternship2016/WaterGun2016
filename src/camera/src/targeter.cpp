/*
This node takes in an image and a box, then locks onto a target and publishes the new box
*/
#include <ros/ros.h>
//#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/core/core_c.h"
#include <dlib/image_processing.h>
#include <dlib/opencv/cv_image.h>
#include <cv_bridge/cv_bridge.h>
#include <camera/BoundBox.h>
#include <std_msgs/Bool.h>
#include <dlib/image_processing.h>

using namespace camera;

// Create the dlib image and tracker
dlib::cv_image<dlib::bgr_pixel> img;
dlib::correlation_tracker tracker;

// Create the boxes used for initial targeting and during the targeting 
BoundBox inBox;
BoundBox outBox;

// Create the booleans for targeting state handling
bool hasNewTarget = false;
bool tracker_initialized = false;

ros::Publisher pub;
ros::Rate *r;

// Called whenever an image pointer is received
void imageCallback(const sensor_msgs::ImageConstPtr& msg)
{
    try{
        
        // Get the frame out of the image message
        cv::Mat frame = cv_bridge::toCvShare(msg, "bgr8")->image;
        
        // Create the dlib image
        img = dlib::cv_image<dlib::bgr_pixel>(frame);
        if(tracker_initialized){
            // Create a rectangle based on the outBox onto the frame (if we're tracking)
            cv::rectangle(frame,
                          cv::Point(outBox.x,outBox.y),
                          cv::Point(outBox.x + outBox.w,
                                    outBox.y + outBox.h),
                          cv::Scalar(255,0,0));
        }
        if(hasNewTarget){
            // Overlay a rectangle based on the inBox onto the frame (if we have a new target)
            cv::rectangle(frame,
                          cv::Point(inBox.x,inBox.y),
                          cv::Point(inBox.x + inBox.w,
                                    inBox.y + inBox.h),
                          cv::Scalar(0,0,255));
        }
        // Show the frame
        cv::imshow("current image", frame);
        
        //If the tracker isn't initialized, DON'T DO ANY OF THE STUFF AFTER THIS
        if(!tracker_initialized)
          return;
          
        // Update the current tracker state given the current image
        tracker.update(img);
        
        // Get the dlib rectangle's current position
        dlib::drectangle temp = tracker.get_position();
        
        // Set the outBox's fields to what we got off the temporary dlib rectangle
        outBox.x = temp.left();
        outBox.y = temp.top();
        outBox.w = temp.width();
        outBox.h = temp.height();
        
        // Publish the outBox to the outBox topic
        pub.publish(outBox);
    }catch (cv_bridge::Exception& e){
        ROS_ERROR("Could not convert from '%s' to 'bgr8'.", msg->encoding.c_str());
    }
}

// Called whenever a new box is received from user_input
void boxCallback(const BoundBox::ConstPtr& box){
    // Set the inBox to the user_input box and update the target status
    inBox = *box;
    hasNewTarget = true;
}

// Called whenever a new okgo message is received
void okCallback(const std_msgs::BoolConstPtr& msg){
    // If true
    if(msg->data){
        // Start the tracker with the current image and the rectangle
        // Note, is a centered rectangle so we had to do the w/2 / h/2 logic
       tracker.start_track(img,
              dlib::centered_rect(
                     dlib::point(inBox.x + inBox.w/2,
                           inBox.y + inBox.h/2),
                     inBox.w, inBox.h));
        // Update the tracker status
        tracker_initialized = true;
    }
    
    // Now we don't have a new target
    hasNewTarget = false;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "targeter");
  
  // Create our new node handles
  ros::NodeHandle nh_img;
  ros::NodeHandle nh_pub;
  ros::NodeHandle nh_inbox;
  ros::NodeHandle nh_ok;

  // Create a new, scalable window that displays the current image
  cv::namedWindow("current image", cv::WINDOW_NORMAL);
  cv::startWindowThread();

  // Subscribe to the image
  ros::Subscriber sub = nh_img.subscribe("image_raw", 1, imageCallback);
  
  // Set the rate
  ros::Rate temp(40);
  r = &temp;
  
  // Publish our box
  pub = nh_pub.advertise<BoundBox>("img_target",10);
  
  // Subscribe to user input fields
  ros::Subscriber s_inBox = nh_inbox.subscribe("user_input", 10, boxCallback);
  ros::Subscriber s_ok = nh_ok.subscribe("okgo", 10, okCallback);
  
  ros::spin();

  // At program close, destroy the currentWindow
  cv::destroyWindow("current image");
}
