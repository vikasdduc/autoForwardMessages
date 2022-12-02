
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

import 'package:url_launcher/url_launcher.dart';
//import '../smsRead/sms_read_screen.dart';

onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}

backgrounMessageHandler(SmsMessage message) async {
  // Handle background message
  Telephony.backgroundInstance.sendSms(to: "7011280055", message: "Message from background");

}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('sendSms');

  String _message = "";
  Telephony telephony = Telephony.instance;

 // ReadSms instance = ReadSms();
  TextEditingController saveNumber = TextEditingController();
  List list1 = ['Token Area\n','Device Id for Firebase Notification'];

  @override
  initState(){
    getdata();
   // _textMe();
  // saveNumber.text = getdata();
    initPlatformState();
  super.initState();
}

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
      //var textvar = _message;
    });
    setState(() {
      sendSms();
     // _textMe();
    });
  }
  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
        onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage,);
    }
  }

 // getdata(data)async{
 //   SharedPreferences prefs =  await SharedPreferences.getInstance();
 //   var spNumber = data ;
 //
 //   prefs.setString('number', spNumber);
 // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),

            TextField(
              maxLength: 10,
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                    labelText: "phone Number",
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.redAccent)
                    ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.redAccent)
                  ),
                ),
              controller: saveNumber,
              // onChanged: (value){
              //   if(value == saveNumber.text && value.length >= 10){
              //     _textMe();
              //   }
              //   // if(value.length>=10){
              //   //   _textMe();
              //   // }
              // },
              //onChanged:(x)=> getdata(x),
               //   (saveNumber){
                // var spNumber = saveNumber ;
                //
                // prefs.setString('number', spNumber);

             // }
            ),
            const SizedBox(height: 5),


            MaterialButton(
                color: Colors.red,
              child: const Text("Save",style: TextStyle(color: Colors.white),),
                onPressed: ()async{
               setState(() {
                 list1.add(saveNumber.text);
               });
                  SharedPreferences prefs =  await SharedPreferences.getInstance();
                  prefs.setString('number', saveNumber.text);
                 // prefs.setStringList("key", list1);
                }

            ),

            const SizedBox(height: 10,),
            Container(
              constraints: const BoxConstraints(maxHeight: 100,maxWidth: double.infinity),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 2,color: Colors.red),
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: Expanded(
                child:
                //Column(children:  List.generate(list1.length, (index) => Text(list1[index].toString()),))
                ListView.builder(
                  itemCount: list1.length,
                    itemBuilder: (context, index) {
                    return  Center(child: Text(list1[index].toString(),style: const TextStyle(color: Colors.black),));
                    } ),
              ),
            ),
            const SizedBox(height: 5,),
            // for(var i=0; i<list1.length; i++)
            //   Container(
            //     child: Text(list1[i].toString()),
            //   )

           // ReadSms(saveNumb:saveNumber,),
            Center(
              child: Text("Latest Recived Sms: $_message"),
            ),

            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    sendSms();
                  });

                      // await telephony.sendSms(
                      //   to: '8168673754',
                      //   message: 'From Flutter',
                      //   statusListener: (s) => print(s.name),
                      // );
                },
              child: const Text("SEND SMS.p"),
            ),
          ],

        ),
      ),
    );
  }

  _textMe() async {
    // Android
    var url = Uri.parse('sms:${saveNumber.text}?body=$_message');
    if (await canLaunchUrl(url) && saveNumber.text != null) {
      await launchUrl(url);
    } else {
      // iOS
      var url = Uri.parse('sms:9899387370?body=hello%20there');
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }


  getdata()async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    //var spNumber = saveNumber ;

   String? cgcg= await prefs.getString('number');
   setState(() {
     if (cgcg != null) {
       saveNumber.text = cgcg;
     }
   });

    //return cgcg;
  }

  Future<void> sendSms()async {
    print("........SendSMS.........");
    try {
      final String result = await platform.invokeMethod(
          'send',
          <String, dynamic>{
            "phone": "Sender Name: ${saveNumber.text}",    //"9958373754",
            "msg": "Body: $_message"    //"Hello! I'm sent programatically."
          }
          );
      print(result);

    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

}