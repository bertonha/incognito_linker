import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkCard extends StatelessWidget {
  final String link;
  final Function removeLink;

  LinkCard(this.link, this.removeLink);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          icon: Icon(Icons.content_copy),
          color: Colors.blue,
          onPressed: () => Clipboard.setData(ClipboardData(text: link)),
        ),
        title: Text("$link"),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => removeLink(link),
        ),
      ),
    );
  }
}
