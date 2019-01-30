import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.enableLightTheme,
        initialData: true,
        builder: (context, snapshot) => MaterialApp(
              title: 'Flutter Demo',
              theme: snapshot.data ? ThemeData.light() : ThemeData.dark(),
              home: MyHomePage(snapshot.data),
            ));
  }
}

class MyHomePage extends StatelessWidget {
  final enabeLightTheme;

  MyHomePage(this.enabeLightTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Change the theme by clicking on the switch in the navigation drawer',
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(enabeLightTheme ? "Light Theme" : "Dark Theme"),
              trailing: Switch(
                value: enabeLightTheme,
                onChanged: controller.changeTheme,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Controller {
  final themeController = StreamController<bool>();

  get changeTheme => themeController.sink.add;

  get enableLightTheme => themeController.stream;
}

final controller = new Controller();
