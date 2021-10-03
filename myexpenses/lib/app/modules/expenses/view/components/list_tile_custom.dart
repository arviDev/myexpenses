import 'package:flutter/material.dart';

class ListTileCustom extends StatefulWidget {
  final String title;
  const ListTileCustom({Key? key, required this.title}) : super(key: key);

  @override
  _ListTileCustomState createState() => _ListTileCustomState();
}

class _ListTileCustomState extends State<ListTileCustom> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
    );
  }
}
