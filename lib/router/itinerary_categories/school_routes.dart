import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Schools/UAAP/adu.dart';
import 'package:i_explore/pages/category_pages/Schools/UAAP/lasalle.dart';

List<GoRoute> schoolRoutes = [
  //UAAP Schools
  GoRoute(path: "/adu", builder: (context, state) => const Adamson()),
  GoRoute(path: "/dlsu", builder: (context, state) => const LaSalle()),
];
