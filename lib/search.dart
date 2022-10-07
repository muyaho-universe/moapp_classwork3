import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isOpen = false;
  var isCheckedList = [false, false, false];

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: ListView(
                children: [
                  ExpansionPanelList(
                    animationDuration: Duration(milliseconds: 1000),
                    elevation: 4,
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "select filters",
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          );
                        },
                        body: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      // fillColor: MaterialStateProperty.resolveWith(Colors.blue),
                                      value: isCheckedList[0],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckedList[0] = value!;
                                        });
                                      },
                                    ),
                                    Text("No Kids Zone"),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      // fillColor: MaterialStateProperty.resolveWith(Colors.blue),
                                      value: isCheckedList[1],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckedList[1] = value!;
                                        });
                                      },
                                    ),
                                    Text("Pet-Friendly"),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                    ),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      // fillColor: MaterialStateProperty.resolveWith(Colors.blue),
                                      value: isCheckedList[2],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isCheckedList[2] = value!;
                                        });
                                      },
                                    ),
                                    Text("Free breakfast"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        isExpanded: _isOpen,
                        canTapOnHeader: true,
                      ),
                    ],
                    expandedHeaderPadding: EdgeInsets.all(0),
                    expansionCallback: (panelIndex, isExpanded) {
                      _isOpen = !_isOpen;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                    ),
                                    Text("check-in"),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${DateFormat('yyyy').format(_selectedDate)}.${DateFormat('MM').format(_selectedDate)}.${DateFormat('dd').format(_selectedDate)} (${DateFormat('E').format(_selectedDate).toUpperCase()})',
                                ),
                                Text(
                                  '${DateFormat('HH').format(_selectedDate)}:${DateFormat('mm').format(_selectedDate)} ${DateFormat('a').format(_selectedDate).toLowerCase()}',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            width: 150,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Color(0xFFBDDFFD),
                              ),
                              onPressed: () {
                                Future<DateTime?> future = showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2023),
                                );

                                future.then((date) {
                                  setState(() {
                                    _selectedDate =
                                        date!.add(const Duration(hours: 9));
                                  });
                                });
                              },
                              child: Text(
                                "select date",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 250,
                  // ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 150.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.all(0),
                            title: Container(
                              height: 100,
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Please check\n your choice :)',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(children: <Widget>[]),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Search'),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
