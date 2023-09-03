import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/fullscreen_wallpaper.dart';
import 'package:wallpaper_app/widgets/app_icon.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
HomePage({super.key});

@override
State<HomePage> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  List images = [];
  int page = 1;

  void initState() {
    super.initState();
    getAPIData();
  }

  //API calling and fetchdata
  Future<void> getAPIData() async {
    final response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=30'),
        headers: {
          'Authorization': 'Your API Key'
        }).then((value) {
      Map result = json.decode(value.body);
      setState(() {
        images = result['photos'];
      });
    });
  }

  Future<void> getMore() async {
    setState(() {
      page = page + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=30&page=' + page.toString();
    await http.get(Uri.parse(url), headers: {
      'Authorization': 'Your API Key'}).then(
            (value) {
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // home page design
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: AppIcon(),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8,),
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5,
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FullscreenWallpaper(
                                  image: images[index]['src']['large2x'],
                                )));
                      },
                      child: Container(
                        color: Colors.black12,
                        child: Image.network(
                          images[index]['src']['large'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: () {
              getMore();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text('Load More',
                    style: TextStyle(fontSize: 20,
                        color: Colors.white,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

}

