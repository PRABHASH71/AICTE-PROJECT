import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/callender/event_provider.dart';
import 'package:login/firstscreen/first.dart';
import 'package:login/instlogin/inslogin.dart';
import 'package:login/instdashboard/insreg.dart';
import 'package:login/instdashboard/insthome.dart';
import 'package:login/meetings/instmeet.dart';
import 'package:login/adminlogin/login.dart';
import 'package:login/callender/noti.dart';
import 'package:login/admindashboard/profile_screen.dart';
import 'package:login/adminlogin/sign.dart';
import 'package:login/firstscreen/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => SplashScreen(),
            "home": (context) => HomePage(),
            "sign": (context) => sign(),
            "notif": (context) => notifi(),
            "inslog": (context) => inslog(),
            "insreg": (context) => insreg(),
            "insthome": (context) => insthome(),
            "instmeet": (context) => instMeet(),
          },
        ),
      );
}
