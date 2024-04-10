import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:i_explore/utils/colors.dart';

// Header App Bar for all pages EXCEPT login and register

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
