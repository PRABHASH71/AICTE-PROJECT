import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/CalenderWidget.dart';
import 'package:login/eventediting.dart';

class notifi extends StatefulWidget {
  const notifi({Key? key}) : super(key: key);

  @override
  State<notifi> createState() => _notifiState();
}

class _notifiState extends State<notifi> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 21, 20, 21),
            title: const Text(
              " EVENTS",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          body: CalenderWidget(),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 11, 4, 22),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage()),
            ),
          ),
        ),
      ),
    );
  }
}
