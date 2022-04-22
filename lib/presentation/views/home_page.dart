import 'package:flutter/material.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/best_offer_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/category_item_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/most_popular_item_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/search_text_edit.dart';
import 'package:latihan_e_commerce_app/utils/theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            // WIDGET : SEARCH BAR
            searchBar(),
            // WIDGET : CATEGORY CARD
            categoryCard(),
            // WIDGET : BEST OFFER
            bestOffer(),
            // WIDGET : MOST POPULAR ITEM
            mostPopularItem(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SearchTextEdit(
        hint: 'Cari Produk',
        textInputType: TextInputType.text,
        textEditingController: _searchController,
        textInputAction: TextInputAction.search,
      ),
    );
  }

  Widget categoryCard() {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CategoryItemTile(category: 'Pakaian Pria'),
            CategoryItemTile(category: 'Handphone'),
            CategoryItemTile(category: 'Otomotif'),
            CategoryItemTile(category: 'Pakaian Wanita'),
          ],
        ),
      ),
    );
  }

  Widget bestOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Penawaran Terbaik',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                BestOfferTile(
                  image:
                      'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbook-air-gallery3-20201110?wid=2000&hei=1536&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1603399121000',
                  name: 'Macbook Air M1',
                  price: 'Rp 14.599.000',
                ),
                BestOfferTile(
                  image:
                      'https://www.sony.co.id/image/5d02da5df552836db894cead8a68f5f3?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF',
                  name: 'Sony WH-1000XM4',
                  price: 'Rp 3.459.000',
                ),
                BestOfferTile(
                  image:
                      'https://www.panasonic.com/content/dam/pim/id/id/TH/TH-32D/TH-32D400G/TH-32D400G-Variation_Image_for_See_All_1Global-1_id_id.png',
                  name: 'Panasonic TV LED TH-32D400G',
                  price: 'Rp 5.559.000',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget mostPopularItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            'Paling Banyak Dicari',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                MostPopularItem(
                  index: 0,
                  image:
                      'https://i01.appmifile.com/webfile/globalimg/id/cms/1F41DE96-F035-CFC1-582C-25D074199A5B.jpg',
                  name: 'Xiaomi Band 2',
                  price: 'Rp 399.000',
                ),
                MostPopularItem(
                  index: 1,
                  image:
                      'https://images.tokopedia.net/img/cache/700/product-1/2019/5/11/60765484/60765484_188a21d2-f4d5-40e6-b0e9-975431a4621d_500_500',
                  name: 'Playstation 4 Pro',
                  price: 'Rp 4.439.000',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
