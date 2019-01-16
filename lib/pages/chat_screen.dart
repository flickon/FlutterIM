import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  final _nameStyle = new TextStyle(fontWeight: FontWeight.bold);
  final _timeStyle = new TextStyle(color: Colors.grey, fontSize: 14.0);
  final _messageStyle = new TextStyle(color: Colors.grey, fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: testMessages.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(testMessages[i].avatarUrl),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      testMessages[i].name,
                      style: _nameStyle,
                    ),
                    new Text(
                      testMessages[i].time,
                      style: _timeStyle,
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    formatString(testMessages[i].message),
                    style: _messageStyle,
                  ),
                ),
                onTap: () => messageTransaction(new Text(testMessages[i].name, style: _nameStyle)),
              ),
              new Divider(
                height: 5.0,
              ),
            ],
          ),
    );
  }

  /*
  reformat the string to make it took less space
   */
  String formatString(String text){
    return text.length > 30 ? text.substring(0, 30) : text;
  }

  void messageTransaction(Text name){
    Navigator.of(context).push(
        CupertinoPageRoute(
        builder: (context){
          return messagePage(name);
        }
      )
    );
  }

  Scaffold messagePage(Text name){
    return new Scaffold(
        appBar: new AppBar(
            title: name
        )
    );
  }
}
