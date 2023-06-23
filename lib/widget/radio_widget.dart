import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/radio_button_provider.dart';

class RadioWidget extends ConsumerWidget {
  final String titleRadio;
  final Color categoryColor;
  final int valueInput;
  final VoidCallback onChangeValue;
  const RadioWidget(
      {super.key,
      required this.onChangeValue,
      required this.valueInput,
      required this.titleRadio,
      required this.categoryColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);

    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
            activeColor: categoryColor,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-22, 0),
              child: Text(
                titleRadio,
                style: TextStyle(
                    color: categoryColor, fontWeight: FontWeight.w700),
              ),
            ),
            value: valueInput,
            groupValue: radio,
            onChanged: (value) => onChangeValue()),
      ),
    );
  }
}
