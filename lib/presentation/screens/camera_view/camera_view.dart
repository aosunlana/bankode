import 'dart:io';
import 'package:bankode/routes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late final CameraController _controller;
  late final Future<void> _initController;
  int selectedCamera = 0;
  List<File> capturedImages = [];

  void initializeCamera(int cameraIndex) {
    _controller =
        CameraController(widget.cameras[cameraIndex], ResolutionPreset.max);
    _initController = _controller.initialize();
  }

  @override
  void initState() {
    super.initState();
    initializeCamera(selectedCamera);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          FutureBuilder<void>(
              future: _initController,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(child: CameraPreview(_controller));
                }
                return const CircularProgressIndicator();
              }),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16),
                vertical: ScreenUtil().setWidth(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (capturedImages.isEmpty) return;
                    Navigator.of(context).pushNamed(RouteGenerator.galleryView,
                        arguments: capturedImages.reversed.toList());
                  },
                  child: Container(
                    height: ScreenUtil().setWidth(60),
                    width: ScreenUtil().setWidth(60),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      image: capturedImages.isNotEmpty
                          ? DecorationImage(
                              image: FileImage(capturedImages.last),
                              fit: BoxFit.cover)
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(16),
                      vertical: ScreenUtil().setWidth(16)),
                  child: GestureDetector(
                    onTap: () async {
                      await _initController;
                      final image = await _controller.takePicture();
                      capturedImages.add(File(image.path));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Picture taken!"),
                        duration: Duration(milliseconds: 600),
                      ));
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.cameras.length > 1) {
                      selectedCamera = selectedCamera == 0 ? 1 : 0;
                      initializeCamera(selectedCamera);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('No secondary camera found'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  icon: const Icon(Icons.switch_camera_rounded,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}


