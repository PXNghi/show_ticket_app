import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:show_ticket_app/components/my_icon_button.dart';
import 'package:show_ticket_app/ui_values.dart';
import 'package:show_ticket_app/widgets/event_home_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentBannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        titleSpacing: 0,
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            homeLogoImg,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: MyIconButton(image: searchIcon, onTap: () {}),
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(defaultPadding, 0, 0, defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: CarouselSlider(
                items: bannerImageList
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                          child: Image.asset(
                            e,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: size.height * 0.28,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerImageList
                  .asMap()
                  .entries
                  .map((e) => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentBannerIndex == e.key
                              ? primaryColor
                              : Colors.grey,
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  outstandingEvents,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      seeAll,
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: bannerImageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: EventHomeItem(
                      size: size,
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
