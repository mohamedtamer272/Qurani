import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
ThemeMode theme =ThemeMode.light;
@override
  void notifyListener(ThemeMode themeCode) {
  theme=themeCode;
    notifyListeners();
  }
  String GetBackground(){
  if(theme==ThemeMode.light){
    return 'assets/image/default_bg.png';
  }
  return 'assets/image/dark_bg.png';
  }
String Getsebha(){
  if(theme==ThemeMode.light){
    return 'assets/image/sebhalogo.png';
  }
  return 'assets/image/Group8.png';
}
}