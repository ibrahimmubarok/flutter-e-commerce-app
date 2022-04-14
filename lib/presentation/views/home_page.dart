import 'package:flutter/material.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/best_offer_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/category_item_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/most_popular_item_tile.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 170,
          margin: const EdgeInsets.only(top: 60),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // return const BestOfferTile(
              //   image:
              //       'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-13599224/apple_apple_macbook_air_m1_2020_full01_hmplsgri.jpg',
              //   name: 'Macbook Air M1',
              //   price: 'Rp 9.239.933',
              // );
              return MostPopularItem(
                index: index,
                image:
                    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-13599224/apple_apple_macbook_air_m1_2020_full01_hmplsgri.jpg',
                name: 'Playstation 4 Pro',
              );
            },
          ),
        ),
      ),
    );
  }
}
