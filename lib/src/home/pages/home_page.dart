import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("I'm Bored 🥱"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.success:
                  return _HomeSuccess(state.idea);
                case HomeStatus.loading:
                  return const Center(child: Loader());
                case HomeStatus.failure:
                  return const _HomeFailure();
                case HomeStatus.initial:
                default:
                  return const HomeControls();
              }
            },
          ),
        ),
      );
}

class _HomeSuccess extends StatelessWidget {
  final Idea idea;

  const _HomeSuccess(this.idea, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => _HomeTextWithButton(idea.activity);
}

class _HomeFailure extends StatelessWidget {
  const _HomeFailure({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const _HomeTextWithButton(
        'Cannot find activity now 😢, Try later again',
      );
}

class _HomeTextWithButton extends StatelessWidget {
  final String text;

  const _HomeTextWithButton(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 40),
          const HomeControls(),
        ],
      );
}
