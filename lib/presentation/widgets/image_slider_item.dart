import 'package:flutter/material.dart';

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
