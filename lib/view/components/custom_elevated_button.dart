import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomElevatedButton extends StatelessWidget {
  //const CustomElevatedButton({Key? key,}) : super(key: key);
  final String text;
  final funPageRoute;


  const CustomElevatedButton({required this.text, required this.funPageRoute}) ;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
        onPressed: funPageRoute,
        child: Text('$text'));
  }
}