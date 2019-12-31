import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LinkCard extends StatelessWidget {
  final String link;
  final Function removeLink;

  LinkCard(this.link, this.removeLink);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(link),
      onDismissed: (direction) {
        removeLink(link);
      },
      child: Card(
        child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.content_copy),
            color: Colors.blue,
            onPressed: () => Clipboard.setData(ClipboardData(text: link)),
          ),
          title: Text("$link"),
        ),
      ),
    );
  }
}
