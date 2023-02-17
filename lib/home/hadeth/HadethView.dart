import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/home/hadeth/hadeth_screen.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class HadethView extends StatelessWidget {
  static const String routename ='HadethView';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethArgs;
    var provider = Provider.of<ThemeProvider>(context);
    return  Stack(
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
                args.title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: ListView.separated(
              separatorBuilder:(context, index) =>Divider(
                color: MyThemedata.colorGold,
                thickness: 2,
              ) ,
              itemCount: args.content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    args.content[index],
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )),
      ],
    );
  }
}
