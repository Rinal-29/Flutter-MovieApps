import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieApps(), debugShowCheckedModeBanner: false,
    );
  }
}

class MovieApps extends StatefulWidget {
  @override
  _MovieAppsState createState() => _MovieAppsState();
}

class _MovieAppsState extends State<MovieApps> {

  List<Container> listMovie = new List();

  var movieList = [
    {"title" : "Movie 1", "images":"movie1.jpeg"},
    {"title" : "Movie 2", "images":"movie2.jpeg"},
    {"title" : "Movie 3", "images":"movie3.jpeg"},
    {"title" : "Movie 4", "images":"movie4.jpeg"},
    {"title" : "Movie 5", "images":"movie5.jpeg"},
    {"title" : "Movie 6", "images":"movie6.jpeg"},
    {"title" : "Movie 7", "images":"movie7.jpeg"},
    {"title" : "Movie 8", "images":"movie8.jpeg"},
    {"title" : "Movie 9", "images":"movie9.jpeg"},
    {"title" : "Movie 10", "images":"movie10.jpeg"},
  ];

  createListData() {
    for( var i = 0; i < movieList.length; i++) {
      final listMovies = movieList[i];
      final String images = listMovies['images'];

      listMovie.add(
        new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Card(
            child: new InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => PageDetailMovies(
                  name: listMovies["title"],
                  images: images,
                )));
              },

              child: new Column(
                children: [
                  new Padding(padding: new EdgeInsets.all(20.0),),
                  new Hero(
                    tag: listMovies['title'],
                    child: new Image.asset(
                      "images/$images" ,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.cover, ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(10.0),
                  ),
                  new Text(
                    listMovies['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    createListData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24)/2 ;
    final double itemWidth = size.width/2;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Apps"),
        backgroundColor: Colors.redAccent,
      ),

      resizeToAvoidBottomPadding: false,
      body: new Container(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth/itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: listMovie,
        ),
      ),
    );
  }
}

class PageDetailMovies extends StatelessWidget {

  PageDetailMovies({this.name , this.images});
  final String name;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $name"),
        backgroundColor: Colors.redAccent,
      ),

      body: ListView(
        padding: EdgeInsets.only(top: 20.0),
        children: [
          new Container(
            height: 300,
            child: new Hero(
                tag: name,
                child: new Material(
                  child: new InkWell(
                    child: Image.asset("images/$images", fit: BoxFit.contain,),
                  ),
                )
            ),
          ),

          new SectionName(
            name : name
          ),

          new SectionIcons(),

          new SectionDescription()
        ],
      ),
    );
  }
}

class SectionName extends StatelessWidget {

  SectionName({this.name});
  final String name ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
      child: new Row(
        children: [
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text("$name", style: TextStyle(fontSize: 18.0, color: Colors.red),),
              new Text("$name/@gmail.com", style: TextStyle(fontSize: 16.0),)
            ],
          )),

          new Row(
            children: [
              new Icon(Icons.star, color: Colors.yellow, size: 30.0,),
              new Text("14", style: TextStyle(fontSize: 18.0),)
            ],
          ),
        ],
      ),
    );
  }
}

class SectionIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 10),
        margin: EdgeInsets.all(10.0),
      child: new Container(
        padding: EdgeInsets.all(6.0),
          decoration: new BoxDecoration(
            color: Colors.redAccent,
              borderRadius: new BorderRadius.all(const Radius.circular(5.0))
          ),
          child:  new Row(
            children: [
              new IconsTextRow(
                  iconData: Icons.favorite,
                  text: "Favorite"
              ),

              new IconsTextRow(
                  iconData: Icons.delete,
                  text: "Delete"
              ),

              new IconsTextRow(
                  iconData: Icons.rate_review,
                  text: "Rate"
              ),
            ],
          ),
      )
    );
  }
}

class SectionDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: new Card(
        child: new Padding(padding: EdgeInsets.all(10.0),
        child: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style:  TextStyle(fontSize: 16.0),
        textAlign: TextAlign.justify,),),
      ),
    );
  }
}


class IconsTextRow extends StatelessWidget {

  IconsTextRow({this.iconData, this.text}) ;
  final IconData iconData ;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: new Column(
          children: [
            new Icon(iconData, size: 20.0, color: Colors.white,),
            new Text(text, style: TextStyle(color: Colors.white, fontSize: 16.0),)
          ],
        )
    );
  }
}






