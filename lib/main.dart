import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:vaccine_slot_vacancy_app/slots.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.green.shade400),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//----------------------------------------------------
  TextEditingController pincodeController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  List slot = [];
//----------------------------------------------------
  feachSlot() async {
    print(dayController.text);
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                pincodeController.text +
                '&date=' +
                dayController.text))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slot.addAll(result['sessions']);
      });

      // print(result['sessions'][1]['name']);
    });
  }

//-----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COVID Vaccination"),
        backgroundColor: Colors.green.shade400,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: pincodeController,
                  decoration: InputDecoration(hintText: "Enter PinCode"),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: dayController,
                  decoration: InputDecoration(
                    hintText: "Enter Date",
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    dayController.text = DateFormat("dd-MM-yyyy hh:mm:ss")
                        .format(date)
                        .substring(0, 10);
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 350,
                height: 45,
                child: ElevatedButton(
                  child: Text('Search'),
                  onPressed: () {
                    feachSlot();
                    if (slot.isEmpty) {
                      _showMyDialog(context);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Slots(slots: slot)));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showMyDialog(BuildContext context) async {
    var alert = AlertDialog(
        title: const Text('NO Slot avilabe'),
        content: Text('vaccine is not avilablein your area'));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
