import 'package:dream_store_app/locale/locale_controller.dart';
import 'package:dream_store_app/view/widget/share_compont/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utilities/constants.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.suffixIcon = false,
      this.isDense,
      this.obscureText = false,
      this.controller});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  late ThemeData _theme;
  late final MyLocaleController _myLocaleController =
      Get.put(MyLocaleController());
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
              alignment: _myLocaleController.languageData == "ar"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: customText(
                  text: widget.labelText,
                  fontColor: _theme.colorScheme.primary,
                  fontSize: Constants.textMedium)),
          TextFormField(
            style: TextStyle(
                color: _theme.colorScheme.primary, fontFamily: 'NotoSerif'),
            cursorColor: Constants.kSecondaryColor,
            obscureText: (widget.obscureText && _obscureText),
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: _theme.colorScheme.primary)),
              hintStyle: const TextStyle(color: Constants.kGranTextColor),
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: Constants.kGranTextColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'required!';
              }
              return null;
            },
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
