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
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.slots[index]['name'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.slots[index]['address'],
                            style: TextStyle(fontSize: 16),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.slots[index]['vaccine'],
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                widget.slots[index]['fee_type'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Divider(),
                          Text(
                            'From:' +
                                widget.slots[index]['from'].toString() +
                                "             To:" +
                                widget.slots[index]['to'].toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Age Limit :' +
                                    widget.slots[index]['min_age_limit']
                                        .toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                widget.slots[index]['available_capacity']
                                    .toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ));
              })),
    );
  }
}
