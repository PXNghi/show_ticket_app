import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class RecommendTextItem extends StatelessWidget {
  final String recommendText;
  final bool isHighlightText;
  const RecommendTextItem({
    required this.recommendText,
    this.isHighlightText = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isHighlightText ? hotPink : grayContentColor,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: recommendText,
                    style: TextStyle(
                      color: isHighlightText ? hotPink : grayContentColor,
                      fontWeight: isHighlightText ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  WidgetSpan(
                    child: Visibility(
                      visible: isHighlightText,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                          hotFireIcon,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
