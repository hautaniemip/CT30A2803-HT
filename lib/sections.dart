import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomMainSection extends StatefulWidget {
  const CustomMainSection({Key? key}) : super(key: key);

  @override
  MenuSection createState() => MenuSection();
}

class MenuSection extends State<CustomMainSection> {
  int _selectedPage = 0;
  final PageController _pageController= PageController();

  void changePage(int pageNum){
    setState(() {
        _selectedPage = pageNum;
        _pageController.animateToPage(pageNum,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn
        );

    });
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabButton(
                label: "Home Page",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 0,
                selectedPage: _selectedPage,
                 onTap: () {
                  changePage(0);
                },
              ),

              TabButton(
                label: "Projector Controls",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 1,
                selectedPage: _selectedPage,
                onTap: () {
                  changePage(1);
                },
              ),

              TabButton(
                label: "Screen controls",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 2,
                selectedPage: _selectedPage,
                onTap: () {
                  changePage(2);
                },
              ),


              TabButton(
                label: "Input Source",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 3,
                selectedPage: _selectedPage,
                onTap: () {
                  changePage(3);
                },
              ),

              TabButton(
                label: "Room light control",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 4,
                selectedPage: _selectedPage,
                onTap: () {
                  changePage(4);
                },
              ),

              TabButton(
                label: "Settings",
                color: Colors.green,
                secondaryColor: Colors.grey,
                pageNumber: 5,
                selectedPage: _selectedPage,
                onTap: () {
                  changePage(5);
                },
              ),

              const Spacer(),
              const Button(
                label: 'System shutdown',
                secondaryLabel: 'System startup',
                color: Colors.redAccent,
                secondaryColor: Colors.greenAccent,
              ),
              const Padding(padding: EdgeInsets.all(16)),
            ],
          ),

          Flexible(
            fit: FlexFit.tight,
            child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _selectedPage = page;
                });
              },
              controller: _pageController,
              children: const [
                HomeSection(),
                ProjectorSection(),
                ScreenSection(),
                SourceSection(),
                RoomLightSection(),
                SettingsSection(),
              ],
            ),
          ),
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
        Padding(
          padding: const EdgeInsets.all(32),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2,),
                ),
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
            ),
          ),
        ),
        const Button(
          label: 'Freeze',
          color: Colors.grey,
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
                Button(label: 'Full OFF', color: Colors.grey,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Button(label: 'Bright', color: Colors.grey,),
                Button(label: 'Full ON', color: Colors.grey,),
              ],
            ),
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
      mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ],
    );
  }
}