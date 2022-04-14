import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class CategoryItemTile extends StatelessWidget {
  const CategoryItemTile({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: greyTwoColor),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          category,
          softWrap: false,
          style: blackTextStyle.copyWith(fontWeight: normal, fontSize: 14),
        ),
      ),
    );
  }
}
