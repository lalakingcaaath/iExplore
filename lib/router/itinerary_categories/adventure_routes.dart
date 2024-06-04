// adventure_routes.dart
import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Adventures/bambike.dart';
import 'package:i_explore/pages/category_pages/Adventures/craftacademy.dart';
import 'package:i_explore/pages/category_pages/Adventures/golfrange.dart';
import 'package:i_explore/pages/category_pages/Adventures/kalesa.dart';
import 'package:i_explore/pages/category_pages/Adventures/whiteknight.dart';

List<GoRoute> adventureRoutes = [
  GoRoute(
    path: '/bambike',
    builder: (context, state) => const Bambike(),
  ),
  GoRoute(
    path: '/craftacademy',
    builder: (context, state) => const CraftAcademy(),
  ),
  GoRoute(
    path: '/golfrange',
    builder: (context, state) => const GolfRange(),
  ),
  GoRoute(
    path: '/kalesa',
    builder: (context, state) => const Kalesa(),
  ),
  GoRoute(
    path: '/whiteknight',
    builder: (context, state) => const WhiteKnight(),
  ),
];