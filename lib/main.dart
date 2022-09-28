import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const appTitle = 'Native2Flutter Demo';
const flutterMethodName = 'invoke_flutter';
const nativeMethodName = 'invoke_native_method';
const methodChannelName = 'com.native2flutter';
const platform = MethodChannel(methodChannelName);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const buttonTitle = "Invoke Native Method";

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleMethod);
  }

  Future<void> _invokeNativeMethod() async {
    await platform.invokeMethod(nativeMethodName);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case flutterMethodName:{
        print(call.method);
        print(call.arguments);
        return Future.value(call.arguments);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: _invokeNativeMethod,
          child: const Text(buttonTitle),
        ),
      ),
    );
  }
}
