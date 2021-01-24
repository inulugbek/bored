import 'package:flutter/material.dart';

import '../../home/home.dart';

class AppRootBuilder extends StatefulWidget {
  const AppRootBuilder({Key key}) : super(key: key);

  @override
  _AppRootBuilderState createState() => _AppRootBuilderState();
}

class _AppRootBuilderState extends State<AppRootBuilder> {
  @override
  Widget build(BuildContext context) {
    // dynamic root page
    // for example show login page if user not authorised
    return const HomePage();
  }
}
