import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget menuSection = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Button(label: 'Projector Controls', color: Colors.grey, secondaryColor: Colors.lightGreen,),
        Button(label: 'Screen controls', color: Colors.grey, secondaryColor: Colors.lightGreen,),
        Button(label: 'Room light control', color: Colors.grey, secondaryColor: Colors.lightGreen,),
        Button(label: 'Source', color: Colors.grey, secondaryColor: Colors.lightGreen,),
        Button(label: 'Settings', color: Colors.grey, secondaryColor: Colors.lightGreen,),
        Padding(padding: EdgeInsets.all(16)),
        Button(label: 'System shutdown', color: Colors.redAccent, secondaryColor: Colors.greenAccent,),
      ],
    );
    
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
          children: [
            menuSection,
          ],
        )
      ),
    );
  }

  Padding buildButton(Color color, String label, double width, double height, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: () {
          print("Container clicked");
        },
        child: Ink(
          color: color,
          width: width,
          height: height,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    Key? key,
    this.label = '',
    this.width = 100,
    this.height = 100,
    this.padding = 16,
    this.color = Colors.white10,
    this.secondaryColor
  }) : super(key: key);

  final String label;
  final double width;
  final double height;
  final double padding;
  final Color color;
  final Color? secondaryColor;

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: InkWell(
        onTap: handleTap,
        child: Ink(
          color: active ? widget.color : (widget.secondaryColor ?? widget.color),
          width: widget.width,
          height: widget.height,
          child: Center(
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


