import 'package:admission_help_ju/helper/custom_text_field.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatefulWidget {
  double height;
  double width;
  String btnText;

   CustomButton({Key? key,
   required this.height,
   required this.width,
   required this.btnText,
   }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 8.0,color: Colors.grey.shade400),
        ],
          color: allColor.appColor,
          borderRadius: BorderRadius.circular(15)
      ),
      height: widget.height,
      width: widget.width,
      child: Center(
          child: Text(widget.btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300
          ),)
      ),
    );
  }
}
