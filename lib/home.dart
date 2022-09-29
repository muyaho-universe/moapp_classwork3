// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine/home_list.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse('https://www.handong.edu/');
  final isSelected = <bool>[false, true];


  bool _isList = false;

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '\n\nPages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: Icon(Icons.home),
              iconColor: Colors.blueAccent,
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Search'),
              leading: Icon(Icons.search),
              iconColor: Colors.blueAccent,
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Favorite Hotel'),
              leading: Icon(Icons.location_city),
              iconColor: Colors.blueAccent,
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('My Page'),
              leading: Icon(Icons.person),
              iconColor: Colors.blueAccent,
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: Icon(Icons.logout),
              iconColor: Colors.blueAccent,
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      // TODO: Add app bar (102)
      appBar: AppBar(
        // TODO: Add buttons and title (102)
        title: const Text('Menu'),

        // TODO: Add trailing buttons (102)
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.language,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              _launchUrl();
            },
          ),
        ],
      ),
      // TODO: Add a grid view (102)
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: Colors.blue,
                selectedBorderColor: Colors.blue,
                fillColor: Colors.blue.withOpacity(0.08),
                splashColor: Colors.blue.withOpacity(0.12),
                hoverColor: Colors.blue.withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    if(index == 0){
                      _isList = true;
                      isSelected[0] = true;
                      isSelected[1] = false;
                    }
                    else{
                      _isList = false;
                      isSelected[0] = false;
                      isSelected[1] = true;
                    }
                  });
                },
                children: [
                  Icon(Icons.list),
                  Icon(Icons.grid_view),
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          // HomeListPage(_isList),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}