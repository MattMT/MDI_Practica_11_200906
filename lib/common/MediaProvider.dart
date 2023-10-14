import 'dart:async';
import 'package:movieapp_200906/model/Media.dart';
import 'package:movieapp_200906/common/HttpHandler.dart';

abstract class MediaProvider{
  Future <List<Media>> fetchMedia();
}


class MovieProvider extends MediaProvider{
  HttpHandler client = HttpHandler.get();
  @override
  Future <List<Media>> fetchMedia(){
    return client.fetchMovies();
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler client = HttpHandler.get();
  @override
  Future <List<Media>> fetchMedia(){
    return client.fetchShow();
  }
}