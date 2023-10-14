import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movieapp_200906/common/HttpHandler.dart';
import 'package:movieapp_200906/model/Media.dart';
import 'package:movieapp_200906/media_list_item.dart';
import 'package:movieapp_200906/media_detail.dart';
import 'common/MediaProvider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  MediaList(this.provider);

  @override
  MediaListState createState() => MediaListState();
}

class MediaListState extends State<MediaList> {
  List<Media> _media = [];
  @override
  void initState() {
    super.initState();
    loadMedia();
  }

  @override
  void didUpdateWidget(MediaList oldWidget){
    if(oldWidget.provider.runtimeType!=widget.provider.runtimeType){
      _media = [];
      loadMedia();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMedia() async {
    var media = await widget.provider.fetchMedia();
    setState(() {
      _media.addAll(media);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            child: MediaListItem(_media[index]),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MediaDetail(_media[index]);
              }));
            },
          );
        },
      ),
    );
  }
}
