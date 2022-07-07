import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  /*const CustomTextformField({ Key? key, }) : super(key: key);*/

  final String hint;
  final funValidator;
  //final String? value;
  final controller;

  const CustomTextArea({required this.hint, required this.funValidator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        //initialValue: value,
        maxLines: 10,
        maxLength: 20,
        validator: funValidator,
       // obscureText: hint=='Password' ? true : false,
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