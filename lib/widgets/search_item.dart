import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class SearchItem extends StatelessWidget {
  final String searchText;
  const SearchItem({
    required this.searchText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            searchText,
            style: const TextStyle(color: grayContentColor),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.close,
              color: grayContentColor,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
