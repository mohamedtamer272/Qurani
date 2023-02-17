import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/home/hadeth/HadethNameItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethArgs> AllHadeth = [];

  @override
  Widget build(BuildContext context) {
    if (AllHadeth.isEmpty) {
      LoadHadethFile();
    }

    return Column(
      children: [
        Image.asset('assets/image/hadeth_logo.png'),
        Divider(
          thickness: 2,
          color: MyThemedata.colorGold,
        ),
        Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context).textTheme.headline1,
        ),
        Divider(
          thickness: 2,
          color: MyThemedata.colorGold,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                    color: MyThemedata.colorGold,
                    thickness: 1,
                  ),
              itemCount: AllHadeth.length,
              itemBuilder: (c, index) {
                return HadethNameItem(AllHadeth[index].title, AllHadeth[index]);
              }),
        )
      ],
    );
  }

  void LoadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#');

    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      List<String> HadethLines = hadeth.trim().split('\n');
      String title = HadethLines[0];
      HadethLines.removeAt(0);
      HadethArgs hadethData = HadethArgs(title, HadethLines);
      AllHadeth.add(hadethData);
      setState(() {
      });
    }
  }
}

class HadethArgs {
  String title;
  List<String> content;

  HadethArgs(this.title, this.content);
}
