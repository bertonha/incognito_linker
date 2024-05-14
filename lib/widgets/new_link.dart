import 'package:flutter/material.dart';

class NewLink extends StatefulWidget {
  final Function addLink;

  NewLink(this.addLink);

  @override
  _NewLinkState createState() => _NewLinkState();
}

class _NewLinkState extends State<NewLink> {
  final _linkController = TextEditingController();

  void _submitData() {
    final inputLink = _linkController.text;

    if (inputLink.isEmpty) {
      return;
    }

    widget.addLink(
      inputLink,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _linkController,
              decoration: InputDecoration(labelText: "Title"),
              onSubmitted: (_) => _submitData(),
            ),
            ElevatedButton(
              child: Text("Add Link"),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
