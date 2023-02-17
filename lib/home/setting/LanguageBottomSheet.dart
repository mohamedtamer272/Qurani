import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/provider/LanguageProvider.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeprovider.theme == ThemeMode.light
            ? MyThemedata.colorGold
            : MyThemedata.onprimaryDarkColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          width: 3,
          color: themeprovider.theme == ThemeMode.light
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
        ),
      ),
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                prov.notifyListener('en');
                Navigator.pop(context);
              },
              child: LanguageItem(
                  context,
                  AppLocalizations.of(context)!.english,
                  prov.language == 'en')),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                prov.notifyListener('ar');
                Navigator.pop(context);
              },
              child: LanguageItem(context, AppLocalizations.of(context)!.arabic,
                  prov.language == 'ar')),
        ],
      ),
    );
  }

  Widget LanguageItem(BuildContext context, String text, bool IsSelected) {
    var provider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headline1?.copyWith(
                color: IsSelected ? Colors.white : MyThemedata.colorBlack,
                fontSize: 20,
              ),
        ),
        Icon(
          Icons.done,
          color: IsSelected
              ? Colors.white
              : provider.theme == ThemeMode.light
                  ? MyThemedata.colorGold
                  : MyThemedata.onprimaryDarkColor,
        )
      ],
    );
  }
}
