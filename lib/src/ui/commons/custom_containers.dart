import 'package:flutter/material.dart';

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
  final Function(String? s)? onSubmitted;
  final Function(String? s)? onChanged;
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
