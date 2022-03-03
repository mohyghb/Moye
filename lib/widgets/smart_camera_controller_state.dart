import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// an abstract state that helps you to initialize and dispose the camera correctly
/// you can listen or get updates for various callbacks from this abstract class as well
abstract class SmartCameraControllerState<T extends StatefulWidget> extends State<T> with WidgetsBindingObserver {

  late List<CameraDescription> cameras;
  late CameraController cameraController;
  StreamController<CameraController> cameraControllerStream = StreamController();

  CameraDescription get rearCamera => cameras[0];
  /// This is the time that we delay the initialization for camera controller
  /// This would make sure that things are loaded more smoothly. You can override it
  /// and change this value to your likings
  Duration get delayInitialization => Duration(milliseconds: 200);


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // add a delay between initializing the camera view and the view being loaded
      await Future.delayed(delayInitialization);
      initStateAsync();
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        if (cameraController.value.isStreamingImages) {
          cameraController.stopImageStream();
        }
        break;
      case AppLifecycleState.resumed:
        if (!cameraController.value.isStreamingImages) {
          await startImageStream();
        }
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    cameraController.dispose();
    super.dispose();
  }


  void initStateAsync() async {
    WidgetsBinding.instance?.addObserver(this);
    // Camera initialization
    initializeCamera();
  }

  /// Initializes the camera by setting [cameraController]
  void initializeCamera() async {
    cameras = await availableCameras();

    // cameras[0] for rear-camera
    cameraController = createCameraController();

    cameraController.initialize().then((_) async {
      await startImageStream();

      onCameraControllerInitialized();

      // refresh the state so that camera preview is shown
      cameraControllerStream.add(cameraController);
    });
  }

  /// create and return a [CameraController]
  CameraController createCameraController() {
    return CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);
  }


  /// Starts the image stream
  Future<void> startImageStream() async {
    return cameraController.startImageStream(onCameraImageAvailable);
  }

  /// This is called once when the camera controller is initialized
  void onCameraControllerInitialized(){}

  /// This function receives the images from image stream of [cameraController]
  void onCameraImageAvailable(CameraImage cameraImage) {}

}