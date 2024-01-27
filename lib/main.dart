import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Stream App"),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: CreateStream().getStream(),
        builder: (context, snapshot) => Center(
            child: snapshot.connectionState == ConnectionState.waiting
                ? const CircularProgressIndicator()
                : Text(
                    "data : ${snapshot.data}",
                    style: const TextStyle(fontSize: 24),
                  )));
  }
}

class CreateStream {
  final _controller = StreamController<dynamic>();

  CreateStream() {
    _connect();
  }

  Future<void> _connect() async {
    try {
      final wsUrl = Uri.parse(
          'wss://demo.piesocket.com/v3/channel_12?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm');
      final channel = WebSocketChannel.connect(wsUrl);
      await channel.ready;
      _controller.addStream(channel.stream);
    } catch (e) {
      _controller.sink.addError("error!");
      _controller.close();
    }
  }

  Stream<dynamic> getStream() {
    return _controller.stream;
  }
}
