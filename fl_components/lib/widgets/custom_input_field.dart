import 'package:flutter/material.dart';

class CustomImputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomImputField({
    Key? key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType == null ? TextInputType.text : keyboardType,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'Este campo es obligatorio';
        return value.length < 3
            ? 'El nombre debe tener al menos 3 caracteres'
            : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
        /*focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.greenAccent, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),*/
      ),
    );
  }
}
