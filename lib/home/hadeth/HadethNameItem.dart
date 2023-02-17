import 'package:flutter/material.dart';
import 'package:islami_app/home/hadeth/HadethView.dart';
import 'package:islami_app/home/hadeth/hadeth_screen.dart';

class HadethNameItem extends StatelessWidget {
  String HadethName;
  HadethArgs HadethContent;

  HadethNameItem(this.HadethName,this.HadethContent, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadethView.routename,
              arguments: HadethContent );
        },
        child: Center(
            child: Text(
              HadethName,
              style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 25),
            )));
  }
}