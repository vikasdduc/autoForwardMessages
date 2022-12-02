// import 'package:flutter/material.dart';
//
// import 'package:telephony/telephony.dart';
//
// onBackgroundMessage(SmsMessage message) {
//   debugPrint("onBackgroundMessage called");
//
// }
//
// backgrounMessageHandler(SmsMessage message) async {
//   // Handle background message
//   Telephony.backgroundInstance.sendSms(to: "7011280055", message: "Message from background");
//
// }
//
// class ReadSms extends StatefulWidget {
//   TextEditingController? saveNumb;
//    ReadSms({Key? key,saveNumb})
//    {this.saveNumb = saveNumb;}
//
//   @override
//   State<ReadSms> createState() => _ReadSmsState();
// }
//
// class _ReadSmsState extends State<ReadSms> {
//  // static const platform = MethodChannel('sendSms');
//   String _message = "";
//   Telephony telephony = Telephony.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     //_textMe();
//     initPlatformState();
//   }
//
//   onMessage(SmsMessage message) async {
//     setState(() {
//       _message = message.body ?? "Error reading message body.";
//       var textvar = _message;
//     });
//   }
//
//
//
//
//   onSendStatus(SendStatus status) {
//     setState(() {
//       _message = status == SendStatus.SENT ? "sent" : "delivered";
//     });
//   }
//
//
//
//
//   Future<void> initPlatformState() async {
//     final bool? result = await telephony.requestPhoneAndSmsPermissions;
//
//     if (result != null && result) {
//       telephony.listenIncomingSms(
//           onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage,  );
//     }
//
//
//     // if (result != null && result){
//     //   await telephony.sendSms(
//     //       to: "8586875379;8168673754;7755817724",
//     //     message: "How are you?",
//     //       //statusListener: listener
//     //
//     //   );
//     // }
//
//
//     // await telephony.sendSmsByDefaultApp(
//     //     to: "8168673754",
//     //     message: "May the force be with you!"
//     // );
//
//    // if (!mounted) return;
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Center(
//             child: Text("Latest Recived Sms: $_message"),
//           ),
//
//           MaterialButton(onPressed: ()async{
//             // setState(() async {
//             //   SharedPreferences prefs = await SharedPreferences.getInstance();
//             //    prefs.getString('Snumber');
//             //
//             // });
//             await telephony.openDialer("9643991061");
//                },
//           child: const Text("Dialer",style: TextStyle(color: Colors.red),)
//
//           ),
//            MaterialButton(onPressed: ()async{
//                  initPlatformState();
//                  },
//              child: const Text("send manually",style: TextStyle(color: Colors.red),),
//                  ),
//           MaterialButton(onPressed: ()async{
//             // _textMe();
//           },
//             child: const Text("send by url",style: TextStyle(color: Colors.red),),
//           ),
//         ]
//       ),
//     );
//   }
//
//   // _textMe() async {
//   //   // Android
//   //   var url = Uri.parse('sms:${widget.saveNumb!.text}?body=hello%20there');
//   //   if (await canLaunchUrl(url)) {
//   //     await launchUrl(url);
//   //   } else {
//   //     // iOS
//   //     var url = Uri.parse('sms:9899387370?body=hello%20there');
//   //     if (await canLaunchUrl(url)) {
//   //       await launchUrl(url);
//   //     } else {
//   //       throw 'Could not launch $url';
//   //     }
//   //   }
//   // }
//
//   // Future<Null> sendSms()async {
//   //   print("SendSMS");
//   //   try {
//   //     final String result = await platform.invokeMethod('send',
//   //         <String, dynamic>{
//   //           "phone": "+918168673754",
//   //           "msg": "Hello! I'm sent programatically."
//   //         }); //Replace a 'X' with 10 digit phone number
//   //     print(result);
//   //   } on PlatformException catch (e) {
//   //     print(e.toString());
//   //   }
//   //
//   //   saveSms() async {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     prefs.setString('Snumber', '9643991061');
//   //   }
//   //
//   //   getSms() async {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     prefs.getString('Snumber');
//   //   }
//   //  }
//
// }
