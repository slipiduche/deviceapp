import 'package:deviceapp/src/constants.dart';
import 'package:flutter/material.dart';

Widget homeIcon(double size, Color color) {
  return Image(
      image: AssetImage('assets/home.png'),
      width: size,
      height: size,
      color: color);
}

Widget homeBarIcon(double size) {
  return Image(
    image: AssetImage('assets/homebar.png'),
    width: size,
    height: size,
  );
}

Widget musicIcon(double size, Color color) {
  return Image(
      image: AssetImage('assets/music.png'),
      width: size,
      height: size,
      color: color);
}

Widget musicBarIcon(double size) {
  return Image(
    image: AssetImage('assets/musicbar.png'),
    width: size,
    height: size,
  );
}

Widget musicBarIconS(double size) {
  return Image(
    image: AssetImage('assets/musicbarS.png'),
    width: size,
    height: size,
  );
}

Widget roomIcon(double size) {
  return Row(
    children: [
      SizedBox(
        width: 25.0,
      ),
      Image(
        image: AssetImage('assets/rooms.png'),
        width: size,
        height: size,
      ),
    ],
  );
}

Widget roomBarIcon(double size) {
  return Image(
    image: AssetImage('assets/roomsbar.png'),
    width: size,
    height: size,
  );
}

Widget roomBarIconS(double size) {
  return Image(
    image: AssetImage('assets/roomsbarS.png'),
    width: size,
    height: size,
  );
}

Widget tagBarIcon(double size) {
  return Image(
    image: AssetImage('assets/tagbar.png'),
    width: size,
    height: size,
  );
}

Widget tagBarIconS(double size) {
  return Image(
    image: AssetImage('assets/tagbarS.png'),
    width: size,
    height: size,
  );
}

Widget tagIcon(double size, Color color) {
  return Image(
      image: AssetImage('assets/tag.png'),
      width: size,
      height: size,
      color: color);
}

Widget addIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/add.png'),
    width: size,
    height: size,
  );
}

Widget deleteIcon(double size, Color color) {
  return Image(
      image: AssetImage('assets/delete.png'),
      width: size,
      height: size,
      color: color);
}

Widget editIcon(double size, Color color) {
  return Image(
      image: AssetImage('assets/edit.png'),
      width: size,
      height: size,
      color: color);
}

Widget songIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/songs.png'),
    width: size,
    height: size,
  );
}

Widget addSongIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/addSong.png'),
    width: size,
    height: size,
  );
}

Widget addSongsIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/addSongs.png'),
    width: size,
    height: size,
  );
}

Widget searchIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/search.png'),
    width: size,
    height: size,
  );
}

Widget wifiIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/wifi.png'),
    width: size,
    height: size,
  );
}

Widget speakerIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/speaker.png'),
    width: size,
    height: size,
  );
}

Widget readerIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/reader.png'),
    width: size,
    height: size,
  );
}

Widget devicesIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/devices.png'),
    width: size,
    height: size,
  );
}

Widget registerIcon(double size, Color color) {
  return Image(
    image: AssetImage('assets/register.png'),
    width: size,
    height: size,
  );
}

Widget statusIcon(double size, int status) {
  LinearGradient _gradiente;
  if (status == 1) {
    _gradiente = gradiente;
    print('status1');
  } else {
    _gradiente=gradiente1;
    print('estatus0:$status');
  }
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0), gradient: _gradiente),
  );
}

Widget selectIcon(double size, Color color, int type) {
  if (type == 1) {
    return speakerIcon(size, color);
  }
  if (type == 2) {
    return readerIcon(size, color);
  }
  if (type == 3) {
    return registerIcon(size, color);
  }
}
