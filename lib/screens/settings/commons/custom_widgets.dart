import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final double? height;
  final Color? fillColor;
  final int? maxLines;
  final IconData? icon;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final Widget? suffixText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final bool? readOnly;
  final int? maxLength;
  final TextAlign? textAlign;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.controller,
      this.style,
      this.hintTextStyle,
      this.height,
      this.fillColor,
      this.contentPadding,
      this.maxLines,
      this.keyboardType,
      this.icon,
      this.suffixText,
      this.onTap,
      this.readOnly,
      this.onSubmitted,
      this.onChanged,
      this.maxLength,
      this.textAlign,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: TextField(
        maxLength: maxLength,
        readOnly: readOnly!,
        maxLines: maxLines,
        keyboardType: keyboardType,
        controller: controller,
        textAlign: textAlign == null ? TextAlign.start : textAlign!,
        autofocus: false,
        style: style,
        textCapitalization: TextCapitalization.words,
        onTap: onTap,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: new InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(22.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.none,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(22.0),
              ),
            ),
            border: new OutlineInputBorder(),
            filled: true,
            counterText: "",
            hintStyle: hintTextStyle,
            hintText: "$hintText",
            fillColor: fillColor,
            prefixIcon: prefixIcon == null ? null : prefixIcon,
            suffixIcon: icon == null
                ? (suffixText == null)
                    ? null
                    : Container(
                        margin: EdgeInsets.all(8.0),
                        alignment: Alignment.centerRight,
                        child: suffixText)
                : Icon(icon),
            contentPadding: contentPadding),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final double? height;

  const CustomButton({Key? key, this.onPressed, this.title, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
            style: BorderStyle.solid, width: 1.0, color: Colors.blue),
      ),
      child: MaterialButton(
        child: Text(title!),
        onPressed: onPressed,
      ),
    );
  }
}

class CommonPrivacyPageWidget extends StatelessWidget {
  final String? title;
  final String? body;
  final String? selectedValue;
  final Function(dynamic val)?onChangedA;
  final Function(dynamic val)? onChangedB;
  final Function()? onPressed;
  final String? radioBTNLabelA;
  final String? radioBTNLabelB;
  final String? radioValueA;
  final String? radioValueB;
  final String? btnName;
  final String? optionalText;

  const CommonPrivacyPageWidget(
      {Key? key,
      this.selectedValue,
      this.title,
      this.body,
      this.onChangedA,
      this.onChangedB,
      this.radioBTNLabelA,
      this.radioBTNLabelB,
      this.radioValueA,
      this.radioValueB,
      this.onPressed,
      this.btnName, this.optionalText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
            // textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20.0),
          Text(body!,
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              textAlign: TextAlign.justify),
          SizedBox(height: 20.0),
          radioBTNLabelA == null
              ? Container(
                  child: Text(optionalText!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                )
              : Container(
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      RadioButton(
                        description: radioBTNLabelA!,
                        value: radioValueA,
                        groupValue: selectedValue,
                        onChanged:onChangedA,
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      RadioButton(
                        description: radioBTNLabelB!,
                        value: radioValueB,
                        groupValue: selectedValue,
                        onChanged: onChangedB,
                        // textPosition: RadioButtonTextPosition.left,
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
          Spacer(),
          CustomButton(
            title: btnName,
            onPressed: onPressed,
            height: 30.0,
          )
        ],
      ),
    );
  }
}
