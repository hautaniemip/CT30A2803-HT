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
        Button(label: 'System shutdown', secondaryLabel: 'System startup', color: Colors.redAccent, secondaryColor: Colors.greenAccent,),
      ],
    );

    Widget homeSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Panel Home View',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const Text(
          'Current source: HDMI',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Container(
          width: 960,
          height: 540,
          color: Colors.black,
          child: const Center(
            child: Text(
              'NO SIGNAL',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );

    Widget projectorSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Projector Controls',
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const Button(label: 'Projector shutdown', secondaryLabel: 'Projector startup', color: Colors.redAccent, secondaryColor: Colors.greenAccent,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Button(label: 'Source', color: Colors.grey,),
            Button(icon: Icons.keyboard_arrow_up, color: Colors.grey,),
            Button(label: 'Menu', color: Colors.grey,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Button(icon: Icons.keyboard_arrow_left, color: Colors.grey,),
            Button(label: 'Select', color: Colors.grey,),
            Button(icon: Icons.keyboard_arrow_right, color: Colors.grey,),
          ],
        ),
        const Button(icon: Icons.keyboard_arrow_down, color: Colors.grey,),
      ],
    );

    Widget screenSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Screen Controls',
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        Button(icon: Icons.keyboard_arrow_up, color: Colors.grey,),
        Button(label: 'STOP', color: Colors.grey,),
        Button(icon: Icons.keyboard_arrow_down, color: Colors.grey,),
      ],
    );

    Widget roomLightSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Room Light Controls',
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        const Text(
          'Manual control',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const LightSlider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Button(label: 'Dim', color: Colors.grey,),
                Button(label: 'Dimmest', color: Colors.grey,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Button(label: 'Bright', color: Colors.grey,),
                Button(label: 'Brightest', color: Colors.grey,),
              ],
            )
          ],
        ),
      ],
    );

    Widget sourceSection = Column(
      children: [
        const Text(
          'Source',
          style: TextStyle(
            fontSize: 60,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Button(label: 'HDMI', color: Colors.grey,),
                Button(label: 'VGA', color: Colors.grey,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Button(label: 'DP', color: Colors.grey,),
                Button(label: 'Share Screen', color: Colors.grey,),
              ],
            ),
          ],
        ),
      ],
    );

    Widget mainSection = Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sourceSection,
        ],
      ),
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
            mainSection,
          ],
        )
      ),
    );
  }
}

class Button extends StatefulWidget {
  const Button({
    Key? key,
    this.label = '',
    this.secondaryLabel,
    this.icon,
    this.width = 100,
    this.height = 100,
    this.padding = 16,
    this.color = Colors.white10,
    this.secondaryColor,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String? secondaryLabel;
  final IconData? icon;
  final double width;
  final double height;
  final double padding;
  final Color color;
  final Color? secondaryColor;
  final ValueChanged<bool>? onTap;

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
      if (widget.onTap != null) {
        widget.onTap!(active);
      }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              if (widget.icon != null)
                Icon(widget.icon),
              if (widget.label != '')
                Text(
                  active ? widget.label : (widget.secondaryLabel ?? widget.label),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LightSlider extends StatefulWidget {
  const LightSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LightSliderState();
}

class LightSliderState extends State<LightSlider> {
  double currentValue = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Slider(
        value: currentValue,
        max: 100,
        divisions: 20,
        label: currentValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            currentValue = value;
          });
        },
      ),
    );
  }
}


