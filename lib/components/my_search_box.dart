import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class SearchBoxItem extends StatelessWidget {
  TextEditingController? searchTextEditingController = TextEditingController();
  SearchBoxItem({
    this.searchTextEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      child: TextField(
        controller: searchTextEditingController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: primaryColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(color: whiteAAColor, width: 1.0),
          ),
          fillColor: grey36Color,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              searchIcon,
              width: 24,
              height: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                searchTextEditingController!.clear();
              },
              icon: const Icon(
                Icons.close,
                color: greyC5Color,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
          hintText: searchText,
          hintStyle: const TextStyle(color: grayContentColor),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

