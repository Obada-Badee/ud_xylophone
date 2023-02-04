import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioPlayer();

  void playNote(int noteNumber) async {
    var duration = await player.setAsset('assets/note$noteNumber.wav');
    player.play();
  }

  Widget xylTile(Color colour, int noteNumber) {
    return Expanded(
      child: Container(
        color: colour,
        child: TextButton(
          onPressed: () async {
            playNote(noteNumber);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              xylTile(Colors.red, 1),
              xylTile(Colors.orange, 2),
              xylTile(Colors.yellow, 3),
              xylTile(Colors.green, 4),
              xylTile(Colors.teal, 5),
              xylTile(Colors.blue, 6),
              xylTile(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
