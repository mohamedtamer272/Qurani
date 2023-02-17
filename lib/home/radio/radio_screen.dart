import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:islami_app/RadioResponse.dart';
import 'package:islami_app/home/radio/radioController.dart';
import 'package:islami_app/provider/ThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Image.asset('assets/image/radio_image.png'),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.radio,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder<RadioResponse>(
            future: fetchRadio(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: axisDirectionToAxis(AxisDirection.right),
                  itemCount: snapshot.data!.radios!.length,
                  itemBuilder: (context, index) {
                    return RadioController(snapshot.data!.radios![index], () {
                      play(snapshot.data!.radios![index].radioUrl!);
                    }, () {
                      pause();
                    });
                  },
                );
              } else if (snapshot.hasError) {
                return Text(
                  'something went wrong',
                  style: Theme.of(context).textTheme.headline1,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }

  void play(String url) {
    audioPlayer.play(UrlSource(url));
  }

  void pause() {
    audioPlayer.pause();
  }

  Future<RadioResponse> fetchRadio() async {
    Response response = await http
        .get(Uri.parse('https://api.mp3quran.net/radios/radio_arabic.json'));
    if (response.statusCode == 200) {
      RadioResponse radioResponse =
          RadioResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return radioResponse;
    } else {
      throw Exception('Failed to load radio');
    }
  }
}
