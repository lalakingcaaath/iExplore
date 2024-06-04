import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/arroceros.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/casamanila.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/dungeons.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/fortsantiago.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/garden.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/oceanpark.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/pacopark.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/rizalpark.dart';

List<GoRoute> ecotourismRoutes = [
  GoRoute(path: '/arroceros', builder: (context, state) => const Arroceros()),
  GoRoute(path: '/casamanila', builder: (context, state) => const CasaManila()),
  GoRoute(path: '/dungeons', builder: (context, state) => const FortDungeon()),
  GoRoute(
      path: '/fortsantiago', builder: (context, state) => const FortSantiago()),
  GoRoute(path: '/garden', builder: (context, state) => const MehanGarden()),
  GoRoute(path: '/oceanpark', builder: (context, state) => const OceanPark()),
  GoRoute(path: '/pacopark', builder: (context, state) => const PacoPark()),
  GoRoute(path: '/rizalpark', builder: (context, state) => const RizalPark()),
];
