import 'package:admission_help_ju/helper/custom_appbar_one.dart';
import 'package:admission_help_ju/helper/custom_button.dart';
import 'package:admission_help_ju/helper/custom_text_field.dart';
import 'package:admission_help_ju/provider/seat_plan_provider.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class PlanView extends StatefulWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  _PlanViewState createState() => _PlanViewState();
}
void _launchURL( url) async {
  if (!await launchUrl(url))
    throw 'Could not launch $url';
}

String? url;
Uri? _url;
Future<void> getDirection() async{
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();
  String lat="23.8771518";
  String long="90.2628928";
  String urlTemp='https://www.google.com';
   //_url = Uri.parse('https://flutter.dev');

  _url = Uri.parse('https://www.google.com/maps/dir/?api=1&origin=' +
      _locationData.latitude.toString() +
      ',' +
      _locationData.longitude.toString() +
      '&destination=' +
      lat.toString() +
      ',' +
      long.toString() +
      '&travelmode=driving&dir_action=navigate');
}
class _PlanViewState extends State<PlanView> {
  @override
  void initState() {
    super.initState();
    getDirection();
  }
  @override
  Widget build(BuildContext context) {
    double scrHeight=MediaQuery.of(context).size.height;
    double scrWidth=MediaQuery.of(context).size.width;
    Provider.of<SeatPlanProvider>(context,listen: false)
        .initializeSeatPlanModel();
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back)
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: CustomshapeOne(),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    //opacity: 0.3,
                    image: AssetImage(
                        'assets/image/ju3.jpg'
                    ),fit: BoxFit.cover
                )
            ),
            height: 250,
            width: MediaQuery.of(context).size.width,
            // color: AllColor.appColor,
            child: Padding(
              padding:  EdgeInsets.only(top: 35.0,
                  left: MediaQuery.of(context).size.width/22,
                  right: 20),
            ),
          ),
        ),
      ),
      body: Consumer<SeatPlanProvider>(
          builder: (context,planProvider,index){
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Seat Plan Details",
                  style: TextStyle(color: allColor.appColor,
                      fontSize: 20),),
                SizedBox(
                  height: 10,
                ),
               cusRow("Student Roll: ",
                   planProvider.getSeatPlanModel.stdRoll.toString()),
                cusRow("Exam Date: ",
                    planProvider.getSeatPlanModel.admisdate.toString()),
                cusRow("Building name: ",
                    planProvider.getSeatPlanModel.buildingName.toString()),
                cusRow("Room Number: ",
                    planProvider.getSeatPlanModel.roomNum.toString()),
                cusRow("Shift: ",
                    planProvider.getSeatPlanModel.examShift.toString()),

                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    _launchURL(_url!);
                  },
                  child: CustomButton(
                      height: scrHeight*0.06,
                      width: scrWidth*0.60,
                      btnText: "GET DIRECTION"),
                )

              ],
            );
          },
      )
    );
  }
}
Column cusRow(itemName, itemValue){
  return  Column(
    children: [
      Text("- - - - - - - - - - - - - - - - - - - - - - - - - -",
      style: TextStyle(color: Colors.grey,
      fontSize: 20),),
      Padding(
        padding: const EdgeInsets.only(left:30,
        right: 30),
        child: Row(
          children: [
            Text(itemName),
            Spacer(),
            Text(itemValue)
          ],
        ),
      ),
    ],
  );
}
