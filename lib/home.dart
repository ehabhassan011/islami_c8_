import 'package:flutter/material.dart';
import 'package:islami/Taps/hadeth.dart';
import 'package:islami/Taps/quran.dart';
import 'package:islami/Taps/radio.dart';
import 'package:islami/Taps/sebha.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> Taps = [quranTap(), sebhaTap(), radioTap(), hadethTap()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/default_bg.png",
            fit: BoxFit.fill,
          ),
        ), //وضع الصورة هنا
        Scaffold(
          appBar: AppBar(
            title: Text(
              "ISLAMI",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                    label: "Quran",
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                    label: "Sebha",
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                    label: "Radio",
                    backgroundColor: Theme.of(context).primaryColor),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                    label: "Hadeth",
                    backgroundColor: Theme.of(context).primaryColor),
              ]),
          body: Taps[index],
        ),
      ],
    );
  }
}
