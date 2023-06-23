import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constant/app_style.dart';
import 'package:todo_app/constant/color_style.dart';
import 'package:todo_app/constant/string_file.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/date_time_provider.dart';
import 'package:todo_app/provider/radio_button_provider.dart';
import 'package:todo_app/provider/service_provider.dart';
import 'package:todo_app/widget/card_list_widget.dart';
import 'package:todo_app/widget/date_time_widget.dart';
import 'package:todo_app/widget/radio_widget.dart';
import 'package:todo_app/widget/textfield_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoDataList = ref.watch(fetchStreamProvider);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFc6caec),
        foregroundColor: whiteColor,
        titleSpacing: 0,
        title: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profileImage),
          ),
          title: Text(
            titleText,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          subtitle: Text(
            userName,
            style: const TextStyle(fontSize: 12, color: blackColor),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todayTaskText,
                      style: const TextStyle(
                        fontSize: 22,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        currentDate,
                        style: const TextStyle(color: greyColor),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFc6caec),
                    foregroundColor: whiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () => _show(context, ref),
                  child: Text(
                    newTaskButtonTask,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            todoDataList.value != null
                ? Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: todoDataList.value!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CardList(
                        getIndex: index,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  _show(BuildContext ctx, WidgetRef ref) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      context: ctx,
      builder: (ctx) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  addTaskText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
              ),
              const SizedBox(height: 30),
              Text(titleTaskText, style: AppStyle.headingStyle),
              const SizedBox(height: 6),
              TextFieldWidget(
                hintText: addTextNameHint,
                maxLine: 1,
                textController: titleController,
              ),
              const SizedBox(height: 12),
              Text(descriptionText, style: AppStyle.headingStyle),
              const SizedBox(height: 6),
              TextFieldWidget(
                hintText: addDescriptionHint,
                maxLine: 3,
                textController: descriptionController,
              ),
              const SizedBox(height: 12),
              Text(categoryText, style: AppStyle.headingStyle),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: RadioWidget(
                      categoryColor: greenColor,
                      titleRadio: lrnRadioText,
                      valueInput: 1,
                      onChangeValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 1),
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      categoryColor: Colors.blue.shade700,
                      titleRadio: wfhRadioText,
                      valueInput: 2,
                      onChangeValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 2),
                    ),
                  ),
                  Expanded(
                    child: RadioWidget(
                      categoryColor: Colors.amberAccent.shade700,
                      titleRadio: generalRadioText,
                      valueInput: 3,
                      onChangeValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateTimeWidget(
                      titleText: dateText,
                      valueText: ref.watch(dateProvider),
                      icon: CupertinoIcons.calendar,
                      onTapDateTime: () async {
                        final getValue = await showDatePicker(
                            context: ctx,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2025));

                        if (getValue != null) {
                          format = DateFormat.yMd();
                          ref.read(dateProvider.notifier).update(
                                (state) => format!.format(getValue),
                              );
                        }
                      }),
                  const SizedBox(width: 22),
                  DateTimeWidget(
                    titleText: timeText,
                    valueText: ref.watch(timeProvider),
                    icon: CupertinoIcons.clock,
                    onTapDateTime: () async {
                      final getTime = await showTimePicker(
                        context: ctx,
                        initialTime: TimeOfDay.now(),
                      );
                      if (getTime != null) {
                        ref.read(timeProvider.notifier).update(
                              (state) => getTime.format(ctx),
                            );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteColor,
                        foregroundColor: const Color(0xFFc6caec),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: Color(0xFFc6caec),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(cancelButttonText),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFc6caec),
                        foregroundColor: whiteColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        final getRadioValue = ref.read(radioProvider);
                        String category = '';
                        switch (getRadioValue) {
                          case 1:
                            category = 'Learning';
                            break;
                          case 2:
                            category = 'Working';
                            break;
                          case 3:
                            category = 'General';
                            break;
                        }

                        ref.read(serviceProvider).addNewTask(
                              TodoModel(
                                titleTask: titleController.text,
                                description: descriptionController.text,
                                category: category,
                                dateTask: ref.read(dateProvider),
                                timeTask: ref.read(timeProvider),
                                isDone: false,
                              ),
                            );
                        titleController.clear();
                        descriptionController.clear();
                        ref.read(radioProvider.notifier).update((state) => 0);
                        ref
                            .read(dateProvider.notifier)
                            .update((state) => 'dd/mm/yy');
                        ref
                            .read(timeProvider.notifier)
                            .update((state) => 'hh : mm');

                        Navigator.pop(ctx);
                      },
                      child: Text(createButtonText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
