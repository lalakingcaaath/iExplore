import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/adventure.dart';
import 'package:i_explore/pages/category_pages/culinary.dart';
import 'package:i_explore/pages/category_pages/cultures.dart';
import 'package:i_explore/pages/category_pages/ecotourism.dart';
import 'package:i_explore/pages/category_pages/hotel.dart';
import 'package:i_explore/pages/category_pages/pilgrimage.dart';
import 'package:i_explore/pages/category_pages/schools.dart';
import 'package:i_explore/pages/day_select.dart';
import 'package:i_explore/pages/edit_profile.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/pages/category_pages/leisures.dart';
import 'package:i_explore/pages/introductory.dart';
import 'package:i_explore/pages/login.dart';
import 'package:i_explore/pages/luzon.dart';
import 'package:i_explore/pages/manila.dart';
import 'package:i_explore/pages/metroManila.dart';
import 'package:i_explore/pages/profile.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/pages/splash_screen.dart';
import 'package:i_explore/pages/test.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:i_explore/pages/itinerary_Collection.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/login',
    routes: <RouteBase>[
      GoRoute(
          path: '/home',
          builder: (context, state) => const MyHomePage(title: 'Homepage'),
          routes: [
            GoRoute(
                path: 'luzon',
                builder: (context, state) => const luzon(),
                routes: [
                  GoRoute(
                      path: 'metro_manila',
                      builder: (context, state) => const Metro_Manila(),
                      routes: [
                        GoRoute(
                            path: 'manila',
                            builder: (context, state) => const Manila())
                      ])
                ]),
            // visayas
            // mindanao
            // Tour categories
            GoRoute(
              path: 'culinaries',
              builder: (context, state) => const Culinary_Tours(),
            ),
            GoRoute(
              path: 'adventures',
              builder: (context, state) => const Adventure_Tours(),
            ),
            GoRoute(
              path: 'leisures',
              builder: (context, state) => const Leisures_Tours(),
            ),
            GoRoute(
              path: 'cultural',
              builder: (context, state) => const Cultural_Tours(),
            ),
            GoRoute(
              path: 'ecotourism',
              builder: (context, state) => const Ecotourism(),
            ),
            GoRoute(
              path: 'pilgrimage',
              builder: (context, state) => const Pilgrimage(),
            ),
            GoRoute(
              path: 'hotels',
              builder: (context, state) => const Hotels(),
            ),
            GoRoute(
                path: 'schools',
                builder: (context, state) => const Schools(),
            ),
            //See more button
            GoRoute(
                path: 'itinerary_Collection',
                builder: (context, state) => const ItineraryCollection()
            ),
            //Introductory Page
            GoRoute(
                path: 'introduction',
                builder: (context, state) => const Introductory_Screen()
            )

            // WIP (TO:DO NEEDED PAGES)
            // GoRoute(path: 'ecotourism', builder: (context, state) =>  const Ecotourism_Tours(),),
            // GoRoute(path: 'pilgrimage', builder: (context, state) =>  const Pilgrimage_Tours(),),
            // GoRoute(path: 'schools', builder: (context, state) =>  const Schools_Tours(),),
            // GoRoute(path: 'wellness', builder: (context, state) =>  const Wellness_Tours(),),
          ]),

      GoRoute(
        name: 'day_select',
        path: '/day_select/:region/:city',
        builder: (context, state) {
          return DaySelect(
            region: state.pathParameters['region']!,
            city: state.pathParameters['city']!,
          );
        },
        routes: [
        ]
      ),
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

      // Login and Register
      GoRoute(path: '/login', builder: (context, state) => const Login()),
      GoRoute(path: '/register', builder: (context, state) => const Register()),

      // Splash
      GoRoute(
        path: '/loading',
        builder: (context, state) => const Splash(),
      ),
      // FOR DEBUGGIN AND TESTING PURPOSE
      GoRoute(
        path: '/test',
        builder: (context, state) => const Test(),
      )
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
        return '/loading';
      }

      return null;
    });
