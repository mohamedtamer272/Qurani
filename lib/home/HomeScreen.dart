import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/home/hadeth/hadeth_screen.dart';
import 'package:islami_app/home/quran/quran_screen.dart';
import 'package:islami_app/home/radio/radio_screen.dart';
import 'package:islami_app/home/sebha/sebha_screen.dart';
import 'package:islami_app/home/setting/SettingScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            title: Text(
              AppLocalizations.of(context)!.qurani,
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/image/icon_radio.png')),
                label: AppLocalizations.of(context)!.radio,
                backgroundColor: provider.theme == ThemeMode.light
                    ? MyThemedata.colorGold
                    : MyThemedata.primaryDarkColor,
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/image/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.primaryDarkColor,),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/image/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.primaryDarkColor,),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/image/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.primaryDarkColor,),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting,
                  backgroundColor: provider.theme == ThemeMode.light
                      ? MyThemedata.colorGold
                      : MyThemedata.primaryDarkColor,),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    RadioScreen(),
    SebhaScreen(),
    QuranScreen(),
    HadethScreen(),
    SettingScreen()
  ];
}
