import 'package:flutter/material.dart';
import 'package:islami/hadethModel.dart';

class HadethContent extends StatelessWidget {
  static const String routName = "hadeth-content";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Card(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          elevation: 12,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15)),
        ),
      ),
    );
  }
}
