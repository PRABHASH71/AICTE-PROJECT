import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 150, horizontal: 77),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/m.png'),
          SizedBox(
            height: 60,
          ),
          TextButton(
            style: TextButton.styleFrom(
                shadowColor: Colors.red,
                primary: Colors.white,
                backgroundColor: Colors.deepPurple,
                textStyle: TextStyle(fontSize: 10),
                elevation: 20,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
            child: Text(
              'AS ADMIN',
              // ignore: prefer_const_constructors
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 253, 254, 255),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
                shadowColor: Colors.red,
                primary: Colors.white,
                backgroundColor: Colors.deepPurple,
                textStyle: TextStyle(fontSize: 10),
                elevation: 30,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            onPressed: () {
              Navigator.pushNamed(context, 'inslog');
            },
            child: Text(
              'INSTITUTION',
              // ignore: prefer_const_constructors
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 253, 254, 255),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 206, 35, 23),
            Colors.orangeAccent,
            Colors.white,
            Colors.green,
            Color.fromARGB(255, 9, 93, 12),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
