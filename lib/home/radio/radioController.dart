import 'package:flutter/material.dart';
import 'package:islami_app/MyTheme.dart';
import 'package:islami_app/RadioResponse.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';

class RadioController extends StatefulWidget {
  Radios radios;
  Function play;
  Function pause;

  RadioController(this.radios, this.play, this.pause);

  @override
  State<RadioController> createState() => _RadioControllerState();
}

class _RadioControllerState extends State<RadioController> {
  int count = 0;
  var icon = Icons.play_arrow_rounded;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: provider.theme == ThemeMode.light
              ? MyThemedata.colorGold
              : MyThemedata.onprimaryDarkColor,)),
      margin: EdgeInsets.fromLTRB(1, 0, 1, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.radios.name!,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              if (count == 0) {
                widget.play();
                icon = Icons.pause;
                count++;
              } else if (count == 1) {
                count = 0;
                widget.pause();
                icon = Icons.play_arrow_rounded;
              }
              setState(() {});
            },
            child: Icon(
              icon,
              size: 70,
              color: provider.theme == ThemeMode.light
                  ? MyThemedata.colorGold
                  : MyThemedata.onprimaryDarkColor,
            ),
          )
        ],
      ),
    );
  }
}
