import 'package:flutter/material.dart';
import 'package:notes_app/screens/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './MyNotes.dart' as myNotes;
import './Discover.dart' as discover;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(new MaterialApp(
    home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget{
  @override
  MyApp createState() => new MyApp();
}


class MyApp extends State<MyTabs> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(title: new Text("Memoir"), backgroundColor: Colors.deepPurple
    ),
    bottomNavigationBar: new Material(
      color: Colors.deepPurple,
      child: new TabBar(
        controller: controller,
        tabs: <Tab>[
            new Tab(icon: new Icon(Icons.account_circle)),
            new Tab(icon: new Icon(Icons.public))
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new myNotes.MyNotes(),
          new discover.Discover()
        ]
      )
    );
  }
}
