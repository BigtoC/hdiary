import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:hnotes/util/theme.dart';
import 'package:hnotes/util/build_card_widget.dart';
import 'package:hnotes/util/share_preferences.dart';
import 'package:hnotes/drawer/setting_page/app_repo.dart';

// ignore: must_be_immutable
class ChainInfoPage extends StatefulWidget {
  @override
  _ChainInfoPageState createState() => _ChainInfoPageState();
}

class _ChainInfoPageState extends State<ChainInfoPage> {
  String selectedTheme;
  String _selectedDate = '';

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Theme.of(context).brightness == Brightness.dark) {
        selectedTheme = 'dark';
      } else {
        selectedTheme = 'light';
      }
    });

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    handleBack();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 36, right: 24),
                  child: buildHeaderWidget('Blockchain Info'),
                ),
                buildDatePicker(context),
                buildAboutApp(context),
              ],
            ))
        ],
      ),
    );
  }

  void handleBack() {
    Navigator.pop(context);
  }

  Widget buildDatePicker(BuildContext context) {
    return buildCardWidget(context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cardTitle('Latest Block Info'),
          Container(
            height: 20,
          ),
          Center(
            child: new Column(
              children: <Widget>[
                new RaisedButton(
                  onPressed: _selectDate,
                  child: new Text(
                    _selectedDate == '' ? 'Select Your Date' : _selectedDate,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )
                  ),
                  color: btnColor,
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Future _selectDate() async {
    // ToDo: select date in the first time
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1966),
      lastDate: new DateTime.now()
    );
    if (picked != null) {
      // Convert selected date to string for showing
      setState(() => _selectedDate = picked.toString().split(" ")[0]);
      // Write the selected date to system
      setDateInSharedPref(_selectedDate);
    }
  }

  Widget buildAboutApp(BuildContext context) {
    return buildCardWidget(context, Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'About App',
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).primaryColor
          )
        ),
        Container(
          height: 40,
        ),
        Center(
          child: Text('Developed by'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              letterSpacing: 1
            )
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              'Bigto Chan',
              style: TextStyle(
                fontSize: 24
              ),
            ),
          )
        ),
        Container(
          alignment: Alignment.center,
          child: OutlineButton.icon(
            icon: Icon(Icons.code),
            label: Text(
              'GITHUB',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: Colors.grey.shade500
              )
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            onPressed: openGitHub,
          ),
        ),
        Container(
          height: 30,
        ),
        Center(
          child: Text('Co-Designer'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              letterSpacing: 1
            )
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              'Rita vv',
              style: TextStyle(
                fontSize: 24
              ),
            ),
          )
        ),
        Container(
          height: 30,
        ),
        Center(
          child: Text(
            'Made With'.toUpperCase(),
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              letterSpacing: 1
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      fontFamily: 'ZillaSlab', fontSize: 24
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void openGitHub() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new Browser();
    }));
  }
}