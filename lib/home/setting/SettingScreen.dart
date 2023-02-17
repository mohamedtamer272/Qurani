import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/home/setting/LanguageBottomSheet.dart';
import 'package:islami_app/home/setting/ThemeBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/LanguageProvider.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 40,
                  ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              ShowLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 3, color: MyThemedata.colorGold),
              ),
              child: Center(
                child: Text(
                  provider.language == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              themeprovider.theme == ThemeMode.dark
                  ? AppLocalizations.of(context)!.darkmode
                  : AppLocalizations.of(context)!.lightmode,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 40,
                  ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              ShowThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(width: 3, color: MyThemedata.colorGold),
              ),
              child: Center(
                child: Text(
                  themeprovider.theme == ThemeMode.light
                      ? AppLocalizations.of(context)!.lightmode
                      : AppLocalizations.of(context)!.darkmode,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ShowLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return LanguageBottomSheet();
        });
  }

  void ShowThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return ThemeBottomSheet();
        });
  }
}
