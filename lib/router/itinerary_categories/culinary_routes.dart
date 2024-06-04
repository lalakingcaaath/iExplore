

import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Culinary/barbara.dart';
import 'package:i_explore/pages/category_pages/Culinary/binondo.dart';
import 'package:i_explore/pages/category_pages/Culinary/bricksbrew.dart';
import 'package:i_explore/pages/category_pages/Culinary/coldtreats.dart';
import 'package:i_explore/pages/category_pages/Culinary/kapetolyo.dart';
import 'package:i_explore/pages/category_pages/Culinary/lacathedral.dart';
import 'package:i_explore/pages/category_pages/Culinary/skydeck.dart';
import 'package:i_explore/pages/category_pages/Culinary/ugbo.dart';
import 'package:i_explore/pages/category_pages/Culinary/unsquare.dart';

List<GoRoute> culinaryRoutes = [
        GoRoute(path: '/barbara', builder: (context, state) => const Barbara()),

      GoRoute(path: '/binondo', builder: (context, state) => const Binondo()),
      GoRoute(path: '/bricks', builder: (context, state) => const Bricksbrew()),

      GoRoute(
          path: '/coldtreats', builder: (context, state) => const ColdTreats()),
      GoRoute(
          path: '/kapetolyo', builder: (context, state) => const Kapetolyo()),

      GoRoute(
          path: '/lacathedral',
          builder: (context, state) => const LaCathedral()),
      GoRoute(path: '/skydeck', builder: (context, state) => const SkyDeck()),

      GoRoute(path: '/ugbo', builder: (context, state) => const Ugbo()),
      GoRoute(path: '/unsquare', builder: (context, state) => const UNSquare())
];