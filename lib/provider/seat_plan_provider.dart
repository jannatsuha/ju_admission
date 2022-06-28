import 'package:admission_help_ju/model/seat_plan_model.dart';
import 'package:admission_help_ju/repo/seat_plan_repo.dart';
import 'package:flutter/material.dart';
class SeatPlanProvider with ChangeNotifier {

  SeatPlanRepo seatPlanRepo= SeatPlanRepo();
  SeatPlanModel _seatPlanModel= SeatPlanModel();
  SeatPlanModel get getSeatPlanModel =>
      _seatPlanModel;

  initializeSeatPlanModel(){
    _seatPlanModel= seatPlanRepo.seatPlanModel;
    notifyListeners();
  }
}