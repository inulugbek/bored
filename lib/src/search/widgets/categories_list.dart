import 'package:flutter/material.dart';

import '../search.dart';

class CategoriesList extends StatelessWidget {
  final int crossAxisCount;
  final double spacing;
  final List<ActivityCategory> categories;

  const CategoriesList({
    @required this.categories,
    Key key,
    this.crossAxisCount = 3,
    this.spacing = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(maxWidth: 800),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < categories.length; i = i + crossAxisCount) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < crossAxisCount; j++) ...[
                    CategoryButton(categories[i + j]),
                    if (j != crossAxisCount - 1) SizedBox(width: spacing),
                  ]
                ],
              ),
              if (i != categories.length - 1) SizedBox(height: spacing),
            ]
          ],
        ),
      );
}
