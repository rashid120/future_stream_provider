
import 'package:flutter/material.dart';
import 'package:future_stream_provider/screens/future_provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureProviderClass(),
    );
  }
}
