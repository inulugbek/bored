// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../../search/search.dart';
import '../root/root_builder.dart';

class Routes {
  static const String appRootBuilder = '/';
  static const String homePage = '/home';
  static const String searchPage = '/search';
  static const all = <String>{
    appRootBuilder,
    homePage,
    searchPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appRootBuilder, page: AppRootBuilder),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.searchPage, page: SearchPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AppRootBuilder: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const AppRootBuilder(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
        settings: data,
      );
    },
    SearchPage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const SearchPage(),
        settings: data,
      );
    },
  };
}
