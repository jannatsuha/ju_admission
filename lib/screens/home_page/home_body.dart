import 'package:admission_help_ju/helper/custom_button.dart';
import 'package:admission_help_ju/helper/custom_text_field.dart';
import 'package:admission_help_ju/screens/plan_view.dart';
import 'package:admission_help_ju/utills/all_strings.dart';
import 'package:flutter/material.dart';
class HomeBodyPart extends StatefulWidget {
  const HomeBodyPart({Key? key}) : super(key: key);

  @override
  _HomeBodyPartState createState() => _HomeBodyPartState();
}
AllStrings allStrings=AllStrings();
TextEditingController rollController=TextEditingController();
class _HomeBodyPartState extends State<HomeBodyPart> {
  @override
  Widget build(BuildContext context) {
    double scrHeight=MediaQuery.of(context).size.height;
    double scrWidth=MediaQuery.of(context).size.width;
    return  Container(
       decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/image/ju1.jpg"),
      //     fit: BoxFit.cover
      //   ),
      //   boxShadow: [
      //     BoxShadow(blurRadius: 8.0,color: Colors.grey.shade400),
      //     BoxShadow(color: Colors.white, offset: Offset(0, 10)),
      //     BoxShadow(color: Colors.white, offset: Offset(0, 10)),
      //     BoxShadow(color: Colors.white, offset: Offset(0, 0)),
      //     BoxShadow(color: Colors.white, offset: Offset(10, 10)),
      //   ],
        color: allColor.backClr,
        borderRadius: BorderRadius.only(
            topRight:Radius.circular(20),
            topLeft:Radius.circular(20),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                Text(allStrings.youCan,textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  color: allColor.textClrBlack,
                  fontWeight: FontWeight.w100
                ),),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            CustomTextField(
                textController: rollController,
                hintText: "Enter your roll number",
                obsecureVal: false,
                labelText: "Roll Number"
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder:(cntext)=>
                PlanView())
                );
              },
              child: CustomButton(
                  height: scrHeight*0.06,
                  width: scrWidth*0.50,
                  btnText: "SUBMIT"),
            )
          ],
        ),
      ),
    );
  }
}
