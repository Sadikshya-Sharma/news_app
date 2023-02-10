import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('ID'),
      ),
      body: Center(
        child: Text(widget.body),
      ),
    );
  }
}
