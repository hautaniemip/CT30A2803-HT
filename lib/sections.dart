import 'package:flutter/material.dart';

import 'widgets.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HomeSection(),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class ProjectorSection extends StatelessWidget {
  const ProjectorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class ScreenSection extends StatelessWidget {
  const ScreenSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class RoomLightSection extends StatelessWidget {
  const RoomLightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class SourceSection extends StatelessWidget {
  const SourceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Default source'),
            Dropdown(items: <String>['HDMI', 'DP', 'VGA', 'Share Screen'],),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Default light mode'),
            Dropdown(items: <String>['Dimmest', 'Dim', 'Bright', 'Brightest'],),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Dark mode'),
            DarkModeSwitch(),
          ],
        )
      ],
    );
  }
}