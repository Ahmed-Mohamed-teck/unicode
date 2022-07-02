import 'package:flutter/cupertino.dart';
import 'package:unicodetask/models/user_model.dart';
import 'package:unicodetask/modules/home/home_service/home_service.dart';

class HomeViewModel extends ChangeNotifier{
  final HomeService _homeService = HomeService();

  UserModel? userModel;

  Future<void> getUserData()async{
    userModel = await _homeService.getUserData();
    notifyListeners();
  }
}