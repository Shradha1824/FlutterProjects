import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:flutter_application_2/screens/volume.dart';
import 'package:hexcolor/hexcolor.dart';

class Temperature extends BaseScreen {
  TemperatureState createState() => TemperatureState();
}

class TemperatureState extends BaseScreenState {
  final List<String> _measureTemperature = ['Censius', 'Fahrenheit', 'Kalvin'];

  var _startMeasureTemperature;
  var _convertTemperature;
  var _resultMessage;
  var _numberForm;
  late double _userInput;

  final Map<String, int> _measureMap = {
    'Censius': 0,
    'Fahrenheit': 1,
    'Kalvin': 2
  };

  dynamic _formulas = {'0': [], '1': [], '2': []};

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
                        onDoubleTap: () {},
                      ),
                      Row(children: <Widget>[
                        InkWell(
                          splashColor: Colors.red,
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
                                      'assets/images/hotC.png',
                                      alignment: Alignment.center,
                                    )),
                                    Text('Temperature',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red)),
                                  ]))),
                          onDoubleTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Volume()),
                            );
                          },
                        )
                      ]),
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
                        width: 120,
                        margin: EdgeInsets.only(right: 30),
                        child: Text('From',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54)),
                      ),
                      Container(
                        width: 120,
                        margin: EdgeInsets.only(right: 40),
                        child: Text('To',
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
                            child: Text('32',
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
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: new DropdownButton(
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
                                value: _startMeasureTemperature,
                                onChanged: (newValueSelected) {
                                  setState(() {
                                    this._startMeasureTemperature =
                                        newValueSelected;
                                  });
                                },
                                items: _measureTemperature.map((valueItem) {
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
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: new DropdownButton(
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
                                value: _convertTemperature,
                                onChanged: (newValueSelected) {
                                  setState(() {
                                    this._convertTemperature = newValueSelected;
                                  });
                                },
                                items: _measureTemperature.map((valueItem) {
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
                          convert(_userInput, _startMeasureTemperature,
                              _convertTemperature);
                        },
                      )
                    ],
                  )
                ])
              ]))
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

    void iniState() {
      _userInput = 0;
      super.initState();
    }
  }
}
