import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/binondochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/ladyoftheabandoned.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/pacochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/paulparishchurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/quiapochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/sachurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/scchurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/sschurch.dart';

List<GoRoute> pilgrimageRoutes = [
  GoRoute(
      path: '/binondochurch',
      builder: (context, state) => const BinondoChurch()),
  GoRoute(
      path: '/abandoned',
      builder: (context, state) => const LadyOfTheAbandoned()),
  GoRoute(path: '/pacochurch', builder: (context, state) => const PacoChurch()),
  GoRoute(
      path: '/paulchurch',
      builder: (context, state) => const PaulParishChurch()),
  GoRoute(
      path: '/quiapochurch', builder: (context, state) => const QuiapoChurch()),
  GoRoute(
      path: '/sachurch', builder: (context, state) => const SanAgustinChurch()),
  GoRoute(
      path: '/scchurch', builder: (context, state) => const SantaCruzChurch()),
  GoRoute(
      path: '/sschurch',
      builder: (context, state) => const SanSebastianChurch()),
];
