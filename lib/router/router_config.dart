import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/edit_profile.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/pages/login.dart';
import 'package:i_explore/pages/profile.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/services/AuthService.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
          path: '/home',
          builder: (context, state) => const MyHomePage(title: 'Homepage')),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const Profile(),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (context, state) => const EditProfile(),
          )
        ],
      ),
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(path: '/register', builder: (context, state) => const Register()),
    ],
    redirect: (context, state) {
      // check if user is logged in

      final user = Provider.of<AuthService?>(context, listen: false)?.user;
      final bool loggingIn = state.matchedLocation == '/login';
      // check if there is a value in user
      if (user == null) {
        return '/login';
      }

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) {
        return '/home';
      }

      return null;
    });
