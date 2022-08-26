// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter Your Email and we will send you password reset link",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Email",
                  fillColor: Color.fromARGB(255, 230, 217, 217),
                  filled: true,
                ),
              ),
            ),
            MaterialButton(
              onPressed: passwordReset,
              child: Text("Reset Password"),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
