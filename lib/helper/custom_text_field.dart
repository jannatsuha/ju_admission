import 'package:admission_help_ju/utills/all_color.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatefulWidget {
  TextEditingController textController;
  String labelText;
  String hintText;
  bool obsecureVal;
   CustomTextField({Key? key,
     required this.textController,
     required this.hintText,
     required this.obsecureVal,
   required this.labelText})
       : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}
AllColor allColor=AllColor();
String pass="";
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0,
      left: 18),
      child: TextFormField(
        validator: (value){

          if(value == null || value.isEmpty){
            return "This field can not be empty";
          }

        },
        obscureText: widget.obsecureVal,
        cursorColor: allColor.appColor,
        controller: widget.textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w200
          ),
          hintText: widget.hintText,
          suffixIcon: Icon(Icons.help_center,
          color: allColor.labelClr,),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: allColor.labelClr
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: allColor.appColor
            )
          ) ,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: allColor.appColor
            )
          )
        ),
      ),
    );
  }
}
