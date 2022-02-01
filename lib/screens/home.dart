import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:exam_1/screens/web.dart';
import 'package:flutter/material.dart';

import 'mobile.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Widget returnWidget;
  @override
  void initState() {
    if(kIsWeb){
      returnWidget = Web();
    }else{
      returnWidget = Mobile();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return returnWidget;
  }
}
