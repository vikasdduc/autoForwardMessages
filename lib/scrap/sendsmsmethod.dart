// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
//
// class flutterSms extends StatelessWidget {
//   flutterSms({Key? key}) : super(key: key);
//
//
//   List<String> recipents = ["8586875379"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             onPressed: () {
//               _sendSMS("This is a test message!", recipents);
//
//
//             },
//             child: const Text("Send Sms",
//               style: TextStyle(color: Colors.black),
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _sendSMS(String message, List<String> recipents) async {
//     String _result = await sendSMS(message: message, recipients: recipents)
//         .catchError((onError) {
//       print(onError);
//     });
//     print(_result);
//   }
// }