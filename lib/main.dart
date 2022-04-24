import 'package:flutter/material.dart';
import 'package:ht/preference.dart';
import 'package:ht/styles.dart';
import 'package:provider/provider.dart';

import 'sections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeProvider;
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: 'CT30A2803 LPR Group 6',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('CT30A2803 LPR Group 6'),
              ),
              body: Row(
                children: const [
                  CustomMainSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
