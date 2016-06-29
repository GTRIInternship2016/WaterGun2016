/*******************************************************************************
* Pedestrian Detector v0.1    2013-08
*
* Fabio Reis
* [freis-at-isr.ist.utl.pt]
*
* Please email me if you find bugs, or have suggestions or questions!
* Licensed under the Simplified BSD License [see external/bsd.txt]
*******************************************************************************/

#include "../include/pedDetTracker_ROS.hpp"

//constructor
PedDetector::PedDetector(ros::NodeHandle n): n_(n), it_(n), n_priv("~") 
{  
  bool setUpDoneCorrectly = false;
  
  // Read initialization variables and set the tracker up 
	setUpDoneCorrectly = open();
  if(!setUpDoneCorrectly)
  {
    cout<<"Set up of PedDetector failed."<<endl;
    ros::shutdown();
  }
}

//member function that set the object up.
bool PedDetector::open(){
  cout<<"Starting PedDetector"<<endl;
  outputImage = true;
  
  bool failure;
  bool quit = false;

  //***********************************************
  // Read parameters from the initialization file *
  //***********************************************
  //Topics
  n_priv.param<std::string>("inputVideoPort",  _inputVideoPortName,  "/image_raw");
  n_priv.param<std::string>("outputVideoPort", _outputVideoPortName, "/pedDetector/video_o");
  n_priv.param<std::string>("outputDataPort",  _outputDataPortName,  "/pedDetector/data_o");
  
  //*********************************************
  // Create and initialize some data structures *
  //*********************************************
  
  cv::namedWindow("human tracker", cv::WINDOW_NORMAL);
  cv::startWindowThread();
  

  // Set the output ports
  _outputVideoPort = it_.advertise(_outputVideoPortName.c_str(), 1);
//  _outputDataPort  = n_.advertise<PedDetector::estimates>(_outputDataPortName.c_str(), 1);
  
  // Set the input video port, with the associated callback method
  _inputVideoPort = it_.subscribe(_inputVideoPortName.c_str(), 1, &PedDetector::detectorCallback, this);
  
  if(quit==true) {
    printf("There were problems initializing the object: the execution was interrupted.\n");
    fflush(stdout);
    return false; //there were problems initializing the objet: stop the execution.
  } else {
    printf("PedDetector initialized successfully.\n");
    return true;  //the object was set up successfully.
  }
}


//destructor
PedDetector::~PedDetector(){
    cout<<"Stopping pedDetector"<<endl;
    cv::destroyWindow("human tracker");
}


//member that closes the object.
bool PedDetector::close(){
/*/
  cvReleaseMat(&_A);
  cvReleaseMat(&_particles);
  cvReleaseMat(&_newParticles);
//*/
    cv::destroyWindow("human tracker");
  return true;
}

//**************************
//* DETECTOR IMAGE CALLBACK *
//**************************
void PedDetector::detectorCallback(const sensor_msgs::ImageConstPtr& msg_ptr){
  /////////////////
  // DATA INPUT  //
  /////////////////

  try
  {
  // Grab a frame from the stream
    ros_cv_ptr = cv_bridge::toCvCopy(msg_ptr, enc::BGR8);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }

  ///////////////////
  ///  DETECTOR   ///
  ///////////////////
  results = pedDetector(ros_cv_ptr->image);

  ///////////////////
  /// DATA OUTPUT ///
  ///////////////////

  // Outputs detections boundingbox position and size
  //outMsg.seeingBall=_seeingObject;
  //_outputDataPort.publish(outMsg);

  // Try to write the image with detections to the output stream
  if (outputImage)
  {
    if(results == 0){
        for(int i=0; i<72; i++){
            int mult = 12;
            cv::rectangle(ros_cv_ptr->image, cv::Point(mult*i,mult*i), cv::Point(mult*(i+1),mult*(i+1)), Scalar_<int>(255,0,0));
        }
    }else{
        for(int i=0; i<results->size(); i++){
            // Draws the bounding boxes.
            cv::rectangle(ros_cv_ptr->image, (*results)[i], Scalar_<int>(255,0,0));
        }
    }

    cout << results;
  
    cv::imshow("human tracker", ros_cv_ptr->image);
//    _outputVideoPort.publish(ros_cv_ptr->toImageMsg());
  }
}


