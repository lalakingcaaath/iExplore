import 'package:flutter/material.dart';
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
import 'package:i_explore/pages/category_pages/Culinary/barbara.dart';
import 'package:i_explore/pages/category_pages/Culinary/binondo.dart';
import 'package:i_explore/pages/category_pages/Culinary/bricksbrew.dart';
import 'package:i_explore/pages/category_pages/Culinary/coldtreats.dart';
import 'package:i_explore/pages/category_pages/Culinary/kapetolyo.dart';
import 'package:i_explore/pages/category_pages/Culinary/lacathedral.dart';
import 'package:i_explore/pages/category_pages/Culinary/skydeck.dart';
import 'package:i_explore/pages/category_pages/Culinary/ugbo.dart';
import 'package:i_explore/pages/category_pages/Culinary/unsquare.dart';
import 'package:i_explore/pages/category_pages/Adventures/bambike.dart';
import 'package:i_explore/pages/category_pages/Adventures/craftacademy.dart';
import 'package:i_explore/pages/category_pages/Adventures/golfrange.dart';
import 'package:i_explore/pages/category_pages/Adventures/kalesa.dart';
import 'package:i_explore/pages/category_pages/Adventures/whiteknight.dart';
import 'package:i_explore/pages/category_pages/Leisure/baluarte.dart';
import 'package:i_explore/pages/category_pages/Leisure/chinatown.dart';
import 'package:i_explore/pages/category_pages/Leisure/escolta.dart';
import 'package:i_explore/pages/category_pages/Leisure/jonesbridge.dart';
import 'package:i_explore/pages/category_pages/Leisure/manilazoo.dart';
import 'package:i_explore/pages/category_pages/Leisure/plazaroma.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/arroceros.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/casamanila.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/dungeons.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/fortsantiago.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/garden.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/oceanpark.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/pacopark.dart';
import 'package:i_explore/pages/category_pages/Ecotourism/rizalpark.dart';
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
import 'package:i_explore/pages/category_pages/Pilgrimage/binondochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/ladyoftheabandoned.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/pacochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/paulparishchurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/quiapochurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/sachurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/scchurch.dart';
import 'package:i_explore/pages/category_pages/Pilgrimage/sschurch.dart';
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
import 'package:i_explore/pages/login.dart';
import 'package:i_explore/pages/luzon.dart';
import 'package:i_explore/pages/manila.dart';
import 'package:i_explore/pages/manila_Itinerary.dart';
import 'package:i_explore/pages/metroManila.dart';
import 'package:i_explore/pages/profile.dart';
import 'package:i_explore/pages/register.dart';
import 'package:i_explore/pages/splash_screen.dart';
import 'package:i_explore/pages/test.dart';
import 'package:i_explore/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:i_explore/pages/itinerary_Collection.dart';
import 'package:i_explore/pages/day_itinerary.dart';
import 'package:i_explore/pages/favorites.dart';
import 'package:i_explore/pages/downloads.dart';
import 'package:i_explore/pages/time_select.dart';
import 'package:i_explore/pages/category_pages/Schools/UAAP/adu.dart';
import 'package:i_explore/pages/category_pages/Schools/UAAP/lasalle.dart';

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
          ]),

      GoRoute(
          path: '/day_select',
          builder: (context, state) => DaySelect()
      ),

      GoRoute(
        path: "/time_select",
        builder: (context, state) => TimeItinerary()
      ),

      GoRoute(
          path: '/day_itinerary',
          builder: (context, state) => const DayItinerary()
      ),

      GoRoute(
        path: '/manila_itinerary',
        builder: (context, state) => const Manila_Itinerary()
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

      //Itinerary Categories

      //Adventures
      GoRoute(
          path: '/bambike',
          builder: (context, state) => const Bambike()
      ),
      GoRoute(
          path: '/craftacademy',
          builder: (context, state) => const CraftAcademy()
      ),
      GoRoute(
          path: '/golfrange',
          builder: (context, state) => const GolfRange()
      ),
      GoRoute(
          path: '/kalesa',
          builder: (context, state) => const Kalesa()
      ),
      GoRoute(
          path: '/whiteknight',
          builder: (context, state) => const WhiteKnight()
      ),

      //Cultures
      GoRoute(
          path: '/anthropology',
          builder: (context, state) => const Antropology()
      ),

      GoRoute(
          path: '/ccp',
          builder: (context, state) => const CCP()
      ),
      GoRoute(
          path: '/finearts',
          builder: (context, state) => const FineArts()
      ),

      GoRoute(
          path: '/katipunanmonument',
          builder: (context, state) => const KatipunanMonument()
      ),
      GoRoute(
          path: '/malacanang',
          builder: (context, state) => const Malacanang()
      ),

      GoRoute(
          path: '/museo',
          builder: (context, state) => const Museo()
      ),
      GoRoute(
          path: '/nationalmuseum',
          builder: (context, state) => const NationalMuseum()
      ),

      GoRoute(
          path: '/naturalhistory',
          builder: (context, state) => const NaturalHistory()
      ),
      GoRoute(
          path: '/theater',
          builder: (context, state) => const Theater()
      ),

      //Culinary
      GoRoute(
          path: '/barbara',
          builder: (context, state) => const Barbara()
      ),

      GoRoute(
          path: '/binondo',
          builder: (context, state) => const Binondo()
      ),
      GoRoute(
          path: '/bricks',
          builder: (context, state) => const Bricksbrew()
      ),

      GoRoute(
          path: '/coldtreats',
          builder: (context, state) => const ColdTreats()
      ),
      GoRoute(
          path: '/kapetolyo',
          builder: (context, state) => const Kapetolyo()
      ),

      GoRoute(
          path: '/lacathedral',
          builder: (context, state) => const LaCathedral()
      ),
      GoRoute(
          path: '/skydeck',
          builder: (context, state) => const SkyDeck()
      ),

      GoRoute(
          path: '/ugbo',
          builder: (context, state) => const Ugbo()
      ),
      GoRoute(
          path: '/unsquare',
          builder: (context, state) => const UNSquare()
      ),

      //EcoTourism
      GoRoute(
          path: '/arroceros',
          builder: (context, state) => const Arroceros()
      ),

      GoRoute(
          path: '/casamanila',
          builder: (context, state) => const CasaManila()
      ),
      GoRoute(
          path: '/dungeons',
          builder: (context, state) => const FortDungeon()
      ),

      GoRoute(
          path: '/fortsantiago',
          builder: (context, state) => const FortSantiago()
      ),
      GoRoute(
          path: '/garden',
          builder: (context, state) => const MehanGarden()
      ),

      GoRoute(
          path: '/oceanpark',
          builder: (context, state) => const OceanPark()
      ),
      GoRoute(
          path: '/pacopark',
          builder: (context, state) => const PacoPark()
      ),

      GoRoute(
          path: '/rizalpark',
          builder: (context, state) => const RizalPark()
      ),

      //Hotels
      GoRoute(
          path: '/bayleaf',
          builder: (context, state) => const BayLeaf()
      ),

      GoRoute(
          path: '/gohotel',
          builder: (context, state) => const GoHotel()
      ),
      GoRoute(
          path: '/hotelh20',
          builder: (context, state) => const HotelH20()
      ),

      GoRoute(
          path: '/lotushotel',
          builder: (context, state) => const LotusHotel()
      ),
      GoRoute(
          path: '/manilaprince',
          builder: (context, state) => const ManilaPrince()
      ),

      GoRoute(
          path: '/peninsula',
          builder: (context, state) => const Peninsula()
      ),
      GoRoute(
          path: '/rphotel',
          builder: (context, state) => const RPHotel()
      ),

      GoRoute(
          path: '/shangrila',
          builder: (context, state) => const ShangriLa()
      ),
      GoRoute(
          path: '/torre',
          builder: (context, state) => const TorreDeManila()
      ),
      GoRoute(
          path: '/wkhotel',
          builder: (context, state) => const WhiteKnightHotel()
      ),

      //Leisure
      GoRoute(
          path: '/baluarte',
          builder: (context, state) => const Baluarte()
      ),
      GoRoute(
          path: '/chinatown',
          builder: (context, state) => const ChinaTown()
      ),
      GoRoute(
          path: '/escolta',
          builder: (context, state) => const Escolta()
      ),
      GoRoute(
          path: '/jonesbridge',
          builder: (context, state) => const JonesBridge()
      ),
      GoRoute(
          path: '/manilazoo',
          builder: (context, state) => const ManilaZoo()
      ),
      GoRoute(
          path: '/plazaroma',
          builder: (context, state) => const PlazaRoma()
      ),

      //Pilgrimage
      GoRoute(
          path: '/binondochurch',
          builder: (context, state) => const BinondoChurch()
      ),

      GoRoute(
          path: '/abandoned',
          builder: (context, state) => const LadyOfTheAbandoned()
      ),
      GoRoute(
          path: '/pacochurch',
          builder: (context, state) => const PacoChurch()
      ),

      GoRoute(
          path: '/paulchurch',
          builder: (context, state) => const PaulParishChurch()
      ),
      GoRoute(
          path: '/quiapochurch',
          builder: (context, state) => const QuiapoChurch()
      ),

      GoRoute(
          path: '/sachurch',
          builder: (context, state) => const SanAgustinChurch()
      ),
      GoRoute(
          path: '/scchurch',
          builder: (context, state) => const SantaCruzChurch()
      ),

      GoRoute(
          path: '/sschurch',
          builder: (context, state) => const SanSebastianChurch()
      ),

      //Favorite
      GoRoute(
          path: "/favorite",
          builder: (context, state) => const Favorites()
      ),

      //Downloads
      GoRoute(
          path: "/downloads",
          builder: (context, state) => const Downloads()
      ),

      //Chatbot
      GoRoute(
        path: "/chat",
        builder: (context, state) => const ChatScreen()
      ),

      //UAAP Schools
      GoRoute(
        path: "/adu",
        builder: (context, state) => const Adamson()
      ),
      GoRoute(
        path: "/dlsu",
        builder: (context, state) => const LaSalle() 
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
