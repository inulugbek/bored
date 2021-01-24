import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search.dart';

class CategoryButton extends StatelessWidget {
  final ActivityCategory category;
  final double size;

  const CategoryButton(
    this.category, {
    Key key,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        color: Colors.yellow,
        onPressed: () {
          context.bloc<SearchBloc>().add(SearchCategory(category));
        },
        child: SizedBox(
          height: size,
          width: size,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.emoji,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 30),
              ),
              Text(
                category.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}
