// import 'dart:io';
//
// import 'package:android_intent/android_intent.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class UpdateAppScreen extends StatefulWidget {
//   const UpdateAppScreen({super.key});
//
//   @override
//   State<UpdateAppScreen> createState() => _UpdateAppScreenState();
// }
//
// class _UpdateAppScreenState extends State<UpdateAppScreen> {
//   final String apkUrl =
//       'https://firebasestorage.googleapis.com/v0/b/zighotels.appspot.com/o/app%2Fapp-release.apk?alt=media&token=4d35f24f-c8a3-4ff2-a49f-c97178051e0b';
//   bool downloading = false;
//   double downloadProgress = 0.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('APK Downloader'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (downloading)
//               CircularPercentIndicator(
//                 radius: 120.0,
//                 lineWidth: 10.0,
//                 percent: downloadProgress,
//                 center: Text('${(downloadProgress * 100).toStringAsFixed(2)}%'),
//                 progressColor: Colors.blue,
//               ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 if (!downloading) {
//                   _downloadAndInstallApk();
//                 }
//               },
//               child: Text(downloading ? 'Downloading...' : 'Download APK'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _downloadAndInstallApk() async {
//     final permissionStatus = await Permission.storage.request();
//     if (permissionStatus.isGranted) {
//       setState(() {
//         downloading = true;
//         downloadProgress = 0.0;
//       });
//
//       final savedDir = await getExternalStorageDirectory();
//       final savePath = '${savedDir!.path}/app.apk';
//
//       final dio = Dio();
//       await dio.download(
//         apkUrl,
//         savePath,
//         onReceiveProgress: (receivedBytes, totalBytes) {
//           if (totalBytes != -1) {
//             setState(() {
//               downloadProgress = receivedBytes / totalBytes;
//             });
//           }
//         },
//       );
//
//       setState(() {
//         downloading = false;
//       });
//
//       if (Platform.isAndroid) {
//         final intent = AndroidIntent(
//           action: 'action_view',
//           data: savePath,
//           type: 'application/vnd.android.package-archive',
//         );
//         await intent.launch();
//       }
//     } else {
//       print('Permission denied');
//     }
//   }
// }
