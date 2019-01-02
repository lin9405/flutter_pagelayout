
import 'package:flutter/material.dart';


void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _isFavorited = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.yellow[500],
            onPressed: _toggleFavorite,
          ),
        ),

      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Park Chae Rin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '21300322',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {


      return Column(
       // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    }



    Widget buttonSection = Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),//padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.message, 'MESSAGE'),
          buildButtonColumn(Icons.email, 'EMAIL'),
          buildButtonColumn(Icons.share, 'SHARE'),
          buildButtonColumn(Icons.description, 'ETC'),

        ],

      ),

    );



    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.message, size: 40.0,),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Recent Message', style: TextStyle(fontWeight : FontWeight.bold),),
                Text('Long time no see!',)
              ],
            ),
          )

        ],
      ),


    );



    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(

        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            Divider(
              height: 1.0, color: Colors.black,
            ),
            buttonSection,
            Divider(
              height: 1.0, color: Colors.black,
            ),
            textSection,
          ],
        ),
      ),
    );
  }
}