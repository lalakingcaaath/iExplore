import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapComponent extends StatelessWidget {
  const MapComponent({super.key});

  @override
  Widget build(BuildContext build) {
    return Container(
      width: 325,
      height: 325,
      child: FlutterMap(
        options: MapOptions(
            initialCenter: LatLng(14.604397, 120.979832), initialZoom: 12),
        children: [
          TileLayer(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/lalakingcaaath/clw756vue028t01rjcd6jcfrg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ",
            additionalOptions: {
              "accessToken":
                  "pk.eyJ1IjoibGFsYWtpbmdjYWFhdGgiLCJhIjoiY2x3MjV2b2trMGpvMjJqcXVkenlyM252dyJ9.L8_2gdCOPZlX0htFguf6DQ"
            },
          ),
          MarkerLayer(markers: [
            //Restaurants
            //Barbara's Heritage Restaurant
            Marker(
                point: LatLng(14.579840, 120.989920),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Binondo
            Marker(
                point: LatLng(14.602810, 120.974510),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Bricks & Brew
            Marker(
                point: LatLng(14.599700927734375, 121.015380859375),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Cold Treats - Intramuros
            Marker(
                point: LatLng(14.5894447, 120.9752387),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Kapetolyo
            Marker(
                point: LatLng(14.5906958, 120.9810805),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //La Cathedral Cafe
            Marker(
                point: LatLng(14.5888369, 120.9769195),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Skydeck View Bar
            Marker(
                point: LatLng(14.5900225, 120.978795),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //UN Square
            Marker(
                point: LatLng(14.5833484, 120.9870442),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Ugbo
            Marker(
                point: LatLng(14.623331513423873, 120.96385959093604),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Ecotourism
            //Arroceros Forest Park
            Marker(
                point: LatLng(14.5891206, 120.9823879),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Casa Manila
            Marker(
                point: LatLng(14.5896538, 120.975152),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Fort Santiago
            Marker(
                point: LatLng(14.594196, 120.9703052),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Manila Ocean Park
            Marker(
                point: LatLng(14.5792144, 120.9725558),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Mehan Garden
            Marker(
                point: LatLng(14.5925222, 120.9809105),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Paco Park
            Marker(
                point: LatLng(14.5813534, 120.9887982),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Rizal Park
            Marker(
                point: LatLng(14.5833516, 120.9799471),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Dungeons of Fort Santiago
            Marker(
                point: LatLng(14.594885, 120.969664),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Leisure
            //Baluarte de San Diego
            Marker(
                point: LatLng(14.5873478, 120.9750967),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Chinatown
            Marker(
                point: LatLng(14.6015244, 120.9785953),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Escolta
            Marker(
                point: LatLng(14.597673533240254, 120.97837927648348),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Jones Bridge
            Marker(
                point: LatLng(14.5957785, 120.9773814),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Manila Zoo
            Marker(
                point: LatLng(14.5647617, 120.988333),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Plaza Roma
            Marker(
                point: LatLng(14.5921542, 120.9731062),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Adventure
            //Bambike
            Marker(
                point: LatLng(14.5896067, 120.9752176),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Intramuros Golf Club
            Marker(
                point: LatLng(14.5866094, 120.9780994),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Craft Academy
            Marker(
                point: LatLng(14.5228128, 120.9892452),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Kalesa - Intramuros
            Marker(
                point: LatLng(14.5921542, 120.9731062),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //White Knight
            Marker(
                point: LatLng(14.589192, 120.975601),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Cultural
            //CCP
            Marker(
                point: LatLng(14.55822, 120.98597),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Katipunan Monument
            Marker(
                point: LatLng(14.5909323, 120.9810749),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Malacanang Palace
            Marker(
                point: LatLng(14.5939474, 120.9943488),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Manila Metropolitan Theater
            Marker(
                point: LatLng(14.5939749, 120.9805595),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Museo de Intramuros
            Marker(
                point: LatLng(14.5898973, 120.9730586),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //National Museum of Anthropology
            Marker(
                point: LatLng(14.5850319, 120.9811208),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //National Museum of Natural History
            Marker(
                point: LatLng(14.5869216, 120.9812254),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //National Museum of Fine Arts
            Marker(
                point: LatLng(14.5868983, 120.9812299),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //National Museum of the Philippines
            Marker(
                point: LatLng(14.5869216, 120.9812254),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Pilgrimage
            //Binondo Church
            Marker(
                point: LatLng(14.6002054, 120.9746985),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //National Shrine of Our Lady of the Abandoned
            Marker(
                point: LatLng(14.581898795391808, 121.01649271993001),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Paco Church
            Marker(
                point: LatLng(14.5793823, 120.9946528),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Quiapo Church
            Marker(
                point: LatLng(14.5986853, 120.9837037),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //San Agustin Church
            Marker(
                point: LatLng(14.5888465, 120.9753737),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //San Sebastian Church
            Marker(
                point: LatLng(14.5996781, 120.9890063),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Santa Cruz Church
            Marker(
                point: LatLng(14.599547, 120.9802008),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //St. Vincent de Paul Parish Church
            Marker(
                point: LatLng(14.5893237, 120.9841595),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Hotels
            //Go Hotels Ermita
            Marker(
                point: LatLng(14.57567010, 120.98220710),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Hotel H20
            Marker(
                point: LatLng(14.58005250, 120.97330750),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Manila Lotus Hotel
            Marker(
                point: LatLng(14.57753460, 120.98111730),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Manila Prince
            Marker(
                point: LatLng(14.58438040, 120.98680340),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Rizal Park Hotel
            Marker(
                point: LatLng(14.57876700, 120.97620200),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Shangri-La The Fort, Manila
            Marker(
                point: LatLng(14.55248160, 121.04680630),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //The Bayleaf Intramuros Hotel
            Marker(
                point: LatLng(14.59001120, 120.97880400),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //The Peninsula Manila
            Marker(
                point: LatLng(14.55564010, 121.02513130),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Torre De Manila
            Marker(
                point: LatLng(14.58512890, 120.98470250),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //White Knight Hotel
            Marker(
                point: LatLng(14.58966710, 120.97571910),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Schools
            //Adamson University
            Marker(
                point: LatLng(14.58747790, 120.98561560),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Ateneo
            Marker(
                point: LatLng(14.63957040, 121.07857790),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //De La Salle
            Marker(
                point: LatLng(14.56476420, 120.99316520),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //FEU
            Marker(
                point: LatLng(14.60373800, 120.98647480),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //NU
            Marker(
                point: LatLng(14.60431640, 120.99462870),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //UST
            Marker(
                point: LatLng(14.61004920, 120.98932970),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //UE
            Marker(
                point: LatLng(14.60161920, 120.98876200),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //UPD
            Marker(
                point: LatLng(14.65388170, 121.06850490),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Letran
            Marker(
                point: LatLng(14.59381860, 120.97686310),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //Benilde
            Marker(
                point: LatLng(14.56363580, 120.99506570),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //JRU
            Marker(
                point: LatLng(14.59252640, 121.02855930),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //Mapua
            Marker(
                point: LatLng(14.59048830, 120.97794840),
                child: Icon(
                  Icons.pin_drop,
                  color: Colors.red,
                  size: 15,
                )),
            //San Beda
            Marker(
                point: LatLng(14.59978110, 120.99293800),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //San Sebastian
            Marker(
                point: LatLng(14.60078560, 120.98988380),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //University of Perpetual Help
            Marker(
                point: LatLng(14.45079630, 120.98541500),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //LPU
            Marker(
                point: LatLng(14.59157720, 120.97777330),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //EAC
            Marker(
                point: LatLng(14.58286700, 120.98710530),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //PUP
            Marker(
                point: LatLng(14.59687000, 121.01065640),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //PNU
            Marker(
                point: LatLng(14.58709350, 120.98281900),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
            //TUP
            Marker(
                point: LatLng(14.58707900, 120.98448680),
                width: 10,
                height: 10,
                child: Icon(Icons.pin_drop, color: Colors.red, size: 15)),
          ])
        ],
      ),
    );
  }
}
