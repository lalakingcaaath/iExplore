import 'package:flutter/material.dart';


class ImageCircleComponent extends StatelessWidget {
  final String imageUrl;
  final String desc;
  final double descSize;
  
  const ImageCircleComponent({
    super.key,
    required this.imageUrl,
    required this.desc,
    this.descSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(imageUrl),
      child: Center(
        child: Text(
          desc.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'AdobeDevanagari',
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            fontSize: descSize,
          ),
        ),
      ),
    );
  }
}
