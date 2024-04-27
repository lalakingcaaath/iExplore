import 'package:flutter/material.dart';
import 'package:i_explore/pages/coin_charge.dart';
import 'package:i_explore/provider/coin_provider.dart';
import 'package:i_explore/utils/colors.dart';
import 'package:provider/provider.dart';

class HeaderAppBarComponent extends StatefulWidget
    implements PreferredSizeWidget {
  final String headerTitle;

  const HeaderAppBarComponent({
    Key? key,
    required this.headerTitle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _HeaderAppBarComponentState createState() => _HeaderAppBarComponentState();
}

class _HeaderAppBarComponentState extends State<HeaderAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CoinProvider>(
      builder: (context, coinProvider, _) {
        if (coinProvider.coinValue != null) {
          return AppBar(
            centerTitle: true,
            backgroundColor: orangeOneColor,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/iexplore-logo.png'),
            ),
            title: Text(
              widget.headerTitle.toUpperCase(),
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
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -4,
                      left: -12,
                      child: Image.asset('images/iexplore-coin-side.png',
                          width: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${coinProvider.coinValue!.coinValue}',
                        style: TextStyle(
                          color: orangeTwoColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -12,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => iCoins()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: orangeThreeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.add, size: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          // Placeholder or loading state while fetching data
          return AppBar(
            title: Text(widget.headerTitle.toUpperCase()),
          );
        }
      },
    );
  }
}
