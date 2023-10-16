
import 'package:flutter/material.dart';

class MyTheme  {
    static Color primaryLight =const Color(0xff39A552);
    static Color whiteColor =const Color(0xffffffff);
    static Color redColor =const Color(0xffC91C22);
    static Color darkBlue =const Color(0xff003E90);
    static Color pink =Colors.pink;
    static Color brown =Colors.brown;
    static Color blue=Colors.blue;
    static Color yellow =Colors.yellow;
    static Color grey =Colors.grey;
    static Color black =Colors.black;

    static ThemeData lightMode =ThemeData(
    primaryColor: MyTheme.primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: MyTheme.primaryLight,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)
        )
      )
    ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize:22 ,fontWeight:FontWeight.bold ,color: whiteColor
        ),
        titleMedium: TextStyle(
            fontSize:20 ,fontWeight:FontWeight.bold ,color: black
        ),
        titleSmall: TextStyle(
            fontSize:18 ,fontWeight:FontWeight.bold ,color: black
        ),
      )
    );

}
