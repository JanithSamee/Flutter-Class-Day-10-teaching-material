import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

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
    final stream = CreateStream();
    return Center(
      child: Column(
        children: [
          StreamBuilder(
              stream: stream.getStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasData) {
                    return Text(
                      "data : ${snapshot.data}",
                      style: const TextStyle(fontSize: 24),
                    );
                  } else {
                    return Text(
                      "data : ${snapshot.error}",
                      style: const TextStyle(fontSize: 24),
                    );
                  }
                }
              }),
          ElevatedButton(
              onPressed: () {
                stream.subToStream("Day 11");
              },
              child: const Text("send")),
        ],
      ),
    );
  }
}

class CreateStream {
  final _controller = StreamController<dynamic>();
  late IOWebSocketChannel channel;

  CreateStream() {
    _connect();
  }

  Future<void> _connect() async {
    try {
      final wsUrl = Uri.parse('- websocket url - ');
      channel = IOWebSocketChannel.connect(wsUrl);
      await channel.ready;
      channel.sink.add("Client Connected");
      _controller.addStream(channel.stream);
    } catch (e) {
      _controller.sink.addError("error!");
      _controller.close();
    }
  }

  Stream<dynamic> getStream() {
    return _controller.stream;
  }

  void subToStream(String message) {
    channel.sink.add(message);
  }
}
