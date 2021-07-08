import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Volume extends BaseScreen {
  VolumeState createState() => new VolumeState();
}

class VolumeState extends BaseScreenState {
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
    '0': [1.0, 0.1, 0.000001, 0.0032808399, 0.03937008, 0.0010936133],
    '1': [10.0, 1.0, 0.01, 0.00001, 0.0328084, 0.39370078, 0.010936133],
    '2': [1000.0, 100.0, 1.0, 0.001, 3.28084, 39.37008, 1.0936133],
    '3': [1000000.0, 100000.0, 1000.0, 1.0, 3280.8398, 39370.08, 1093.6133],
    '4': [304.8, 30.48, 0.3048, 0.0003048, 1, 12.0, 0.33333334],
    '5': [25.4, 2.54, 0.0254, 0.0000254, 0.08333336, 1.0, 0.0277778],
    '6': [914.4, 91.44, 0.9144, 0.000914, 3.0, 36.0, 1.0]
  };

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
                          fontSize: 12.0,
                          fontWeight: FontWeight.w800,
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
                        height: 135.0,
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
                              height: 135.0,
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
                          height: 135.0,
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
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54)),
                    ),
                    Container(
                      width: 120,
                      margin: EdgeInsets.only(right: 40),
                      child: Text('To',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
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
                          child: buildText(),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(0.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.horizontal(),
                          )),
                      Container(
                          width: 150.0,
                          height: 40.0,
                          child: Text('1000',
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
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
                                    color: Colors.black12, fontSize: 10),
                              ),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
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
                                    color: Colors.black12, fontSize: 10),
                              ),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 20,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
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
                      child: Text('Convert'),
                      style: TextButton.styleFrom(
                        primary: Colors.black12,
                        textStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      onPressed: () {
                        convert(_userInput, _currentSelectedValue,
                            _convertMeasures);
                      },
                    )
                  ],
                )
              ]),
            ]),
      )
    ]))));
  }

  Widget buildText() => TextField(
        style: TextStyle(fontSize: 10.0, color: Colors.black),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter The Value",
            hintStyle: TextStyle(fontSize: 10.0, color: Colors.black12)),
        keyboardType: TextInputType.number,
      );

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
}