import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class BestOfferTile extends StatelessWidget {
  const BestOfferTile(
      {Key? key, required this.image, required this.name, this.price = 'Rp 0'})
      : super(key: key);

  final String image;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: greyTwoColor,
          ),
          BoxShadow(
            color: greyFourColor,
            spreadRadius: 0,
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 134,
            height: 85,
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
              fontSize: 12,
              fontWeight: normal,
            ),
          ),
          Expanded(
            child: Text(
              price,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
