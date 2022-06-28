import 'package:admission_help_ju/helper/custom_appbar_one.dart';
import 'package:admission_help_ju/helper/custom_text_field.dart';
import 'package:admission_help_ju/screens/drawer/drawer_menu.dart';
import 'package:admission_help_ju/screens/home_page/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return
      AdvancedDrawer(
        openRatio: 0.65,
        openScale: 0.75,
        backdropColor: allColor.drawerClr,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration:
        const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          // NOTICE: Uncomment if you want to add shadow behind the page.
          // Keep in mind that it may cause animation jerks.
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.black12,
          //     blurRadius: 0.0,
          //   ),
          // ],
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          floatingActionButtonLocation:
          FloatingActionButtonLocation.startDocked,
          floatingActionButton:
          CircleAvatar(radius: 25,
            backgroundColor: allColor.appColor,
            child: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder
              <AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child:
                   // Image.asset("assets/image/julogo.png"),
                    Icon(
                      value.visible ? Icons.clear : Icons.menu_open,
                    //  key: ValueKey<bool>(value.visible),
                      color: allColor.textClrWhite,
                      size: 25,
                    ),
                  );
                },
              ),
            ),
          ),
          backgroundColor: Colors.white,
          appBar:
            AppBar(
              toolbarHeight: 200,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: ClipPath(
                clipper: CustomshapeOne(),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.3,
                      image: AssetImage(
                        'assets/image/ju1.jpg'
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
                    child: Container(
                     // width: 50,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            child: Image.asset("assets/image/julogo.png"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("JAHANGIRNAGAR\nUNIVERSITY",
                            maxLines: 4,textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24,color:
                            allColor.appColor,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          body:
           HomeBodyPart()
        ),
        drawer:
        DrawerMenu()
      );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
