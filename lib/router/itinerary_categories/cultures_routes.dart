import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Cultures/antropology.dart';
import 'package:i_explore/pages/category_pages/Cultures/ccp.dart';
import 'package:i_explore/pages/category_pages/Cultures/finearts.dart';
import 'package:i_explore/pages/category_pages/Cultures/katipunanmonument.dart';
import 'package:i_explore/pages/category_pages/Cultures/malacanang.dart';
import 'package:i_explore/pages/category_pages/Cultures/museo.dart';
import 'package:i_explore/pages/category_pages/Cultures/nationalmuseum.dart';
import 'package:i_explore/pages/category_pages/Cultures/naturalhistory.dart';
import 'package:i_explore/pages/category_pages/Cultures/theater.dart';

List<GoRoute> cultureRoutes = [
  GoRoute(
      path: '/anthropology', builder: (context, state) => const Antropology()),
  GoRoute(path: '/ccp', builder: (context, state) => const CCP()),
  GoRoute(path: '/finearts', builder: (context, state) => const FineArts()),
  GoRoute(
      path: '/katipunanmonument',
      builder: (context, state) => const KatipunanMonument()),
  GoRoute(path: '/malacanang', builder: (context, state) => const Malacanang()),
  GoRoute(path: '/museo', builder: (context, state) => const Museo()),
  GoRoute(
      path: '/nationalmuseum',
      builder: (context, state) => const NationalMuseum()),
  GoRoute(
      path: '/naturalhistory',
      builder: (context, state) => const NaturalHistory()),
  GoRoute(path: '/theater', builder: (context, state) => const Theater()),
];
