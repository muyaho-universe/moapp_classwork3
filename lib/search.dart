import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isOpen = false;
  var isCheckedList = [false, false, false];
  // DateTime

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 8.0),
            child: ExpansionPanelList(
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
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
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
                                width: MediaQuery.of(context).size.width / 3,
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
                                width: MediaQuery.of(context).size.width / 3,
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
                          Text(
                            "Date",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
          ),
        ],
      ),
    );
  }

  Text headText() {
    return Text("야호");
  }
}
