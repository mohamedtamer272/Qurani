import 'package:flutter/material.dart';
import 'package:islami_app/home/quran/SuraView.dart';
import 'package:islami_app/home/hadeth/HadethView.dart';
import 'package:islami_app/home/HomeScreen.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/LanguageProvider.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: MyApplication(),
  ));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    var themeprovider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.language),
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (C) => HomeScreen(),
        SuraView.routename: (c) => SuraView(),
        HadethView.routename: (c) => HadethView(),
      },
      theme: MyThemedata.lightTheme,
      darkTheme: MyThemedata.darkTheme,
      themeMode: themeprovider.theme,
    );
  }
}
