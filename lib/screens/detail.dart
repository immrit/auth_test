import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String user;
  Detail({super.key, required this.user});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.user),
      ),
    );
  }
}
