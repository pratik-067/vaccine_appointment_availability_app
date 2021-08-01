import 'package:flutter/material.dart';

class Slots extends StatefulWidget {
  final List slots;
  const Slots({Key key, this.slots}) : super(key: key);
  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Slost')),
      body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: widget.slots.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  child: Column(
                    children: [],
                  ),
                );
              })),
    );
  }
}
