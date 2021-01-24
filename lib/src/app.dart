import 'package:flutter/material.dart';

import 'core/core.dart';
import 'dp.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DependenciesProvider(
        child: MaterialApp(
          title: 'Bored',
          theme: DefaultTheme.themeData,
          onGenerateRoute: AppRouter(),

          // home: AppRouter(),
          // builder: ExtendedNavigator.builder<AppRouter>(
          //   router: AppRouter(),
          //   initialRoute: Routes.appRootBuilder,
          // ),
        ),
      );
}
