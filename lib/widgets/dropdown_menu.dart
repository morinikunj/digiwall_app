import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ScreenMenu extends StatefulWidget {
  final String img;

  ScreenMenu({super.key, required this.img});

  @override
  State<ScreenMenu> createState() => _ScreenMenu();
}

class _ScreenMenu extends State<ScreenMenu> {
  String? selected;
  List<String> setItems = ['HomeScreen', 'LockScreen', 'BothScreen'];

  Future<void> setHome() async {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.img);

    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setLock() async {
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.img);

    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  Future<void> setBoth() async {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.img);

    var result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
      elevation: 0,
      iconEnabledColor: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      hint: Text(
        'Set Wallpaper',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      value: selected,
      items: setItems.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selected = newValue;

          if (newValue == 'HomeScreen') {
            setHome();
          } else if (newValue == 'LockScreen') {
            setLock();
          } else if (newValue == 'BothScreen') {
            setBoth();
          }
        });
      },
    );
  }
}
