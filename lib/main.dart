import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:smart_campus/login.dart';
import 'package:smart_campus/mainpage/beacon.dart';
import 'package:smart_campus/mainpage/campus.dart';
import 'package:smart_campus/mainpage/example.dart';
import 'package:smart_campus/mainpage/example_background.dart';
import 'package:smart_campus/mainpage/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iCampus',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'UiTM iCampus'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _children = [
    ExampleBackgroundWidget(),
    ExampleWidget(),
    BeaconWidget(),
    CampusWidget(),
    MenuWidget(),
  ];

  final List<Color> _bgColor = [

    Colors.white,
    Colors.red,
    Colors.grey[40],
    Colors.grey[40],
    Colors.grey[40],

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor[currentIndex],
      extendBody: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 4;
          });
        },
        child: Icon(Icons.apps),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: Colors.deepPurple,
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex==4?0:currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.announcement,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.announcement,
                color: Colors.white,
              ),
              title: Text("News")),
          BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.school,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.school,
                color: Colors.white,
              ),
              title: Text("Blank")),
          BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.wifi_tethering,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.wifi_tethering,
                color: Colors.white,
              ),
              title: Text("Beacon")),
          BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.business,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.business,
                color: Colors.white,
              ),
              title: Text("Campus"))
        ],
      ),
    );
  }
}