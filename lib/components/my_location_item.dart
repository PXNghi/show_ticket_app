import 'package:flutter/material.dart';
import 'package:show_ticket_app/ui_values.dart';

class LocationItem extends StatefulWidget {
  final String locationName;
  final Function(String) onTapValue;
  const LocationItem({
    super.key,
    required this.locationName,
    required this.onTapValue,
  });

  @override
  State<LocationItem> createState() => _LocationItemState();
}

class _LocationItemState extends State<LocationItem> {
  bool _isChosen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChosen = !_isChosen;
          widget.onTapValue!(widget.locationName);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: _isChosen ? primaryColor : grey5BColor,
        ),
        child: Center(
          child: Text(
            widget.locationName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
