import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../search/search.dart';
import 'idea_button.dart';

class HomeControls extends StatelessWidget {
  const HomeControls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IdeaButton(),
          const SizedBox(height: 30),
          AdaptiveTextButton(
            text: 'SMTH by category 🤔',
            onTap: () {
              // get fresh categories
              context.bloc<SearchBloc>().add(const GetCategories());
              pushNamed(context, Routes.searchPage);
            },
          ),
        ],
      );
}
