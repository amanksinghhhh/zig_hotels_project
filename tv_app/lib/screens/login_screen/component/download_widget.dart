// import 'package:flutter/cupertino.dart';
//
// class MyWidget extends StatelessWidget {
//   final String apkUrl = ‘YOUR_APK_URL_HERE’;
//   Future<void> _downloadAndInstallApk() async {
//     try {
//       final taskId = await FlutterInstallApk.installApk(apkUrl);
//       if (taskId != null) {
//         // Installation started successfully
//         // You can listen for installation completion if needed
//       }
//     } catch (e) {
//       // Error occurred during installation
//       print(‘Error: $e’);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _downloadAndInstallApk,
//           child: Text(‘Download and Install APK’),
//         ),
//       ),
//     );
//   }
// }
