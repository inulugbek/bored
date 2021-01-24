import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Select category 😇'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state.status == SearchStatus.success) {
                showDialog<void>(
                  context: context,
                  child: ResultDialog(
                    title: 'Try this 😊',
                    body: state.suggestion.activity,
                  ),
                );
              } else if (state.status == SearchStatus.failure) {
                showDialog<void>(
                  context: context,
                  builder: (context) => const ResultDialog(
                    title: 'Oops 🙈',
                    body: 'Cannot find activity now 😢, Try later again',
                  ),
                );
              }
            },
            builder: (context, state) {
              switch (state.status) {
                case SearchStatus.loading:
                  return const Center(child: Loader());
                case SearchStatus.noCategories:
                  return const _NoCategories();
                case SearchStatus.initial:
                default:
                  return _SearchCategories(categories: state.categories);
              }
            },
          ),
        ),
      );
}

class _NoCategories extends StatelessWidget {
  const _NoCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('No categories found 😢, Try later'),
      );
}

class _SearchCategories extends StatelessWidget {
  final List<ActivityCategory> categories;

  const _SearchCategories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const _NoCategories();
    }

    return CategoriesList(categories: categories);
  }
}
