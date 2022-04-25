import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/best_offer_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/category_item_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/image_slider_item.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/most_popular_item_tile.dart';
import 'package:latihan_e_commerce_app/presentation/widgets/search_text_edit.dart';
import 'package:latihan_e_commerce_app/utils/curve_painter.dart';
import 'package:latihan_e_commerce_app/utils/theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  int _currentIndex = 0;
  final List<String> cardList = [
    'https://i.pinimg.com/originals/35/11/c5/3511c58b431fbe25950bf75cfbacf37d.png',
    'https://ecs7.tokopedia.net/img/kjjBfF/2021/2/2/ed3a549c-72c6-4f52-bbf1-b6e44da735b0.png',
    'https://ecs7.tokopedia.net/img/cache/730/kjjBfF/2021/6/15/616df725-64b7-4de8-b6c7-4d8d9fff7a68.png',
    'https://ecs7.tokopedia.net/img/cache/730/kjjBfF/2021/10/23/a30ba0d2-b49c-477a-aeeb-1c9f36ff7cd3.jpg',
    'https://images.tokopedia.net/img/Template/Broadcast-chat1-Mega-cashback-Oktober.jpg',
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            // WIDGET : HEADER
            header(),
            // WIDGET : SEARCH BAR
            searchBar(),
            // WIDGET : IMAGE SLIDER
            imageSliderAuto(),
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

  Widget header() {
    return Container(
      width: double.infinity,
      height: 120,
      child: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CurvePainter(),
          ),
          // Positioned(
          //   bottom: 60,
          //   left: 30,
          //   child: Row(
          //     children: [
          //       SvgPicture.asset(
          //         'assets/images/tokopedia_logo.svg',
          //         height: 50,
          //         width: 50,
          //       ),
          //       const SizedBox(width: 8),
          //       SvgPicture.asset(
          //         'assets/images/tokopedia.svg',
          //         height: 25,
          //         width: 60,
          //       ),
          //     ],
          //   ),
          // )
          // Positioned(
          //   bottom: 70,
          //   left: 80,
          //   child: SvgPicture.asset(
          //     'assets/images/tokopedia_logo.svg',
          //     height: 50,
          //     width: 50,
          //   ),
          // ),
          Positioned(
            bottom: 60,
            left: 30,
            child: SvgPicture.asset(
              'assets/images/tokopedia.svg',
              height: 30,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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

  Widget imageSliderAuto() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              items: cardList.map((item) {
                return ImageSliderItem(image: item);
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                cardList,
                (index, url) {
                  return Container(
                    width: _currentIndex == index ? 30 : 10,
                    height: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentIndex == index
                          ? greenColor
                          : greenColor.withOpacity(0.3),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
        const SizedBox(height: 90),
      ],
    );
  }
}
