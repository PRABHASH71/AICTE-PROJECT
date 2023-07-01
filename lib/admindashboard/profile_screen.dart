import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login/fellowship/Fellowship.dart';
import 'package:login/ApproveRequest/approvaladmin.dart';

import 'package:login/emaildesk/email.dart';
import 'package:login/helpdesk/help.dart';
import 'package:login/meetings/index.dart';
import 'package:login/adminlogin/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:login/meetings/meet.dart';
import 'package:login/callender/noti.dart';
import 'package:login/aboutaicte/personal.dart';

import 'package:login/shemes/scheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(milliseconds: 500));
  }

  final Uri _url =
      Uri.parse('https://www.staysafeonline.in/quad-cyber-challenge');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  final Uri _url1 = Uri.parse('https://1crore.aicte-india.org/');
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url1');
    }
  }

  final Uri _url2 = Uri.parse('https://staysafeonline.in/quiz');
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw Exception('Could not launch $_url2');
    }
  }

  final Uri _url3 = Uri.parse('https://crypticsingh.com/index.aspx');
  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw Exception('Could not launch $_url3');
    }
  }

  @override
  final Controll = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 168, 225, 244),
          appBar: AppBar(
              centerTitle: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                        colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //   padding:
                      //       EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      //   child: TextFormField(
                      //     controller: Controll,
                      //     decoration: InputDecoration(
                      //         // suffixIcon: IconButton(
                      //         //   icon: Icon(Icons.search),
                      //         //   onPressed: () {
                      //         //     Navigator.push(
                      //         //         context,
                      //         //         MaterialPageRoute(
                      //         //             builder: (context) => SearchPage(
                      //         //                   q1: Controll,
                      //         //                 )));
                      //         //   },
                      //         // ),
                      //         floatingLabelBehavior:
                      //             FloatingLabelBehavior.never,
                      //         hintText: "         Search Your Topic",
                      //         labelStyle: TextStyle(color: Colors.grey),
                      //         filled: true,
                      //         fillColor: Colors.white,
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(40),
                      //         ),
                      //         isDense: true),
                      //   ),
                      // ),
                    ],
                  )),
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              title: const Text(
                " AICTE APP",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              elevation: 4.0,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => help()));
                  },
                  icon: Icon(Icons.lightbulb),
                ),
              ]),
          body: LiquidPullToRefresh(
            onRefresh: _handlerefresh,
            color: Colors.blue,
            height: 200,
            animSpeedFactor: 5,
            showChildOpacityTransition: false,
            backgroundColor: Color.fromARGB(255, 3, 249, 249),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ],
                        borderRadius: BorderRadius.circular(.0),
                        image: DecorationImage(
                          image: AssetImage('assets/vj4.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ListTile(
                        onTap: _launchUrl,
                      ),
                    ),
                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ],
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: AssetImage('assets/vj2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ListTile(
                        onTap: _launchUrl1,
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ],
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: AssetImage('assets/vj3.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ListTile(
                        onTap: _launchUrl3,
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ],
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: AssetImage('assets/vj1.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ListTile(
                        onTap: _launchUrl2,
                      ),
                    ),

                    //5th Image of Slider
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ],
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: AssetImage('assets/vj2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: ListTile(
                        onTap: _launchUrl1,
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 190,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 50 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.99,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: EdgeInsets.only(
                        left: 13, top: 10, bottom: 10, right: 13),
                    crossAxisCount: 2,
                    childAspectRatio: .90,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => personal()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          child: Column(
                            children: [
                              Image.asset("assets/org.png"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "ABOUT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => appadmin()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          child: Column(
                            children: [
                              Image.asset("assets/app.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "APPROVAL",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndexPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset("assets/meet2.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "MEETINGS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notifi()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset("assets/ev.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "EVENTS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => approval()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset("assets/fell.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "FELLOWSHIP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => scheme()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Colors.blue,
                                Color.fromARGB(255, 3, 54, 96)
                              ])),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset("assets/scheme.png"),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "SCHEMES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            backgroundColor: Color.fromARGB(255, 5, 39, 66),
            child: const Icon(Icons.login_outlined),
          ),
          drawer: Drawer(
            child: Container(
              width: 100,
              height: 100,
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: Container(
                      child: Column(
                        children: [
                          Material(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60.0)),
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/aa2.png"),
                              radius: 50,
                            ),
                            shadowColor: Color.fromARGB(255, 240, 237, 237),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "AICTE OFFICIAL",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        user.email!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "EMAIL",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => email()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        "ABOUT AICTE",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => personal()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.list_alt_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "SCHEMES",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => scheme()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        gradient: const LinearGradient(colors: [
                          Colors.blue,
                          Color.fromARGB(255, 3, 54, 96)
                        ])),
                    child: ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Color.fromARGB(170, 255, 255, 255),
                      ),
                      title: Text(
                        "HELP DESK",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => help()));
                      },
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 168, 225, 244),
                    Color.fromARGB(255, 168, 225, 244)
                  ])),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 168, 225, 244),
              Color.fromARGB(255, 168, 225, 244)
            ])),
      ),
    );
  }
}
