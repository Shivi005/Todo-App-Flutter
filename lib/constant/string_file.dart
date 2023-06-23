import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
String profileImage =
    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60';
String titleText = 'Hello I\'m';
String userName = 'Shivani Shukla';
String todayTaskText = 'Today\'s Task';
String newTaskButtonTask = '+ New Task';
TextEditingController descriptionController = TextEditingController();
TextEditingController titleController = TextEditingController();
DateFormat? format;
String addTaskText = 'Add Task Todo';
String titleTaskText = 'Title Task';
String addTextNameHint = 'Add text name';
String descriptionText = 'Description';
String addDescriptionHint = 'Add description';
String categoryText = 'Category';
String lrnRadioText = 'LRN';
String wfhRadioText = 'WFH';
String generalRadioText = 'GEN';
String dateText = 'Date';
String timeText = 'Time';
String cancelButttonText = 'Cancel';
String createButtonText = 'Create';
