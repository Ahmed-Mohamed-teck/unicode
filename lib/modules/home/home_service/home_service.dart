import 'package:unicodetask/data/moc_data.dart';

class HomeService{
  getUserData()async{
      return MocData.userModel;
  }
}