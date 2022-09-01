import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_clean_architecture/core/utils/global/themes/colors/colors.dart';
import 'package:todo_clean_architecture/presentation/components/button.dart';
import 'package:todo_clean_architecture/presentation/controller/task_conroller.dart';

import '../components/input_filed.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskController taskController = Get.put(TaskController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();

  List<int> remindList = [5, 10, 15, 20, 25, 30, 35, 40];
  int selectedRemind = 5;

  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  String selectedRepeat = "None";

  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Add Task",
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.grey)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InputField(
                  title: "Title",
                  hint: 'Enter tittle here',
                  controller: titleController,
                ),
                InputField(
                  title: "Note",
                  hint: 'Enter note here',
                  controller: noteController,
                ),
                InputField(
                  title: "Date",
                  hint: DateFormat.yMd().format(selectedDate),
                  widget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        title: "Start Time",
                        hint: startTime,
                        widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.watch_later_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InputField(
                        title: "End Time",
                        hint: endTime,
                        widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.watch_later_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
                StatefulBuilder(
                  builder: (context, state) {
                    return InputField(
                      title: "Remind",
                      hint: "$selectedRemind minutes early",
                      widget: DropdownButton(
                        items: remindList
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(
                                    value: e.toString(), child: Text("$e")))
                            .toList(),
                        onChanged: (String? value) {
                          state(() {
                            selectedRemind = int.parse(value!);
                          });
                        },
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                        iconSize: 30,
                        elevation: 4,
                        underline: const SizedBox(
                          height: 0,
                        ),
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  },
                ),
                StatefulBuilder(
                  builder: (context, state) {
                    return InputField(
                      title: "Repeat",
                      hint: selectedRepeat,
                      widget: DropdownButton(
                        items: repeatList
                            .map<DropdownMenuItem<String>>((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (String? value) {
                          state(() {
                            selectedRepeat = value!;
                          });
                        },
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.keyboard_arrow_down),
                        ),
                        iconSize: 30,
                        elevation: 4,
                        underline: const SizedBox(
                          height: 0,
                        ),
                        alignment: Alignment.topCenter,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    colorPalette(),
                    MyButton(
                        label: "Create Task",
                        onTap: () {
                          Get.back();
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 5,
        ),
        StatefulBuilder(
          builder: (context, state) => Wrap(
            children: List<Widget>.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  state(() {
                    selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: index == 0
                        ? AppColor.primaryClr
                        : index == 1
                            ? AppColor.pinkClr
                            : AppColor.orangeClr,
                    child: selectedColor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
