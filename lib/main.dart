import 'package:admission_help_ju/provider/seat_plan_provider.dart';
import 'package:admission_help_ju/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
        providers:[
          ChangeNotifierProvider<SeatPlanProvider>(
              create:(_)=>SeatPlanProvider() )
        ] ,
    child: MyApp()
    )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
