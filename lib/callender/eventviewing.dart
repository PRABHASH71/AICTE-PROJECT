import 'package:login/callender/event.dart';
import 'package:login/callender/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewPage extends StatelessWidget {
  final Event event;
  const EventViewPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Text(event.title,
              style: TextStyle(
                fontSize: 18,
              ))
        ],
      ));
}
