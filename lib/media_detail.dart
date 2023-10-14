import 'package:flutter/material.dart';
import 'package:movieapp_200906/model/Media.dart';

class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          )
        ],),
      ),
    );
  }
}