import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadethModel.dart';
import 'package:islami/hadeth_content.dart';

class hadethTap extends StatefulWidget {
  @override
  State<hadethTap> createState() => _hadethTapState();
}

class _hadethTapState extends State<hadethTap> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadAhadethFile();
    }

    return Column(
      children: [
        Image.asset("assets/images/hadeth_logo.png"),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          "أحــاديث ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).primaryColor,
                    endIndent: 35,
                    indent: 35,
                    thickness: 1,
                  ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, HadethContent.routName,
                        arguments: allAhadeth[index]);
                  },
                  child: Text(
                    allAhadeth[index].title,
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: allAhadeth.length),
        ),
      ],
    );
  }

  void loadAhadethFile() async {
    rootBundle.loadString("assets/files/ahadeth .txt").then((value) {
      List<String> AhadethContent = value.split("#");
      for (int i = 0; i < AhadethContent.length; i++) {
        List<String> lines = AhadethContent[i].trim().split("\n");
        String title = lines[0];
        lines.removeAt(0);
        List<String> content = lines;
        print(title);
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
