import 'package:flutter/material.dart';
import 'package:frivia/providers/theme_provider.dart';
import 'package:frivia/screens/Home_Page.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double difficulty_lvl = 0.0;
  bool check = false;
  double? _device_height, _device_width;
  final List<String> _difficulty_text = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _device_height = MediaQuery.of(context).size.height;
    _device_width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          switchmodes(),
          Text(
            "Frivia",
            style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          slider(),
          Text(
            _difficulty_text[difficulty_lvl.toInt()],
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
          _button(),
        ],
      )),
    );
  }

  Widget switchmodes() {
    return Column(children: [
      Switch(
        value: Provider.of<ThemeProvider>(context).isDark,
        onChanged: (value) {
          Provider.of<ThemeProvider>(context, listen: false).toggle();
        },
      )
    ]);
  }

  Widget slider() {
    return Slider(
      thumbColor: Theme.of(context).colorScheme.primary,
      activeColor: Theme.of(context).colorScheme.primary,
      label: "Difficulty",
      min: 0,
      max: 2,
      divisions: 2,
      value: difficulty_lvl,
      onChanged: (_value) {
        setState(() {
          difficulty_lvl = _value;
        });
      },
    );
  }

  Widget _button() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomePage(
            dfl: _difficulty_text[difficulty_lvl.toInt()].toLowerCase(),
          );
        }));
      },
      child: Text(
        "Start",
        style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
