import 'package:flutter/material.dart';
import 'package:ht/preference.dart';
import 'package:provider/provider.dart';



class Button extends StatefulWidget {
  const Button({
    Key? key,
    this.label = '',
    this.secondaryLabel,
    this.icon,
    this.width = 100,
    this.height = 75,
    this.padding = 16,
    this.color = Colors.white10,
    this.secondaryColor,
    this.borderRadius = 20,
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
  final double borderRadius;
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
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        onTap: handleTap,
        child: Ink(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: active ? widget.color : (widget.secondaryColor ?? widget.color),
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
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
                  style: const TextStyle(
                    fontSize: 20,
  	                fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    this.label = '',
    this.secondaryLabel,
    this.icon,
    this.width = 100,
    this.height = 75,
    this.padding = 16,
    this.color = Colors.white10,
    this.secondaryColor,
    this.borderRadius = 20,
    this.onTap,
    this.selectedPage,
    this.pageNumber,
  }) : super(key: key);

  final String label;
  final String? secondaryLabel;
  final IconData? icon;
  final double width;
  final double height;
  final double padding;
  final Color color;
  final Color? secondaryColor;
  final double borderRadius;
  final VoidCallback? onTap;

  final int? selectedPage;
  final int? pageNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        onTap: onTap,
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: selectedPage == pageNumber ? color : secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              if (icon != null)
                Icon(icon),
              if (label != '')
                Text(
                  selectedPage == pageNumber ? label : (secondaryLabel ?? label),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
  	                fontWeight: FontWeight.w700,
                  ),
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

class Dropdown extends StatefulWidget {
  const Dropdown({
    Key? key,
    this.items = const <String>['One', 'Two', 'Three'],
  }) : super(key: key);

  final List<String> items;

  @override
  State<StatefulWidget> createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
  late String dropdownValue = widget.items[0];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DarkModeSwitchState();
}

class DarkModeSwitchState extends State<DarkModeSwitch> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    bool value = themeChange.darkTheme;
    return Switch(
      value: value,
      onChanged: (bool newValue) {
        setState(() {
          value = newValue;
          themeChange.darkTheme = value;
        });
      },
    );
  }
}
