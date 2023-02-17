import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SuraView extends StatefulWidget {
  static const String routename = 'SuraView';

  @override
  State<SuraView> createState() => _SuraViewState();
}

class _SuraViewState extends State<SuraView> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraNameArgs;
    if (verses.isEmpty) {
      LoadFile(args.index);
    }
    var provider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.GetBackground(),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                args.nameSura,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: verses.isEmpty
                ?  Center(child: CircularProgressIndicator())
                : ListView.separated(
              separatorBuilder:(context, index) =>Divider(
                color: MyThemedata.colorGold,
                thickness: 2,
              ) ,
                    itemCount: verses.length,
                    itemBuilder: (context, index) {
                      return Text(
                        verses[index],
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      );
                    },
                  )),
      ],
    );
  }

  void LoadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraNameArgs {
  String nameSura;
  int index;

  SuraNameArgs(this.nameSura, this.index);
}
