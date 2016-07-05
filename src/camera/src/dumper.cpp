/*
This node takes camera input as an individual image for processing.
*/
#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>

using namespace std;

int main(int argc, char** argv){
  ros::init(argc, argv, "dumper");
  
  // Create our node handle and then transform it into an image transport node handle
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  
  // Advertise the image
  image_transport::Publisher pub = it.advertise("image_raw", 1);

  cv::VideoCapture cap(0);
  // Check if video device can be opened with the given index
  if(!cap.isOpened()){
      cout << "Error bra" << endl;
      return 1;
  }
  
  // Set the resolution of the image
  cap.set(CV_CAP_PROP_FRAME_WIDTH, 1920);
  cap.set(CV_CAP_PROP_FRAME_HEIGHT, 1080);
  
  // Create the cv Mat (image)
  cv::Mat frame;
  
  // Create the image to be forwarded
  sensor_msgs::ImagePtr msg;
  
  // While the NodeHandle is working...
  while (nh.ok()) {
    // Feed the capture into the Mat
    cap >> frame;
    // Check if grabbed frame is actually full with some content
    
    // As logn as the frame contains data...
    if(!frame.empty()) {
      // Convert the cv Mat to an ImagePtr message
      msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
      
      // Then publish!
      pub.publish(msg);
      //cv::waitKey(1);
    }

    ros::spinOnce();
  }
}
