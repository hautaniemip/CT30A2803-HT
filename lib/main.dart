import 'package:flutter/material.dart';

import 'sections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CT30A2803 LPR Group 6',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CT30A2803 LPR Group 6'),
        ),
        body: Row(
          children:[
            
            CustomMainSection(),
          ],
        )
      ),
    );
  }
}



