import 'package:flutter/material.dart';

class Slots extends StatefulWidget {
   List slots;
   Slots({Key key, this.slots}) : super(key: key);
  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Slost'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: widget.slots.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(3),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            horizontalTitleGap: 1,
                            minVerticalPadding: 1,
                            contentPadding:
                                EdgeInsets.only(left: 3, right: 1, bottom: 0),
                            leading: Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                              size: 25,
                            ),
                            title: Text(
                              widget.slots[index]['name'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 1,
                            contentPadding:
                                EdgeInsets.only(left: 3, right: 1, bottom: 0),
                            leading: Icon(
                              Icons.local_hospital,
                              color: Colors.green,
                              size: 25,
                            ),
                            title: Text(
                              widget.slots[index]['address'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ListTile(
                            horizontalTitleGap: 1,
                            minVerticalPadding: 1,
                            contentPadding:
                                EdgeInsets.only(left: 3, right: 1, bottom: 0),
                            leading: Icon(
                              Icons.watch_later_outlined,
                              color: Colors.white,
                            ),
                            title: Text(
                              'From:' +
                                  widget.slots[index]['from'].toString() +
                                  "       To:" +
                                  widget.slots[index]['to'].toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
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
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                              ))
                        ],
                      ),
                    ));
              })),
    );
  }
}
