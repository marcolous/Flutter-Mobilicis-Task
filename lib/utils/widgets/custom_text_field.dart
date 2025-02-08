import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilicis_task/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPhone = false,
    this.isPassword = false,
    required this.title,
  });
  final String hintText;
  final TextEditingController? controller;
  final bool isPhone;
  final bool isPassword;
  final String title;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isSecure;

  @override
  void initState() {
    super.initState();
    isSecure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppStyles.style12BlackRegular,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required field';
                }
                return null;
              },
              obscureText: isSecure,
              keyboardType: widget.isPhone
                  ? TextInputType.phone
                  : TextInputType.emailAddress,
              style: AppStyles.style16DarkGreyRegular,
              controller: widget.controller,
              decoration: InputDecoration(
                prefixText: widget.isPhone ? '+91 ' : null, // Added prefix text
                prefixStyle: AppStyles.style16DarkGreyRegular,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () => setState(() => isSecure = !isSecure),
                        icon: Icon(
                          isSecure
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                      )
                    : null,
                hintText: widget.hintText,
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
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );
  }
}
