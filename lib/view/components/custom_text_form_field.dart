import 'package:flutter/material.dart';

class CustomTextformField extends StatelessWidget {
  /*const CustomTextformField({ Key? key, }) : super(key: key);*/

  final String hint;
  final funValidator;
  final String? value;
  final controller;

  const CustomTextformField({required this.hint, required this.funValidator, this.value, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        initialValue: value,
        validator: funValidator,
        obscureText: hint=='Password' ? true : false,
        decoration: InputDecoration(
          hintText: 'Enter $hint',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}