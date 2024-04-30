import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputType textInputType;
  final double? top;
  final double? bottom;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? formatter;
  final void Function(String)? onCahnged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onOutTap;
  final String? Function(String?)? validator;
  final bool? readOnly;
  const CustomTextFormFiled(
      {super.key,
      this.hint,
      this.controller,
      this.obscure,
      required this.textInputType,
      this.top,
      this.bottom,
      this.suffixIcon,
      this.formatter,
      this.onCahnged,
      this.onEditingComplete,
      this.onTap,
      this.onOutTap,
      this.readOnly,
      this.validator,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top ?? 14, bottom: bottom ?? 34),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 6),
              color: Colors.blue.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        readOnly: readOnly ?? false,
        inputFormatters: formatter,
        controller: controller,
        validator: validator ,
        initialValue: initialValue,
        onTapOutside: onOutTap ??
            (event) {
              FocusManager.instance.primaryFocus!.unfocus();
            },
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onCahnged,
        obscureText: obscure ?? false,
        obscuringCharacter: '*',
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(24),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(24),
          ),
          contentPadding:
              const EdgeInsets.only(left: 20, bottom: 25, top: 25, right: 20),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
