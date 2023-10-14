import 'package:flutter/material.dart';
import 'package:movieapp_200906/common/HttpHandler.dart';
import 'package:movieapp_200906/media_list.dart';
import 'package:movieapp_200906/model/Media.dart';
import 'common/MediaProvider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieApp - 200906", style: TextStyle(fontFamily: 'Kalam-Regular')),
        backgroundColor: const Color.fromARGB(255, 127, 0, 178),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            const DrawerHeader(child: Material()),
        ListTile(
          title: const Text("Peliculas", style: TextStyle(fontFamily: 'Kalam-Regular'),),
          selected: mediaType == MediaType.movie,
          trailing: const Icon(Icons.local_movies, color: Color.fromARGB(255, 198, 157, 210)),
          onTap: (){
            _changeMediaType(MediaType.movie);
            Navigator.of(context).pop();
          },
        ),
        const Divider(
          height: 5.0,
        ),
        ListTile(
          title: const Text("Televisión", style: TextStyle(fontFamily: 'Kalam-Regular'),),
          trailing: const Icon(Icons.live_tv, color: Color.fromARGB(255, 198, 157, 210)),
          onTap: (){
            _changeMediaType(MediaType.show);
            Navigator.of(context).pop();
          }
        ),
        const Divider(
          height: 5.0,
        ),
        ListTile(
          title: const Text("Cerrar", style: TextStyle(fontFamily: 'Kalam-Regular'),),
          trailing: const Icon(Icons.close, color: Color.fromARGB(255, 198, 0, 40)),
          onTap: ()=> Navigator.of(context).pop(),
        ),
          ],
        )
        
      ),
      body: PageView(
        children: _getMediaList(MediaType.movie)/* <Widget>[
          new MediaList()
        ], */
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }
    List<BottomNavigationBarItem> _getFooterItems()
    {
      return[
        const BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up, color: Color.fromARGB(255, 127, 0, 178)), label:("Populares")
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.update, color: Color.fromARGB(255, 127, 0, 178),), label:("Proximamente")
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.star, color: Color.fromARGB(255, 127, 0, 178),), label:("Mejor valoradas")
        ),
      ];
    }
      void _changeMediaType(MediaType type){
        if (mediaType != type){
          setState((){
            mediaType=type;
          });
        }
      }
      List<Widget> _getMediaList(MediaType type){
        return (mediaType == MediaType.movie)
        ?<Widget>[MediaList(movieProvider)]
        :<Widget>[MediaList(showProvider)];
      }
  }
