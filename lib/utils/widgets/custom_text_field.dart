import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isText = false,
    required this.title,
    this.hasAst = false,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool isText;
  final String title;
  final bool hasAst;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: AppStyles.style12BlackRegular,
              children: [
                hasAst
                    ? TextSpan(
                        text: '*',
                        style: AppStyles.style12BlackRegular
                            .copyWith(color: Colors.red),
                      )
                    : const TextSpan(),
              ],
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required field';
                }
                if (!isText && controller!.text.length < 10) {
                  return 'Enter a valid number';
                }
                return null;
              },
              keyboardType: !isText ? TextInputType.phone : TextInputType.text,
              style: AppStyles.style16DarkGreyRegular,
              controller: controller,
              decoration: InputDecoration(
                prefix: !isText
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Text(
                          '+91 ',
                          style: AppStyles.style16DarkGreyRegular,
                        ),
                      )
                    : null,
                prefixStyle: AppStyles.style16DarkGreyRegular,
                hintText: hintText,
                hintStyle: AppStyles.style16LightGreyRegular,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: borderDecoration(),
                enabledBorder: borderDecoration(),
                errorBorder: errBorderDecoration(),
                focusedErrorBorder: errBorderDecoration(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder borderDecoration() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xffCCCCCC),
        width: 1,
      ),
    );
  }

  InputBorder errBorderDecoration() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );
  }
}
