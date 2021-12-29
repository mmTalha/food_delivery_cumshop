import 'package:flutter/cupertino.dart';

class cartprovider with ChangeNotifier{
  int cartvalue = 0;
  bool isloading=false;
  bool animation = false;

   void cartbadge(){
     cartvalue ++;
     notifyListeners();
   }




}