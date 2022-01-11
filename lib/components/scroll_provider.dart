import 'dart:math';

import 'package:flutter/cupertino.dart';

class ScrollProvider extends ChangeNotifier {
  late  FixedExtentScrollController _scrollControllerR;
  late  FixedExtentScrollController _scrollControllerG;
  late  FixedExtentScrollController _scrollControllerB;
  late  Color colors ;
  late int _red ;
  late int _green ;
  late int _blue ;

  int get red => _red;
  int get green => _green;
  int get blue => _blue;

  ScrollProvider(){
    _scrollControllerR = FixedExtentScrollController();
    _scrollControllerG = FixedExtentScrollController();
    _scrollControllerB = FixedExtentScrollController();
  _red= 0;
  _green= 0;
  _blue= 0;
    colors = const Color.fromRGBO(0, 0,0, 1);
    
  }


  FixedExtentScrollController get scrollControllerR => _scrollControllerR;
  FixedExtentScrollController get scrollControllerG => _scrollControllerG;
  FixedExtentScrollController get scrollControllerB => _scrollControllerB;
  void colorRed (int r) {
    _red = r;
    colors = Color.fromRGBO(r, _green, _blue, 1);

    notifyListeners();
  }
   void colorGreen (int g) {
     _green = g;
    colors = Color.fromRGBO(_red, g, _blue, 1);
     

    notifyListeners();
  }
   void colorBlue (int b) {
     _blue = b;
    colors = Color.fromRGBO(_red, _green, b, 1);


    notifyListeners();
  }

  void random(){
    _red = Random().nextInt(255);
    _green = Random().nextInt(255);
    _blue = Random().nextInt(255);
    colors = Color.fromRGBO(_red, _green, _blue, 1);
    _scrollControllerR.animateToItem(
      _red,
      duration:const Duration(seconds:2),
      curve: Curves.easeInOut,
    );
    _scrollControllerG.animateToItem(
      _green,
      duration: const Duration(seconds:2),
      curve: Curves.easeInOut,
    );
    _scrollControllerB.animateToItem(
      _blue,
      duration: const Duration(seconds:2),
      curve: Curves.easeInOut,
    );

    notifyListeners();
  }
  
  
}