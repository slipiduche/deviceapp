import 'package:deviceapp/src/constants.dart';
import 'package:deviceapp/src/icons/icons.dart';
import 'package:deviceapp/src/models/wifiscan_models.dart';
import 'package:deviceapp/src/provider/my-globals.dart';
import 'package:flutter/material.dart';

int awaitUpload = 0;

void _moveTo(index, context) async {
  if (index == 0) {
    await Navigator.pushReplacementNamed(context, 'roomsPage', arguments: null);
  }

  if (index == 1) {
    await Navigator.pushReplacementNamed(context, 'tagPage', arguments: null);
  }
  if (index == 2) {
    await Navigator.pushReplacementNamed(context, 'homePage', arguments: null);
  }
  if (index == 3) {
    await Navigator.pushReplacementNamed(context, 'musicPage', arguments: null);
  }
}

Widget submitButton(text, void Function() function) {
  return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: colorMedico)),
      elevation: 4.0,
      color: colorMedico,
      onPressed: function);
}

Widget tarjeta(
    String label, description, Widget icon, int index, dynamic context) {
  return GestureDetector(
    child: Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        height: 105,
        child: Row(children: [
          SizedBox(width: 30.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w100),
              ),
              Text(
                description,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w100),
              )
            ],
          ),
          Expanded(child: Container()),
          icon,
          SizedBox(
            width: 23.48,
          )
        ]),
      ),
    ),
    onTap: () async {
      if (index == 10) {
        await Navigator.pushNamed(context, 'editSongPage', arguments: null);
      }
      if (index == 9) {
        await Navigator.pushNamed(context, 'addSongsPage', arguments: null);
      }
      if (index == 8) {
        await Navigator.pushNamed(context, 'addSongPage', arguments: null);
      }
      if (index == 5) {
        await Navigator.pushReplacementNamed(context, 'songsPage',
            arguments: null);
      }

      if (index == 1) {
        await Navigator.pushReplacementNamed(context, 'tagPage',
            arguments: null);
      }
      if (index == 2) {
        await Navigator.pushReplacementNamed(context, 'homePage',
            arguments: null);
      }
      if (index == 3) {
        await Navigator.pushReplacementNamed(context, 'musicPage',
            arguments: null);
      }
      if (index == 0) {
        await Navigator.pushReplacementNamed(context, 'roomsPage',
            arguments: null);
      }
    },
  );
}
void updating(BuildContext _context, String message) {
    
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (_context) {
          updatingContext = _context;
          return AlertDialog(
            content: Container(
              height: 100.0,
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(colorMedico),
                  ),
                  Text(
                    '$message...',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          );
        });
  }

  void updated(BuildContext _context, String message,
      void Function(BuildContext fcontext) function) {
    BuildContext dialogContext;
    showDialog(
        context: _context,
        barrierDismissible: true,
        builder: (context) {
          dialogContext = _context;
          updatedContext = _context;
          return AlertDialog(
            content: Container(
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    size: 50.0,
                    color: colorMedico,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 100.0),
            actions: <Widget>[
              Container(
                child: Center(
                  child: submitButton('OK', () {
                    Navigator.of(context).pop();
                    function(dialogContext);
                  }),
                ),
              ),
            ],
          );
        });
  }

  void errorPopUp(BuildContext _context, String message,
      void Function(BuildContext fcontext) function) {
    //BuildContext errorContext;
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (context) {
          errorContext = _context;
          return AlertDialog(
            content: Container(
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.error_outline,
                    size: 50.0,
                    color: Colors.red,
                  ),
                  Text(
                    message,
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 100.0),
            actions: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: submitButton('OK', () {
                        Navigator.of(context).pop();
                        function(errorContext);
                      }),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

class TwoIconCard extends StatefulWidget {
  @override
  String label, description;
  Widget icon;
  dynamic icon1;
  String path, name;
  dynamic context;
  TwoIconCard(this.label, this.description, this.icon, this.icon1, this.path,
      this.context, this.name,
      {Key key})
      : super(key: key);
  _TwoIconCardState createState() =>
      _TwoIconCardState(label, description, icon, icon1, path, context, name);
}

class _TwoIconCardState extends State<TwoIconCard> {
  @override
  String label, description;
  Widget icon;
  dynamic icon1;
  String path, name;
  dynamic contexto;
  _TwoIconCardState(this.label, this.description, this.icon, this.icon1,
      this.path, this.contexto, this.name);

  Widget build(BuildContext context) {
    if (awaitUpload == 0) {
      return twoIconCard(label, description, icon, icon1, path, contexto, name);
    } else if (awaitUpload == 1) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colorMedico),
          ),
        ],
      );
    } else if (awaitUpload == 2) {
      awaitUpload = 0;
      return Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Text(
              'Uploaded.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ));
    }
  }

  

  Widget twoIconCard(String label, description, Widget icon, dynamic icon1,
      String path, dynamic context, String name) {
    String _path = path;
    print(_path);

    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        height: 105,
        width: MediaQuery.of(context).size.width - 30,
        child: Row(children: [
          Expanded(child: Container()),
          icon,
          Expanded(child: Container()),
          Container(
            width: MediaQuery.of(context).size.width - 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w100,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w100),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Builder(builder: (context) {
            if (icon1 == false) {
              return GestureDetector(onTap: null, child: Container());
            } else {
              return GestureDetector(
                  onTap: () async {
                    print(_path);
                    uploading(1, 1, context);
                    //awaitUpload = await UploadProvider().upload(_path,name);
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: icon1);
            }
          }),
          Expanded(child: Container()),
        ]),
      ),
    );
  }
}

void uploading(int i, songsCount, BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 100.0,
            child: Column(
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(colorMedico),
                ),
                Text(
                  'Uploading...$i of $songsCount',
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          ),
        );
      });
}

Widget gradientBar(bool selected) {
  if (selected) {
    return Container(
      height: 10.0,
      width: 90,
      decoration: BoxDecoration(
        //color: colorMedico,
        gradient: gradiente,
      ),
    );
  } else {
    return Container(
      height: 10.0,
      width: 90,
      color: colorBackGround,
    );
  }
}

Widget gradientBar2(int index) {
  return Container(
    height: 10.0,
    width: double.infinity,
    child: Row(
      children: [
        gradientBar(index == 0),
        Expanded(child: Container()),
        gradientBar(index == 1),
        Expanded(child: Container()),
        gradientBar(index == 2),
        Expanded(child: Container()),
        gradientBar(index == 3),
      ],
    ),
  );
}

class BottomBar extends StatefulWidget {
  int index;
  BottomBar(this.index, {Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState(index);
}

class _BottomBarState extends State<BottomBar> {
  int _itemselected;
  _BottomBarState(this._itemselected);
  @override
  Widget build(BuildContext context) {
    return botomBar();
  }

  Widget botomBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: roomBarIcon(25),
            title: Container(),
            activeIcon: roomBarIconS(25)),
        BottomNavigationBarItem(
            icon: tagBarIcon(25),
            title: Container(),
            activeIcon: tagBarIconS(25)),
        BottomNavigationBarItem(
          icon: homeBarIcon(25),
          title: Container(),
        ),
        BottomNavigationBarItem(
            icon: musicBarIcon(25),
            title: Container(),
            activeIcon: musicBarIconS(25)),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _itemselected,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(index) async {
    _itemselected = index;
    print('presionaste:');
    print(index);
    if (index == 0) {
      await Navigator.pushReplacementNamed(context, 'roomsPage',
          arguments: null);
    }

    if (index == 1) {
      await Navigator.pushReplacementNamed(context, 'tagPage', arguments: null);
    }
    if (index == 2) {
      await Navigator.pushReplacementNamed(context, 'homePage',
          arguments: null);
    }
    if (index == 3) {
      await Navigator.pushReplacementNamed(context, 'musicPage',
          arguments: null);
    }
  }
}

Widget makeDeviceList(DeviceList devices, BuildContext _context,
    void _function(WifiDevice network, BuildContext _context)) {
  BuildContext listContext = _context;
  return ListView.builder(
      //controller: _scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: (devices.list.length),
      itemBuilder: (context, int index) {
        BuildContext itemContext = listContext;
        print(index);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Builder(
              builder: (_context) {
                Widget typeIcon;
                Widget _statusIcon;
                String _status;
                String _devType;
                if (devices.list[index].devType == 'G') {
                  _devType = 'Register';
                  typeIcon = registerIcon(60.0, colorMedico);
                } else if (devices.list[index].devType == 'S') {
                  _devType = 'Speaker';
                  typeIcon = speakerIcon(60.0, colorMedico);
                } else if (devices.list[index].devType == 'R') {
                  _devType = 'Reader';
                  typeIcon = readerIcon(60.0, colorMedico);
                }
                switch (int.parse(devices.list[index].devStatus)) {
                  case 0:
                    _status = 'Unconfigured';
                    break;
                  case 1:
                    _status = 'Configured';
                    break;
                }
                return GestureDetector(
                  onTap: () {
                    _function(devices.list[index], _context);
                  },
                  child: deviceCard(devices.list[index], typeIcon, _status,
                      _devType, _context),
                );
              },
            ),
            Divider(),
          ],
        );
      });
}

Widget deviceCard(WifiDevice device, Widget typeIcon, String status,
    String devType, BuildContext context) {
  return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width - 30,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    typeIcon,
                    Expanded(child: Container()),
                    Container(
                      width: MediaQuery.of(context).size.width - 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            device.devName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Type: ' + devType,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w100),
                          ),
                          Text(
                            'ChipId: ' + device.devChipId,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    statusIcon(60.0, int.parse(device.devStatus)),
                    Expanded(child: Container()),
                  ]))));
}
