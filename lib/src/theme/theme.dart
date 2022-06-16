import 'package:flutter/material.dart';



class ThemeChanger with ChangeNotifier{

bool _darkTheme   = false;
bool _customTheme = false;
late ThemeData _currentTheme;
ThemeChanger ( int theme){
  switch ( theme) {
    case 1: //light
    _darkTheme    = false;
    _customTheme  = false;
    _currentTheme = ThemeData.light();
    break;
     case 2: //dark
    _darkTheme    = true;
    _customTheme  = false;
    _currentTheme = ThemeData.dark();
    break;
     case 3: //light
    _darkTheme    = false;
    _customTheme  = true;
    break;
    default: 
    _darkTheme    = false;
    _customTheme  = false;
    _currentTheme = ThemeData.light();
  }
}

bool get darkTheme   => _darkTheme;
bool get customTheme => _customTheme;
ThemeData get currentTheme => _currentTheme; 

set darkTheme ( bool value ){
_customTheme = false;
_darkTheme   = value;
notifyListeners();

if (value ) {
  _currentTheme = ThemeData.dark();
} else {
  _currentTheme = ThemeData.light();
}

}

set customTheme ( bool value ){
_customTheme = value;
_darkTheme   = false;
notifyListeners();

if (value ) {
  _currentTheme = ThemeData.light();
} else {
  _currentTheme = ThemeData.light();
}


}

}

