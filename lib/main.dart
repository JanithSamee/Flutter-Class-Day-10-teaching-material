import 'dart:async';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Form App"),
      ),
      body: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  String? address = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
                onSaved: (value) => setState(() {
                      address = value;
                    }),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Value is Empty";
                  } else if (value == "123") {
                    return "Address can not be 123";
                  }
                  return null;
                },
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please Input 2",
                    helperText: "Ex: Address",
                    labelText: "Address")),
          ),
          ElevatedButton(
              onPressed: () {
                var validation = _formKey.currentState?.validate();
                if (validation != null && validation == true) {
                  // get values
                  _formKey.currentState?.save();
                }
              },
              child: const Text("Submit")),
          Text("form data :$address")
        ],
      ),
    );
  }
}
