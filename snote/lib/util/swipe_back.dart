import 'package:flutter/material.dart';

class navigationObserver extends NavigatorObserver{
  @override
  void didStartUserGesture(Route route, Route previousRoute){
    super.didStartUserGesture(route, previousRoute);
  }
}