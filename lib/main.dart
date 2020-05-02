import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static final _myTabbedPageKey = new GlobalKey<_MyTabbedPageState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'QytetarIN',
      home: new MyTabbedPage(
        key: _myTabbedPageKey,
      ),
    );
  }
}
class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Kryesore'),
    new Tab(text: 'Peticione'),
    new Tab(text: 'Parametrat'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello Tabs"),
        bottom: new TabBar(
          controller: _tabController,
           tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.pages)),
                Tab(icon: Icon(Icons.settings)),
              ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return new Center(child: new Text(tab.text));
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
       // onPressed: () => _tabController.animateTo((_tabController.index + 1) % 3), // Switch tabs
        onPressed: () => _tabController.animateTo(2), // Switch tabs

        child: new Icon(Icons.settings),
      ),
    );
  }
}