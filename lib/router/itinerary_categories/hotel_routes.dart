import 'package:go_router/go_router.dart';
import 'package:i_explore/pages/category_pages/Hotel/bayleaf.dart';
import 'package:i_explore/pages/category_pages/Hotel/gohotel.dart';
import 'package:i_explore/pages/category_pages/Hotel/hotelh20.dart';
import 'package:i_explore/pages/category_pages/Hotel/lotushotel.dart';
import 'package:i_explore/pages/category_pages/Hotel/manilaprince.dart';
import 'package:i_explore/pages/category_pages/Hotel/peninsula.dart';
import 'package:i_explore/pages/category_pages/Hotel/rphotel.dart';
import 'package:i_explore/pages/category_pages/Hotel/shangrila.dart';
import 'package:i_explore/pages/category_pages/Hotel/torredemanila.dart';
import 'package:i_explore/pages/category_pages/Hotel/wkhotel.dart';

List<GoRoute> hotelRoutes = [
  GoRoute(path: '/bayleaf', builder: (context, state) => const BayLeaf()),
  GoRoute(path: '/gohotel', builder: (context, state) => const GoHotel()),
  GoRoute(path: '/hotelh20', builder: (context, state) => const HotelH20()),
  GoRoute(path: '/lotushotel', builder: (context, state) => const LotusHotel()),
  GoRoute(
      path: '/manilaprince', builder: (context, state) => const ManilaPrince()),
  GoRoute(path: '/peninsula', builder: (context, state) => const Peninsula()),
  GoRoute(path: '/rphotel', builder: (context, state) => const RPHotel()),
  GoRoute(path: '/shangrila', builder: (context, state) => const ShangriLa()),
  GoRoute(path: '/torre', builder: (context, state) => const TorreDeManila()),
  GoRoute(
      path: '/wkhotel', builder: (context, state) => const WhiteKnightHotel()),
];
