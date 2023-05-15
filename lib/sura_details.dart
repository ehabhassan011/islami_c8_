import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/sura_details_arg.dart';

class SuraDetails extends StatefulWidget {
  static const String routName = "sura-details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/default_bg.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.SuraName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        body: Card(
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          elevation: 12,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15)),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              endIndent: 40,
              indent: 40,
              thickness: 1,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (context, index) {
              return Center(
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      verses[index],
                      textAlign: TextAlign.center,
                    )),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  void loadFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = sura.split("\n");
    verses = lines;
    print(lines);
    setState(() {});
  }
}
