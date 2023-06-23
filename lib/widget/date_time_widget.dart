import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constant/app_style.dart';
import 'package:todo_app/constant/color_style.dart';

class DateTimeWidget extends ConsumerWidget {
  final String titleText;
  final String valueText;
  final IconData icon;
  final VoidCallback onTapDateTime;
  const DateTimeWidget(
      {super.key,
      required this.titleText,
      required this.valueText,
      required this.icon,
      required this.onTapDateTime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: AppStyle.headingStyle,
          ),
          const SizedBox(height: 6),
          Material(
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onTapDateTime(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: transparentColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 6),
                      Text(valueText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
