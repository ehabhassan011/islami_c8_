import 'package:flutter/material.dart';
import 'package:islami/hadeth_content.dart';
import 'package:islami/home.dart';
import 'package:islami/myTheme.dart';
import 'package:islami/sura_details.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routName: (c) => HomeScreen(),
        SuraDetails.routName: (context) => SuraDetails(),
        HadethContent.routName: (context) => HadethContent(),
      },
    );
  }
}
