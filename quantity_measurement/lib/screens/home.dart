import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:flutter_application_2/screens/temperature.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends BaseScreen {
  HomeState createState() => HomeState();
}

class HomeState extends BaseScreenState {
  void iniState() {
    _userInput = 0;
    super.initState();
  }

  final List<String> _measureLength = [
    'Milimeters',
    'Centimeter',
    'Meters',
    'Kilometers',
    'Feets',
    'Inches',
    'Yard'
  ];

  var _startMeasureLength;
  var _convertLength;

  final Map<String, int> _measureMap = {
    'Milimeters': 0,
    'Centimeter': 1,
    'Meters': 2,
    'Kilometers': 3,
    'Feets': 4,
    'Inches': 5,
    'Yard': 6,
  };

  var _resultMessage;
  late double _userInput;

  dynamic _formulas = {
    '0': [1.0, 0.1, 0.001, 0.000001, 0.0033, 0.0394, 0.0011],
    '1': [10.0, 1.0, 0.01, 0.00001, 0.0328, 0.3937, 0.0109],
    '2': [1000.0, 100.0, 1.0, 0.001, 3.2808, 39.3701, 1.0936],
    '3': [1000000.0, 100000.0, 1000.0, 1.0, 3280.8398, 39370.08, 1093.6133],
    '4': [304.8, 30.48, 0.3048, 0.0003, 1, 12.0, 0.3333],
    '5': [25.4, 2.54, 0.0254, 0.0000254, 0.0833, 1.0, 0.0277],
    '6': [914.4, 91.44, 0.9144, 0.000914, 3.0, 36.0, 1.0]
  };

  void convert(double value, String from, String to) {
    int? nFrom = _measureMap[from];
    int? nTo = _measureMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;

    _resultMessage = '${result.toString()}';

    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: HexColor('#446DFF'),
      title: Text(
        'Welcome to quantity measurement',
        style: TextStyle(fontSize: 22.0, color: HexColor('#FFFFFF')),
      ),
      centerTitle: true,
    );
  }

  Widget getBody(BuildContext context) {
    return Center(
        child: Container(
            child: SizedBox(
                child: ListView(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 30, bottom: 0, left: 0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 470,
                    child: Text("CHOOSE TYPE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.1))),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.green,
                        child: Container(
                            width: 130.0,
                            height: 140.0,
                            child: Card(
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 30, left: 5, right: 5),
                                elevation: 8,
                                child: Column(children: <Widget>[
                                  Expanded(
                                    child: Image.asset(
                                      'assets/images/scale.png',
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                  Text('Length',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green)),
                                ]))),
                        onDoubleTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Temperature()),
                          );
                        },
                      ),
                      Row(children: <Widget>[
                        InkWell(
                          splashColor: Colors.black12,
                          child: Container(
                              width: 130.0,
                              height: 140.0,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      top: 20, bottom: 30, left: 5, right: 5),
                                  elevation: 8,
                                  child: Column(children: <Widget>[
                                    Expanded(
                                        child: Image.asset(
                                      'assets/images/hot.png',
                                      alignment: Alignment.center,
                                    )),
                                    Text('Temperature',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black12)),
                                  ]))),
                          onTap: () {},
                        )
                      ]),
                      Row(children: <Widget>[
                        InkWell(
                          splashColor: Colors.black12,
                          child: Container(
                            width: 130.0,
                            height: 140.0,
                            child: Card(
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 30, left: 5, right: 5),
                                elevation: 8,
                                child: Column(children: <Widget>[
                                  Expanded(
                                      child: Image.asset(
                                    'assets/images/beaker.png',
                                    alignment: Alignment.center,
                                  )),
                                  Text('Volume',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black12)),
                                ])),
                          ),
                          onTap: () {},
                        )
                      ])
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        width: 120,
                        child: Text(
                          'From',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        width: 120,
                        child: Text('To',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54)),
                      )
                    ]),
                Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 150.0,
                              height: 40.0,
                              child: TextField(
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter The Value",
                                      hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black12)),
                                  keyboardType: TextInputType.number,
                                  onChanged: (text) {
                                    var input = double.tryParse(text);
                                    if (input != null)
                                      setState(() {
                                        _userInput = input;
                                      });
                                  }),
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.horizontal(),
                              )),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            width: 150.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.horizontal(),
                            ),
                            child: Text(
                              (_resultMessage == null) ? '' : _resultMessage,
                              style: TextStyle(
                                color: HexColor('#000000'),
                                fontSize: 1,
                              ),
                            ),
                          ),
                        ]),
                    Column(children: <Widget>[
                      Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                width: 150.0,
                                height: 40.0,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: new DropdownButton(
                                  hint: Text(
                                    'Choose a Unit',
                                    style: TextStyle(
                                        color: Colors.black12, fontSize: 12),
                                  ),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  value: _startMeasureLength,
                                  onChanged: (newValueSelected) {
                                    setState(() {
                                      this._startMeasureLength =
                                          newValueSelected;
                                    });
                                  },
                                  items: _measureLength.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                )),
                            Container(
                                width: 150.0,
                                height: 40.0,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: new DropdownButton(
                                  hint: Text(
                                    'Choose a Unit',
                                    style: TextStyle(
                                        color: Colors.black12, fontSize: 12),
                                  ),
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 20,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  value: _convertLength,
                                  onChanged: (newValueSelected) {
                                    setState(() {
                                      this._convertLength = newValueSelected;
                                    });
                                  },
                                  items: _measureLength.map((valueItem) {
                                    return DropdownMenuItem<String>(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                )),
                          ]),
                    ]),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_startMeasureLength.isEmpty ||
                                _convertLength.isEmpty ||
                                _userInput == 0)
                              return;
                            else
                              convert(_userInput, _startMeasureLength,
                                  _convertLength);
                          },
                          child: Text('Convert'),
                          style: TextButton.styleFrom(
                            primary: Colors.black12,
                            textStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ]))
    ]))));
  }
}
