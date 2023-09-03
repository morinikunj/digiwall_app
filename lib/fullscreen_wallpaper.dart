import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/app_icon.dart';
import 'package:wallpaper_app/widgets/dropdown_menu.dart';

class FullscreenWallpaper extends StatefulWidget{
  final String image;

  FullscreenWallpaper({super.key, required this.image});


  @override
  State<FullscreenWallpaper> createState() => _FullscreenWallpaper();

}

class _FullscreenWallpaper extends State<FullscreenWallpaper>{


  @override
  Widget build(BuildContext context) {
    // design
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: AppIcon(),),
      ),
      body: Column(
          children:[
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              width: double.infinity,
              child: Image.network(widget.image,
                fit: BoxFit.cover,
              ),

            ) ),
            SizedBox(
              height: 1,
            ),

            // set wallpaper button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              height: 45,
              width: double.infinity,
              child: Center(
                child: ScreenMenu(img: widget.image)
              ),
            ),

          ],
        ),


    );

  }

}