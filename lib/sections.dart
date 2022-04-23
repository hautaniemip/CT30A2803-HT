import 'package:flutter/material.dart';

import 'widgets.dart';

class CustomMainSection extends StatefulWidget {
  @override
  MenuSection createState() => MenuSection();
}

class MenuSection extends State<CustomMainSection> {
  int _selectedPage = 0;
  PageController _pageController= PageController();

  void changePage(int pageNum){
    setState(() {
        _selectedPage = pageNum;
        _pageController.animateToPage(pageNum,
        duration: Duration(milliseconds: 500),
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
    return Container(
      child: Row(
        
        children: [
          Container( //Container for MenuButtons
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabButton(
                  label: "HomePage",
                  pageNumber: 0,
                  selectedPage: _selectedPage,
                   onTap: () {
                    changePage(0);
                  },
                
                ),

                TabButton(
                  label: "Projector Controls",
                  pageNumber: 1,
                  selectedPage: _selectedPage,
                  onTap: () {
                    changePage(1);
                  },
                ),

                TabButton(
                  label: "Screen controls",
                  pageNumber: 2,
                  selectedPage: _selectedPage,
                  onTap: () {
                    changePage(2);
                  },
                ),

                TabButton(
                  label: "Room light control",
                  pageNumber: 3,
                  selectedPage: _selectedPage,
                  onTap: () {
                    changePage(3);
                  },
                ),

                TabButton(
                  label: "Settings",
                  pageNumber: 4,
                  selectedPage: _selectedPage,
                  onTap: () {
                    changePage(4);
                  },
                ),
                
                Button(label: 'System shutdown', secondaryLabel: 'System startup', color: Colors.redAccent, secondaryColor: Colors.greenAccent,),
              ],
            ),
          ),

          Container( // Container for the buttons view
            width: 700,
            child: PageView(
              onPageChanged: (int page){
                setState(() {
                  _selectedPage = page;
                });
              },
              controller: _pageController,
              children: [
                Container(
                  child: Center(
                    child: Text("Page 1"),
                  ),
                ),
                
                Container(
                  child: Center(
                    child: Text("Page 2"),
                  ),
                ),

                Container(
                  child: Center(
                    child: Text("Page 3"),
                  ),
                ),

                Container(
                  child: Center(
                    child: Text("Page 4"),
                  ),
                ),

                Container(
                  child: Center(
                    child: Text("Page 5"),
                  ),
                ),
              ],
            ) 
          ),
        ],
      ),

    );
  }
}

class MainSection extends StatelessWidget {
  const MainSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      
      fit: FlexFit.tight,
      child: PageView(

        children: [
          Container(
            child: Center(
              child: Text("Page 1"),
            ),
          ),
          
          Container(
            child: Center(
              child: Text("Page 2"),
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
/*
class TabButton extends StatelessWidget {
  final String? text;
  final int? selectedPage;
  final int? pageNumber;
  final VoidCallback? onPressed;
  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: selectedPage == pageNumber ? Colors.blue : Color.fromARGB(255, 166, 166, 166),
          borderRadius: BorderRadius.circular(4.0)

        ),

        padding: EdgeInsets.symmetric(

          vertical: 25,
          horizontal: 25,
        ),
        

        child: Text(
          text ?? "Tab Button",
          style: TextStyle(
            color: selectedPage == pageNumber ? Colors.black : Colors.black,
          ),
        ),


      ),
    );
  }
}*/