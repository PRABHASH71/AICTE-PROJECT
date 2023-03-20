import "package:flutter/material.dart";
import 'package:login/Fellowship.dart';
import 'package:login/ApproveRequest/approvaladmin.dart';

import 'package:login/email.dart';
import 'package:login/event.dart';
import 'package:login/help.dart';
import 'package:login/index.dart';
import 'package:login/meet.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/admindashboard/profile_screen.dart';
import 'package:login/scheme.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  List pages = [
    ProfileScreen(),
    IndexPage(),
    appadmin(),
    notifi(),
    scheme(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: pages[currentIndex],
    );
  }
}
