import 'package:flutter/material.dart';

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
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.items
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
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
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (bool newValue) {
        setState(() {
          value = newValue;
        });
      },
    );
  }
}