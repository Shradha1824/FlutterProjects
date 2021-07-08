import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Volume extends BaseScreen {
  VolumeState createState() => new VolumeState();
}

class VolumeState extends BaseScreenState {
  void iniState() {
    _userInput = 0;
    super.initState();
  }

  final List<String> _measures = ["Liters", "Mililiters", "Gallons"];

  var _currentSelectedValue;
  var _convertMeasures;
  var _resultMessage;
  var _userInput;

  final Map<String, int> _measureMap = {
    'Liters': 0,
    'Mililiters': 1,
    'Gallons': 2
  };

  dynamic _formulas = {
    '0': [1.0, 1000.0, 0.219969],
    '1': [0.001, 1.0, 0.00022],
    '2': [4546.09, 4.54609, 1.0],
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
                                  'assets/images/scaleBW.png',
                                  alignment: Alignment.center,
                                ),
                              ),
                              Text('Length',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black12)),
                            ])),
                      ),
                      onTap: () {},
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
                          onDoubleTap: () {}),
                    ]),
                    Row(children: <Widget>[
                      InkWell(
                        splashColor: Colors.purpleAccent,
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
                                  'assets/images/beakerC.png',
                                  alignment: Alignment.center,
                                )),
                                Text('Volume',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.purple)),
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
                      width: 120,
                      margin: EdgeInsets.only(right: 30),
                      child: Text('From',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 40),
                      child: Text('To',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                    )
                  ]),
              Column(children: <Widget>[
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
                                      fontSize: 12.0, color: Colors.black12)),
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
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.horizontal(),
                          )),
                      Container(
                          width: 150.0,
                          height: 40.0,
                          child: Text(
                            (_resultMessage == null) ? '' : _resultMessage,
                            style: TextStyle(
                              color: HexColor('#000000'),
                              fontSize: 12,
                            ),
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.horizontal(),
                          ))
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
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
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
                              value: _currentSelectedValue,
                              onChanged: (newValueSelected) {
                                setState(() {
                                  this._currentSelectedValue = newValueSelected;
                                });
                              },
                              items: _measures.map((valueItem) {
                                return DropdownMenuItem<String>(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ))),
                        Container(
                            width: 150.0,
                            height: 40.0,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
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
                              value: _convertMeasures,
                              onChanged: (newValueSelected) {
                                setState(() {
                                  this._convertMeasures = newValueSelected;
                                });
                              },
                              items: _measures.map((valueItem) {
                                return DropdownMenuItem<String>(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ))),
                      ])
                ]),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_currentSelectedValue.isEmpty ||
                            _convertMeasures.isEmpty ||
                            _userInput == 0)
                          return;
                        else
                          convert(_userInput, _currentSelectedValue,
                              _convertMeasures);
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
              ]),
            ]),
      )
    ]))));
  }
}
