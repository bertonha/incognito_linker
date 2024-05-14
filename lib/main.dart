import 'package:flutter/material.dart';

import 'widgets/link_card.dart';
import 'widgets/new_link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Incognito Linker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Incognito Linker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _links = [];

  void _addLink(newItem) {
    setState(() {
      _links.add(newItem);
    });
  }

  void _removeLink(removeLink) {
    setState(() {
      _links.removeWhere((link) => link == removeLink);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewLink(_addLink);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _links.length,
        itemBuilder: (context, index) {
          final link = _links[index];
          return LinkCard(link, _removeLink);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        tooltip: 'Add new link',
        child: Icon(Icons.add),
      ),
    );
  }
}
