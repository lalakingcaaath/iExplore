import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/adventure.dart';
import 'package:i_explore/pages/category_pages/culinary.dart';
import 'package:i_explore/pages/category_pages/cultures.dart';
import 'package:i_explore/pages/category_pages/ecotourism.dart';
import 'package:i_explore/pages/category_pages/hotel.dart';
import 'package:i_explore/pages/category_pages/pilgrimage.dart';
import 'package:i_explore/pages/category_pages/schools.dart';
import 'package:i_explore/pages/chat.dart';
import 'package:i_explore/pages/day_select.dart';
import 'package:i_explore/pages/edit_profile.dart';
import 'package:i_explore/pages/homepage.dart';
import 'package:i_explore/pages/category_pages/leisures.dart';
import 'package:i_explore/pages/introductory.dart';
import 'package:i_explore/pages/itinerary_generator.dart';
import 'package:i_explore/pages/login.dart';
import 'package:i_explore/pages/luzon.dart';
import 'package:i_explore/pages/manila.dart';
import 'package:i_explore/pages/manila_Itinerary.dart';
import 'package:i_explore/pages/metroManila.dart';
import 'package:i_explore/pages/profile.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/pages/splash_screen.dart';
import 'package:i_explore/pages/test.dart';
import 'package:i_explore/router/itinerary_categories/adventure_routes.dart';
import 'package:i_explore/router/itinerary_categories/culinary_routes.dart';
import 'package:i_explore/router/itinerary_categories/cultures_routes.dart';
import 'package:i_explore/router/itinerary_categories/ecotourism_routes.dart';
import 'package:i_explore/router/itinerary_categories/hotel_routes.dart';
import 'package:i_explore/router/itinerary_categories/pligrimage_routes.dart';
import 'package:i_explore/router/itinerary_categories/school_routes.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:i_explore/pages/itinerary_Collection.dart';
import 'package:i_explore/pages/day_itinerary.dart';
import 'package:i_explore/pages/favorites.dart';
import 'package:i_explore/pages/downloads.dart';
import 'package:i_explore/pages/time_select.dart';

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
                builder: (context, state) => const ItineraryCollection()),
            //Introductory Page
            GoRoute(
                path: 'introduction',
                builder: (context, state) => const Introductory_Screen())
          ]),

      GoRoute(path: '/day_select', builder: (context, state) => DaySelect()),

      GoRoute(
          path: "/time_select", builder: (context, state) => TimeItinerary()),

      GoRoute(
          path: '/day_itinerary',
          builder: (context, state) => const DayItinerary()),

      GoRoute(
          path: '/manila_itinerary',
          builder: (context, state) => const Manila_Itinerary()),

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

      //Itinerary Categories

      //Adventures
      ...adventureRoutes,

      //Cultures
      ...cultureRoutes,

      //Culinary
      ...culinaryRoutes,

      //EcoTourism
      ...ecotourismRoutes,

      //Hotels
      ...hotelRoutes,

      //Leisure
      ...hotelRoutes,

      //Pilgrimage
      ...pilgrimageRoutes,

      ...schoolRoutes,

      //Favorite
      GoRoute(
          path: "/favorite", builder: (context, state) => const Favorites()),

      //Downloads
      GoRoute(
          path: "/downloads", builder: (context, state) => const Downloads()),

      //Generate Itineraries
      GoRoute(
          path: "/generate",
          builder: (context, state) => const ItineraryGenerator()),

      //Chatbot
      GoRoute(path: "/chat", builder: (context, state) => const ChatScreen()),

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
