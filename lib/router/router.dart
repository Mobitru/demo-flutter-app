import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/about/about_page.dart';
import 'package:flutter_demo_app/presentation/account/edit_account_page.dart';
import 'package:flutter_demo_app/presentation/cart/cart_page.dart';
import 'package:flutter_demo_app/presentation/filter/sorting_page.dart';
import 'package:flutter_demo_app/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: appNavigationCart,
          builder: (BuildContext context, GoRouterState state) {
            return const CartPage();
          },
        ),
        GoRoute(
          path: appNavigationAbout,
          builder: (BuildContext context, GoRouterState state) {
            return const AboutPage();
          },
        ),
        GoRoute(
          path: appNavigationEdit,
          builder: (BuildContext context, GoRouterState state) {
            return const EditAccountPage();
          },
        ),
        GoRoute(
          path: appNavigationSort,
          builder: (BuildContext context, GoRouterState state) {
            return const SortingPage();
          },
        ),
      ],
    ),
  ],
);
