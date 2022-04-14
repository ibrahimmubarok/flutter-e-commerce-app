import 'package:flutter/material.dart';
import 'package:latihan_e_commerce_app/utils/theme.dart';

class MostPopularItem extends StatelessWidget {
  const MostPopularItem(
      {Key? key,
      required this.index,
      required this.image,
      required this.name,
      this.price = 'Rp 0'})
      : super(key: key);

  final int index;
  final String image;
  final String name;
  final String price;

  backgroundColor() {
    if (index % 2 == 0) {
      return backgroundCreamColor;
    } else {
      return backgroundBlueColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 172,
      height: 172,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundColor(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 121,
            height: 86,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: primaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
          Text(
            price,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: normal,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
