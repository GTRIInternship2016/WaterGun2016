#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>

using namespace std;

int main(int argc, char** argv)
{

  ros::init(argc, argv, "dumper");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);
  image_transport::Publisher pub = it.advertise("image_raw", 1);

  cv::VideoCapture cap(0);
  // Check if video device can be opened with the given index
  if(!cap.isOpened()){
      cout << "Error bra" << endl;
      return 1;
  }
  cap.set(CV_CAP_PROP_FRAME_WIDTH, 1920);
  cap.set(CV_CAP_PROP_FRAME_HEIGHT, 1080);
  cv::Mat frame;
  sensor_msgs::ImagePtr msg;
  while (nh.ok()) {
    cap >> frame;
    // Check if grabbed frame is actually full with some content
    if(!frame.empty()) {
      msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
      pub.publish(msg);
      //cv::waitKey(1);
    }

    ros::spinOnce();
  }
}
