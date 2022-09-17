import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clean_architecture/core/utils/global/shared/size_config.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.validate})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final String? Function(String? value)? validate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 14),
              margin: const EdgeInsets.only(top: 8),
              height: 60,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: controller,
                    validator: validate,
                    autofocus: false,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    readOnly: widget != null ? true : false,
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: hint,
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                        errorMaxLines: 1,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorText: '',
                        errorStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 0,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor))),
                  )),
                  widget ?? const SizedBox(),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
