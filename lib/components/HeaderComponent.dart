import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.imageSrc,
    required this.logoTitle,
  });

  final String imageSrc;
  final String logoTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            imageSrc,
            width: 64,
            height: 64,
          ),
          Text(logoTitle,
              style: const TextStyle(
                fontFamily: 'AdobeDevanagari',
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Colors.white,
              )),
          const SizedBox(
            width: 64,
          ),
        ],
      ),
    );
  }
}
