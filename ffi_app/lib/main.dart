// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, unnecessary_brace_in_string_interps, avoid_print

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import "package:ffi/ffi.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

typedef RustType = Pointer<Utf8> Function(
  Pointer<Utf8> syncBalance,
);
typedef DartType = Pointer<Utf8> Function();

class _MyHomePageState extends State<MyHomePage> {
  String response = "";
  bool isChecked = false;
  bool isNative = true;

  final TextEditingController _controller = TextEditingController(text: '1');

  Future<void> ffiWallet(i) async {
    final DynamicLibrary rustLib = DynamicLibrary.open("libbdkrust.so");
    final func = rustLib.lookupFunction<RustType, RustType>('init_wallet');
    final resp = func((isChecked ? "true" : "false").toNativeUtf8()).toDartString();
    print("======================\nIndex:${i}\n${resp}\n======================");
  }

  Future<void> _calculateIt() async {
    setState(() {
      response = "Please wait.......";
    });
    var responseText = "";
    if (_controller.text.isNotEmpty) {
      var times = int.tryParse(_controller.text);
      if (times.runtimeType == int && times! > 0) {
        Stopwatch stopwatch = Stopwatch()..start();
        for (var i = 1; i <= times; i++) {
          await ffiWallet(i);
          setState(() {
            var x = "${i}::::${stopwatch.elapsed}";
            print(x);
            response = x;
          });
        }
        responseText = 'Executed in ${stopwatch.elapsed}';
        print(responseText);
      } else
        responseText = "Input should be valid number and should be greater than 1";
    } else
      responseText = "Please enter input";
    setState(() {
      response = responseText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FFI App")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seed, Wallet and Sync",
              style: TextStyle(fontSize: 25),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number to times to run",
              ),
              controller: _controller,
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Sync balance"),
              ],
            ),
            ElevatedButton(onPressed: () => _calculateIt(), child: Text("Calculate it!!")),
            SelectableText(response)
          ],
        ),
      ),
    );
  }
}
