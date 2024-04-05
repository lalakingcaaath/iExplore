import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_explore/utils/colors.dart';

class HeaderAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String headerTitle;

  const HeaderAppBarComponent({
    super.key,
    required this.headerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: orangeOneColor,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('images/iexplore-logo.png'),
      ),
      title: Text(
        headerTitle.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'FSP-Demo',
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: lightOrangeColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            // alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -4,
                  left: -12,
                  child:
                      Image.asset('images/iexplore-coin-side.png', width: 24)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    '0',
                    style: TextStyle(
                      color: orangeTwoColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -12,
                child: Container(
                    decoration: BoxDecoration(
                      color: orangeThreeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, size: 24, color: Colors.white)),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// title: const Text(
//           "Home Dashboard",
//           style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'FSP-Demo',
//               fontWeight: FontWeight.normal),
//         ),
//         centerTitle: true,
//         backgroundColor: orangeOneColor,
//         leading: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Image.asset('images/iexplore-logo.png'),
//         ),
//         actions: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Row(
//                 children: [
//                   Positioned(
//                       child: Container(
//                     decoration: BoxDecoration(
//                         color: lightOrangeColor,
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           'images/iexplore-coin.png',
//                           width: 40,
//                         ),
//                         Text(
//                           "0",
//                           style: TextStyle(
//                               fontFamily: 'AdobeDevanagari',
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25,
//                               color: orangeOneColor),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: darkOrangeColor,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: IconButton(
//                             color: Colors.white,
//                             onPressed: () {},
//                             icon: Icon(Icons.add, size: 25),
//                           ),
//                         )
//                       ],
//                     ),
//                   ))
//                 ],
//               ),
//             ],
//           ),
//         ],