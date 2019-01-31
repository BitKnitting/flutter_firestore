import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'icons_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activities',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activities')),
      body: _buildTip(context),
    );
  }

  Widget _buildTip(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('activities')
          .orderBy('priority')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 15.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.tip),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: Card(
        child: ListTile(
          //leading: Icon(Icons.account_box),
          leading: Icon(getIcon(name: record.icon)),
          title: Text(record.tip),
          trailing: Icon(getIcon(name: 'keyboard_arrow_right')),
          onTap: () => print("tap tap"),
        ),
      ),
    );
  }
}

class Record {
  final String tip;
  final String icon;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['tip'] != null),
        tip = map['tip'],
        icon = map['icon'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$tip>";
}
