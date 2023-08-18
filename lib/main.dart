import 'package:esraanewsweetmarket/login.dart';
import 'package:esraanewsweetmarket/signup.dart';
import 'package:esraanewsweetmarket/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(sweetmarket());
}

class sweetmarket extends StatefulWidget {
  const sweetmarket({Key? key}) : super(key: key);

  @override
  State<sweetmarket> createState() => _sweetmarketState();
}

class _sweetmarketState extends State<sweetmarket> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:ThemeData(fontFamily:'Poppins' ) ,
      debugShowCheckedModeBanner: false,
      home:SignUp() ,

    );
  }
}
