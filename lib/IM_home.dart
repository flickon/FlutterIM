import 'package:flutter/material.dart';
import 'package:flutterIM/pages/call_screen.dart';
import 'package:flutterIM/pages/camera_screen.dart';
import 'package:flutterIM/pages/chat_screen.dart';
import 'package:flutterIM/pages/contects_screen.dart';

class IMHome extends StatefulWidget {
  var cameras;
  IMHome(this.cameras);

  @override
  _IMHomeState createState() => new _IMHomeState();
}

class _IMHomeState extends State<IMHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IM"), // the name of the app on the top bar
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(icon: new Icon(Icons.chat)),
            new Tab(icon: new Icon(Icons.account_box)),
            new Tab(icon: new Icon(Icons.call)),
            //new Tab(text: "Contects",),
            //new Tab(text: "Calls",),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0)
          ),
          new Icon(Icons.more_vert),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0)
          ),
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(widget.cameras),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),
    );
  }
}
