import 'package:flutter/material.dart';
import 'package:show_ticket_app/components/my_icon_button.dart';
import 'package:show_ticket_app/ui_values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(defaultPadding, 0, 0, defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  outstandingEvents,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
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
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
