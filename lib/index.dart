import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'meet.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRole? _role = ClientRole.Broadcaster;
  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEETINGS'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                TextField(
                  controller: _channelController,
                  decoration: InputDecoration(
                    errorText:
                        _validateError ? 'Channel name is mandatory' : null,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 61, 61, 61)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    hintText: 'Channel name',
                  ),
                ),
                RadioListTile(
                  title: Text('BroadCaster'),
                  onChanged: (ClientRole? value) {
                    setState(() {
                      _role = value;
                    });
                  },
                  value: ClientRole.Broadcaster,
                  groupValue: _role,
                ),
                RadioListTile(
                  title: Text('Audience'),
                  onChanged: (ClientRole? value) {
                    setState(() {
                      _role = value;
                    });
                  },
                  value: ClientRole.Audience,
                  groupValue: _role,
                ),
                ElevatedButton(
                  onPressed: onJoin,
                  child: Text('Join'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(double.infinity, 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Meetings(
              channelName: _channelController.text,
              role: _role,
            ),
          ));
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }
}
