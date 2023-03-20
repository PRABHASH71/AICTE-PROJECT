import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/event_provider.dart';
import 'package:login/first.dart';
import 'package:login/inslogin.dart';
import 'package:login/insreg.dart';
import 'package:login/instdashboard/insthome.dart';
import 'package:login/instmeet.dart';
import 'package:login/login.dart';
import 'package:login/noti.dart';
import 'package:login/admindashboard/profile_screen.dart';
import 'package:login/sign.dart';
import 'package:login/splashscreen.dart';
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
