import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Leisure/baluarte.dart';
import 'package:i_explore/pages/category_pages/Leisure/chinatown.dart';
import 'package:i_explore/pages/category_pages/Leisure/escolta.dart';
import 'package:i_explore/pages/category_pages/Leisure/jonesbridge.dart';
import 'package:i_explore/pages/category_pages/Leisure/manilazoo.dart';
import 'package:i_explore/pages/category_pages/Leisure/plazaroma.dart';

List<GoRoute> leisureRoutes = [
  GoRoute(path: '/baluarte', builder: (context, state) => const Baluarte()),
  GoRoute(path: '/chinatown', builder: (context, state) => const ChinaTown()),
  GoRoute(path: '/escolta', builder: (context, state) => const Escolta()),
  GoRoute(
      path: '/jonesbridge', builder: (context, state) => const JonesBridge()),
  GoRoute(path: '/manilazoo', builder: (context, state) => const ManilaZoo()),
  GoRoute(path: '/plazaroma', builder: (context, state) => const PlazaRoma()),
];
