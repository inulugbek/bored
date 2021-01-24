import 'package:bored_repository/bored_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home.dart';
import 'search/search.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget child;

  const DependenciesProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = BoredRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(repo)),
        BlocProvider(create: (context) => SearchBloc(repo)),
      ],
      child: child,
    );
  }
}
