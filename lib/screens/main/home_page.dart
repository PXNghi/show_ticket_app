import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_ticket_app/components/my_icon_button.dart';
import 'package:show_ticket_app/components/my_nav_menu_icon.dart';
import 'package:show_ticket_app/screens/login_page.dart';
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
            child: MyIconButton(image: searchIcon, onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );

            }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(defaultPadding, 0, 0, defaultPadding),
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
              _buildHorizontalEventList(size, outstandingEventsText),
              const SizedBox(height: defaultPadding),
              _buildHorizontalEventList(size, concertText),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 62,
        decoration: BoxDecoration(
          color: grey36Color,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: grey36Color.withOpacity(0.2),
              offset: const Offset(0, -10),
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconNavMenuButton(onTap: () {}, icon: homeFilledIcon, label: "Trang chủ", isActive: true),
              IconNavMenuButton(onTap: () {}, icon: ticketIcon, label: "Vé của tôi", isActive: false),
              IconNavMenuButton(onTap: () {}, icon: greyHeartIcon, label: "Theo dõi", isActive: false),
              IconNavMenuButton(onTap: () {}, icon: profileIcon, label: "Cá nhân", isActive: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalEventList(Size size, String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  seeAllText,
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: outstandingEventList
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: EventHomeItem(
                      size: size,
                      eventName: e.eventName,
                      minPrice: e.minPrice,
                      maxPrice: e.maxPrice,
                      eventImg: e.eventImg,
                      tags: e.tags,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
