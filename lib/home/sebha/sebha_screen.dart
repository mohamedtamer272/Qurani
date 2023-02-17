import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  List<String> name = ["سبحان الله", "الحمد لله", "الله اكبر"];
  int count = 0;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  double angle=0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
              height: 200,
              width: 200,
              child: Transform.rotate(
                  angle: angle, child: Image.asset(provider.Getsebha()))),
          SizedBox(
            height: 10,
          ),
          Text(
            AppLocalizations.of(context)!.tasbehcount,
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            height: 100,
            width: 70,
            decoration: BoxDecoration(
              color: provider.theme == ThemeMode.light
                  ? MyThemedata.colorGold
                  : MyThemedata.onprimaryDarkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: provider.theme == ThemeMode.light
                          ? MyThemedata.colorGold
                          : MyThemedata.onprimaryDarkColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    count1 = 0;
                    count2 = 0;
                    count3 = 0;
                    counter = 0;
                    name[count] = name[0];
                    count = 0;
                    angle=0;
                    setState(() {});
                  },
                  child: Text(
                    '${AppLocalizations.of(context)!.reset}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                width: 90,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: provider.theme == ThemeMode.light
                          ? MyThemedata.colorGold
                          : MyThemedata.onprimaryDarkColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    counter++;
                    if (counter > 33) {
                      counter = 0;
                      if (count == name.length - 1) {
                        count = 0;
                      } else {
                        count++;
                      }
                      if (count == 1) {
                        count1++;
                      } else if (count == 2) {
                        count2++;
                      } else if (count == 0) {
                        count3++;
                      }
                    }
                    angle+=0.06;
                    setState(() {});
                  },
                  child: Text(
                    name[count],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'سبحان الله',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.count}',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$count1',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 108,
                  width: 5,
                  color: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.onprimaryDarkColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    'الحمد لله',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.count}',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$count2',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 108,
                  width: 5,
                  color: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.onprimaryDarkColor,
                ),
              ),
              Column(
                children: [
                  Text(
                    'الله اكبر',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.count}',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$count3',
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyThemedata.colorGold
                            : MyThemedata.onprimaryDarkColor,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
