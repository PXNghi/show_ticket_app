import 'package:flutter/material.dart';
import 'package:show_ticket_app/components/my_location_item.dart';
import 'package:show_ticket_app/components/my_search_box.dart';
import 'package:show_ticket_app/ui_values.dart';
import 'package:show_ticket_app/widgets/recommend_text_item.dart';
import 'package:show_ticket_app/widgets/search_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _location = "Toàn quốc";
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          titleSpacing: 0,
          centerTitle: true,
          leadingWidth: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SearchBoxItem(searchTextEditingController: textController,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4.0),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: grey36Color,
                    builder: (context) {
                      return SizedBox(
                        height: size.height * 0.4,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                              child: Text(
                                locationsText,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: size.height * 0.4 - 64,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 4.0,
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12.0,
                                    childAspectRatio: 3,
                                    mainAxisSpacing: 12.0,
                                  ),
                                  itemCount: locationList.length,
                                  itemBuilder: (context, index) {
                                    return LocationItem(
                                      onTapValue: (value) {
                                        setState(() {
                                          _location = value;
                                        });
                                      },
                                      locationName: locationList[index],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: size.width * 0.42,
                  margin: const EdgeInsets.only(top: 8.0),
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: whiteAAColor),
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.transparent),
                  child: Row(
                    children: [
                      Image.asset(locationIcon, width: 24, height: 24),
                      Expanded(
                        child: Text(
                          _location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: greyC5Color),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Image.asset(arrowDownIcon, width: 24, height: 24),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0, top: 24.0),
                child: Text(
                  recentText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultTitleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.15,
                child: ListView(
                  shrinkWrap: true,
                  children: searchHistoryList
                      .map((e) => SearchItem(searchText: e))
                      .toList(),
                ),
              ),
              const Text(
                youMayLikeText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: defaultTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recommendEventList.length,
                  itemBuilder: (context, index) {
                    bool isHighlightText = index < 3;
                    return RecommendTextItem(
                        recommendText: recommendEventList[index],
                        isHighlightText: isHighlightText);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
