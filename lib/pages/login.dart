import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  String url =
      "https://accounts.spotify.com/authorize?client_id=c03736df76424cde8deda585b4bfbad8&response_type=code&redirect_uri=http://10.0.0.108/api/spotify/login/callback&scope=user-read-private playlist-read-private user-top-read user-follow-modify user-library-modify user-modify-playback-state user-read-playback-state user-read-currently-playing app-remote-control user-follow-read user-read-recently-played streaming user-library-read user-read-email&state=20c1bf22-d300-4582-9ffa-a12f39d1bd58";

  String token;

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      print("destroy");
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print("onStateChanged: ${state.type} ${state.url}");
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          print("URL changed: $url");
          if (url.startsWith("http://10.0.0.108/api/spotify/login/callback")) {
            flutterWebviewPlugin.close();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("./assets/login/l03.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
              width: 300,
              child: FlatButton(
                onPressed: () {
                  print("hey");
                  flutterWebviewPlugin.launch(url);
                },
                color: Color.fromRGBO(30, 215, 96, 1),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/spotify-logo/Spotify_Icon_CMYK_White.png",
                      width: 22.0,
                      height: 22.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "LOGIN COM SPOTIFY",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Roboto",
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )),
        ) /* add child content here */,
      ),
    );
  }
}
