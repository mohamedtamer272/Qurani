import 'package:flutter/material.dart';

import 'SuraView.dart';

class suraNameItem extends StatelessWidget {
  String suraName;
  int index;

  suraNameItem(this.suraName, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, SuraView.routename,
              arguments: SuraNameArgs(suraName, index));
        },
        child: Center(
            child: Text(
          suraName,
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 25),
        )));
  }
}
