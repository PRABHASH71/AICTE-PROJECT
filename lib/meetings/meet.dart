import 'dart:convert';
import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'settings.dart';

class Meetings extends StatefulWidget {
  final String? channelName;
  final ClientRole? role;
  const Meetings({
    Key? key,
    this.channelName,
    this.role,
  }) : super(key: key);

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  bool _loading = true;
  String tempToken = "";
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver.prabhashranjan1.repl.co/access_token?channelName=test";

    Response _response = await get(Uri.parse(link));

    Map data = jsonDecode(_response.body);
    setState(() {
      tempToken = data["token"];
      print(data["token"]);
    });
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add('APP_ID missing, please provide your APP_ID');
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
    _addAgoraEventHandler();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1920);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(tempToken, widget.channelName!, null, 0);
    Future.delayed(Duration(seconds: 1))
        .then((value) => setState(() => _loading = false));
  }

  final _users = <int>[];
  final _infoStrings = <String>[];
  bool mute = false;
  bool viewPanel = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    _users.clear();
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  void _addAgoraEventHandler() {
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        setState(() {
          final info = 'Error : $code';
          _infoStrings.add(info);
        });
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          final info = "Join Channel: $channel, uid : $uid";
          _infoStrings.add(info);
        });
      },
      leaveChannel: (stats) {
        setState(() {
          _infoStrings.add('Leave Channel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          final info = 'User Joined: $uid';
          _infoStrings.add(info);
          _users.add(uid);
        });
      },
      userOffline: (uid, elapsed) {
        setState(() {
          final info = 'User Offline : $uid';
          _infoStrings.add(info);
          _users.remove(uid);
        });
      },
      firstRemoteVideoFrame: (uid, width, height, elapsed) {
        setState(() {
          final info = 'first Remote Video: $uid ${width} x $height';
          _infoStrings.add(info);
        });
      },
    ));
  }

  Widget _viewRows() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    for (var uid in _users) {
      list.add(RtcRemoteView.SurfaceView(
        uid: uid,
        channelId: widget.channelName!,
      ));
    }
    final views = list;
    return Column(
      children: List.generate(
        views.length,
        (index) => Expanded(
          child: views[index],
        ),
      ),
    );
  }

  Widget _toolbar() {
    if (widget.role == ClientRole.Audience) return SizedBox();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              setState(() {
                mute = !mute;
              });
              _engine.muteLocalAudioStream(mute);
            },
            child: Icon(
              mute ? Icons.mic_off : Icons.mic,
              color: mute ? Colors.red : Colors.white,
              size: 20,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: mute ? Colors.white : Colors.red,
            padding: EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35,
            ),
            shape: CircleBorder(),
            fillColor: Colors.redAccent,
            padding: EdgeInsets.all(15),
            elevation: 2.0,
          ),
          RawMaterialButton(
            onPressed: () {
              _engine.switchCamera();
            },
            child: Icon(
              Icons.flip_camera_ios,
              color: Colors.white,
              size: 20,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: EdgeInsets.all(12.0),
          ),
        ],
      ),
    );
  }

  Widget _panel() {
    return Visibility(
      visible: viewPanel,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 48),
        alignment: Alignment.bottomCenter,
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 48),
            child: ListView.builder(
                reverse: true,
                itemCount: _infoStrings.length,
                itemBuilder: (BuildContext context, int index) {
                  if (_infoStrings.isEmpty) {
                    return Text("null");
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              _infoStrings[index],
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A.I.C.T.E MEETINGS"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                viewPanel = !viewPanel;
              });
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: <Widget>[
                  _viewRows(),
                  _panel(),
                  _toolbar(),
                ],
              ),
      ),
    );
  }
}
