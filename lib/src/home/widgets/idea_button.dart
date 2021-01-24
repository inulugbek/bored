import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class IdeaButton extends StatelessWidget {
  const IdeaButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        color: Colors.yellow,
        padding: const EdgeInsets.all(25),
        shape: const CircleBorder(),
        onPressed: () {
          context.bloc<HomeBloc>().add(const SearchRandom());
        },
        child: const Icon(
          Icons.lightbulb_outline,
          size: 80,
        ),
      );
}
