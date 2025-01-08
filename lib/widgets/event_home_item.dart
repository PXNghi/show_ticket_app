import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class EventHomeItem extends StatefulWidget {
  const EventHomeItem({
    super.key,
    required this.size,
    this.onTap,
    required this.eventName,
    required this.minPrice,
    required this.maxPrice,
    this.tags,
    required this.eventImg,
  });

  final Size size;
  final VoidCallback? onTap;
  final String eventName;
  final String minPrice;
  final String maxPrice;
  final String eventImg;
  final List<String>? tags;

  @override
  State<EventHomeItem> createState() => _EventHomeItemState();
}

class _EventHomeItemState extends State<EventHomeItem> {
  bool _isChosen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      width: widget.size.width * 0.6,
      height: widget.size.height * 0.3,
      decoration: const BoxDecoration(
        borderRadius: cardRadius,
        color: grey36Color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: cardRadius,
                  child: Image.asset(
                    widget.eventImg,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: defaultPadding,
                    right: defaultPadding,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChosen = !_isChosen;
                        });
                      },
                      child:
                          Image.asset(_isChosen ? heartFilledIcon : heartIcon),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.eventName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Từ ${widget.minPrice} - ${widget.maxPrice}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: primaryColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Visibility(
                    visible: widget.tags != null,
                    child: SizedBox(
                      height: 26.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: widget.tags!
                            .map(
                              (tag) => Padding(
                                padding: const EdgeInsets.only(right: defaultPadding),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: grey5BColor,
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
