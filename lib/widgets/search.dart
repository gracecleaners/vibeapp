import 'package:flutter/material.dart';
import 'package:vibeapp/const/colors.dart';

class SearchTextField extends StatelessWidget {
  final String labelText;
  final TextStyle? labelStyle;
  final Widget? suffixIcon;
  final Color fillColor;
  final Color iconColor;
  final Color borderColor; // New parameter for border color

  const SearchTextField({
    Key? key,
    this.labelText = "SEARCH...",
    this.labelStyle,
    this.suffixIcon,
    this.fillColor = Colors.white,
    this.iconColor = Coloors.primary,
    this.borderColor = Coloors.primary, // Default border color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: suffixIcon ?? Icon(
          Icons.search,
          color: iconColor,
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: labelText,
        labelStyle: labelStyle ?? const TextStyle(color: Coloors.primary, fontSize: 13),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: borderColor, // Set the border color
            width: 1.5, // Adjust the border width if needed
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: borderColor, // Set the border color for the enabled state
            width: 1.5, // Adjust the border width if needed
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: borderColor, // Set the border color for the focused state
            width: 1.5, // Adjust the border width if needed
          ),
        ),
        isDense: true,
      ),
    );
  }
}
