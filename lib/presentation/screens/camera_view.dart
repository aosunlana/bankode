// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
//
// class TakePicture extends StatefulWidget {
//   const TakePicture({Key? key, required this.camera}) : super(key: key);
//   final CameraDescription camera;
//
//   @override
//   _TakePictureState createState() => _TakePictureState();
// }
//
// class _TakePictureState extends State<TakePicture> {
//   late final CameraController _controller;
//   late final Future<void> _initController;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(widget.camera, ResolutionPreset.max);
//     _initController = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         FutureBuilder<void>(
//           future: _initController,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return Expanded(
//                 child: Center(
//                   child: AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: CameraPreview(_controller),
//                 ),
//               ),
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//     ),
//
//         IconButton(onPressed: ()=> '', icon: const Icon(Icons.photo_camera))
//       ],
//     );
//   }
// }
