import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:fluttercryptoui/bid.dart';
import 'package:fluttercryptoui/cityTime.dart';
import 'package:fluttercryptoui/filter.dart';
import 'package:fluttercryptoui/graphicType.dart';
import 'package:fluttercryptoui/language.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[800],
        cardColor: Colors.blueGrey[600],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> menuOptions = [
    'Deposit',
    'Withdraw',
    'Finance',
    'Profile management',
    'Education'
  ];
  List<Language> languages = [
    Language(name: "English", pic: "images/english.png"),
    Language(name: "Русский", pic: "images/russian.png")
  ];
  String pickedShowMode = "All";
  bool drawerIntrumentsPicked = true;
  List<Bid> drawerBids = [
    Bid(up: true, bid: 110000005, ask: 1234340040, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 1234340040, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 1234340040, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 11234340040452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 1234340040, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 1234340040, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
  ];
  int peopleOnline = 1337;
  static int hoursAmount = 7;
  static int minutesAmount = 26;
  List<CityTime> cities = [
    CityTime(name: "NY", time: TimeOfDay(hour: hoursAmount, minute: 12)),
    CityTime(
        name: "London",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Frankfurt",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Moscow",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Tokyo",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
    CityTime(
        name: "Sydney",
        time: TimeOfDay(hour: hoursAmount, minute: minutesAmount)),
  ];

  List<GraphicType> graphicTypes = [
    GraphicType(name: "candle", icon: Icon(FontAwesome.bar_chart, color: Colors.white, size: 12, )),
    GraphicType(name: "stroke", icon: Icon(MaterialCommunityIcons.chart_bar, color: Colors.white,size: 12,)),
    GraphicType(name: "line", icon: Icon(FontAwesome.line_chart, color: Colors.white,size: 12,)),
    GraphicType(name: "area", icon: Icon(FontAwesome.area_chart, color: Colors.white,size: 12,)),
  ];

  GraphicType pickedType = GraphicType(name: "candle", icon: Icon(FontAwesome.bar_chart));
  String pickedTimeBoundary = '1m';

  List<Filter> filterOptions = [
    Filter(name: "SMA", isOn: false, index: 0),
    Filter(name: "EMA", isOn: false, index: 1),
    Filter(name: "Supstance lines", isOn: false, index: 2),
    Filter(name: "Bollinger Bands", isOn: false, index: 3),
    Filter(name: "Alligator", isOn: false, index: 4),
    Filter(name: "Parabolic SAR", isOn: false, index: 5),
    Filter(name: "Heiken Ashi", isOn: false, index: 6),
    Filter(name: "ZigZag", isOn: false, index: 7),
    Filter(name: "Trendlines", isOn: false, index: 8),
    Filter(name: "MACD", isOn: false, index: 9),
    Filter(name: "RSI", isOn: false, index: 10),
    Filter(name: "ADX", isOn: false, index: 11),
    Filter(name: "CCI", isOn: false, index: 12),
    Filter(name: "Williams", isOn: false, index: 13),
    Filter(name: "Momentum", isOn: false, index: 14),
  ];

  String pickedPairSymbol = "EURUSD";
  bool isReal = false;
  String pickedPositionAndOrderMode = "Opened positions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: FlatButton(
          onPressed: () {
            // TODO implement callback
            print("press logo");
          },
          child: Image.asset('images/logo.png',
              height: 30.0, fit: BoxFit.scaleDown)),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: PopupMenuButton<String>(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return menuOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          // padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey[500], width: 0.5))),
          child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // TODO implement callback
                print("press deposit");
              },
              child: Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent)),
                child: Text("Deposit",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
              )),
        ),
        Container(
          width: 30,
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.grey[500], width: 0.5))),
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.headset_mic,
                size: 14,
              ),
              onPressed: () {
                // TODO implement callback
                print("tech support press");
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: PopupMenuButton<String>(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lang",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return languages.map((Language option) {
                return PopupMenuItem<String>(
                  value: option.name,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(option.pic),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(option.name,
                          style: TextStyle(color: Colors.white, fontSize: 14 )
                        ),
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          decoration: BoxDecoration(
              border: Border(
            left: BorderSide(color: Colors.grey[500], width: 0.5),
          )),
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.exit_to_app,
                size: 16,
              ),
              onPressed: () {
                // TODO implement callback
                print("press exit");
              }),
        )
      ],
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 0.0,
    );
  }

  Widget _drawer() {
    return (Drawer(
        child: Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 150.0,
              child: _drawerHeader()),
          Expanded(
              child: Container(
            color: Colors.blueGrey[800],
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.zero,
            child: _tableList(),
          ))
        ],
      ),
    )));
  }

  Widget _drawerHeader() {
    List<String> showTypes = [
      'All',
      'Fiat',
      'Commodities',
      'Equities',
      'Crypto'
    ];
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PopupMenuButton<String>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.white)),
                      ),
                      child: Text("Show: $pickedShowMode",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                ),
                onSelected: (String menuOption) {
                  //TODO implement callback on select
                  print(menuOption);
                  setState(() {
                    pickedShowMode = menuOption;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return showTypes.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child:
                          Text(option, style: TextStyle(color: Colors.white)),
                    );
                  }).toList();
                },
              ),
              Expanded(
                child: _search()
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  child: FlatButton(
                    color: drawerIntrumentsPicked
                        ? Colors.brown[300]
                        : Colors.transparent,
                    onPressed: () {
                      // TODO implement callback
                      print("press intruments");
                      setState(() {
                        drawerIntrumentsPicked = true;
                      });
                    },
                    child: Text(
                      "Instruments",
                      style: TextStyle(color: Colors.white),
                    )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 30,
                  child: FlatButton(
                    color: drawerIntrumentsPicked
                        ? Colors.transparent
                        : Colors.brown[300],
                    onPressed: () {
                      // TODO implement callback
                      print("press favorites");
                      setState(() {
                        drawerIntrumentsPicked = false;
                      });
                    },
                    child:
                      Text("Favorites", style: TextStyle(color: Colors.white))
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(color: Colors.blueGrey[800]),
    );
  }

  Widget _tableList() {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 430,
      width: 300,
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listRows(),
      ),
    );
  }

  List<Widget> _listRows() {
    TextStyle orangeStyle = TextStyle(color: Colors.orange);
    List<Widget> allRows = [];
    Widget initialRow = Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.blueGrey[900],
        ),
        padding: EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text("Symbol", style: orangeStyle),
            ),
            Text("Bid", style: orangeStyle),
            Container(
              margin: EdgeInsets.only(right: 40),
              child: Text("Ask", style: orangeStyle),
            )
          ],
        ),
      ),
    );
    var rows = drawerBids.map((Bid bid) {
      return Container(
        height: 28,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.blueGrey[900],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 3.0),
                    width: 20,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 14,
                        ),
                        onPressed: () {
                          // TODO implement callback
                          print("press drawer star");
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 4.0),
                    child: Icon(
                      bid.up ? Icons.arrow_upward : Icons.arrow_downward,
                      color: bid.up ? Colors.greenAccent : Colors.red,
                      size: 14,
                    ),
                  ),
                  Text(
                    bid.symbol,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              child: Text(bid.bid.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 8)),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  bid.ask.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 12,
                    ),
                    onPressed: () {
                      // TODO implement callback
                      print('press drawer list arrow');
                    })
              ],
            ))
          ],
        ),
      );
    });
    allRows.add(initialRow);
    rows.toList();
    allRows.addAll(rows);
    return allRows;
  }

  Widget _body() {
    const darkPurple = Color.fromRGBO( 33,31,46, 1);
    return Column(
      children: <Widget>[
        _cityList(),
        _graphicList(),
        _info(),
        _chart(),
        _positionsAndOrders(),
        _searchAndSwitch(),
        _orderTable()
      ],
    );
  }

  Widget _cityList(){
    return Container(
      height: 18,
      color: Colors.grey[800],
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.people_outline,
                  color: Colors.green,
                  size: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 2.0),
                  child: Text(
                    peopleOnline.toString(),
                    style: TextStyle(color: Colors.green, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(left: 4.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _cities(),
            ),
          ))
        ],
      )
    );
  }

  Widget _graphicList() {
    const darkPurple = Color.fromRGBO( 33,31,46, 1);
    return Container(
      color: darkPurple,
      padding: EdgeInsets.only(bottom: 2.0, top: 2.0),
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              _graphicTypes(),
              _timeBoundaries(),
              _graphicDropdown()
            ],
          )
        ],
      )
    );
  }

  List<Widget> _cities() {
    return cities.map((CityTime city) {
      return Container(
        margin: EdgeInsets.only(left: 4.0, right: 4.0),
        child: Row(
          children: <Widget>[
            Text(
              '${city.name}: ',
              style: TextStyle(fontSize: 10, color: Colors.yellowAccent),
            ),
            Text(
              '${city.time.hour}:${city.time.minute}',
              style: TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        ),
      );
    }).toList();
  }

  Widget _graphicTypes(){
    List<Widget> types = graphicTypes.map((GraphicType type){
      return Container(
        color: type.name == pickedType.name ? Colors.green : Colors.blueGrey[600] ,
        // padding: EdgeInsets.all(4.0),
        width: 30,
        child: IconButton(
          icon: type.icon, 
          onPressed: () {
            // TODO press change graphic type
            print(type.name);
            setState(() {
              pickedType = type;
            });
          }
        ),
      );
    }).toList();
    return Container(
      child: Row(
        children: types,
      ),
    );
  }

  Widget _timeBoundaries() {
    List<String> timeBoundaries = ['1m', '5m', '15m', '30m', '1h', '1d', '5d', '1M', '3M', '6M', '1Y'];
    var boundaries = timeBoundaries.map((String boundary){
      return Container(
        color: boundary == pickedTimeBoundary ? Colors.green : Colors.blueGrey[600] ,
        width: 25,
        // padding: EdgeInsets.all(4.0),
        child: FlatButton(
          padding: EdgeInsets.zero,
          child: Text(boundary, style: TextStyle(color: Colors.white, fontSize: 10),),
          onPressed: () {
            // TODO press change graphic type
            print(boundary);
            setState(() {
              pickedTimeBoundary = boundary;
            });
          }
        ),
      );
    }).toList();
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 0.5, color: Colors.white)
        ),
      ),
      child: Row(
        children: boundaries,
      ),
    );
  }

  Widget _graphicDropdown(){
    return Container(
      margin: EdgeInsets.only(left : 4.0),
      child: PopupMenuButton<String>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.multiline_chart, color: Colors.white, size: 18,),
            Icon(Icons.arrow_drop_down, color: Colors.yellow, size: 18)
          ],
        ),
        onSelected: (String menuOption) {
          //TODO implement callback on select
          print(menuOption);
        },
        itemBuilder: (BuildContext context) {
          List<PopupMenuEntry<String>> listWithButton = [];
          var filters = filterOptions.map((Filter option) {
            return PopupMenuItem<String>(
              value: option.name,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(option.name, style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),),
                  Switch(
                    value: option.isOn, 
                    onChanged: (bool newIsOn){
                      // TODO implement callback
                      print("press switch");
                    }
                  )
                ],
              ),
            );
          }).toList();
          Widget button = PopupMenuItem<String>(
            value: "deleteAll",
            child: FlatButton(
              onPressed: () {
                // TODO implement callback
                print("On delete all press");
              }, 
              child: Text("Delete All", style: TextStyle(color : Colors.white),)
            ),
          );
          listWithButton.addAll(filters);
          listWithButton.add(button);
          return listWithButton;
        },
      ),
    );
  }

  Widget _info(){
    DateTime now = DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString();
    String day = now.day.toString();

    String timeZone = 'UTC+${now.timeZoneOffset.inHours.toString()}';

    String dateString = '$day $month, $year';
    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Text(dateString, style: TextStyle(color: Colors.green, fontSize: 10),),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Text(timeZone, style: TextStyle(color: Colors.white, fontSize: 10),),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Text(pickedPairSymbol, style: TextStyle(color: Colors.white, fontSize: 10),),
          )
        ],
      ),
    );
  }

  Widget _chart() {
    List sampleData = [
      {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
      {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
      {"open":65.0, "high":120.0, "low":60.0, "close":90, "volumeto":7000.0},
      {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
      {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    ];
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      // margin: EdgeInsets.only(top : 4.0),
      color: Colors.grey[900],
      height: windowHeight * 0.4,
      child: OHLCVGraph(
        data: sampleData,
        enableGridLines: true,
        volumeProp: 0.2,
        gridLineAmount: 5,
        gridLineColor: Colors.grey[300],
        gridLineLabelColor: Colors.grey
      ),
    );
  }

  Widget _positionsAndOrders() {
    List<String> options = ['Opened positions', 'Closed positions', 'Pending orders'];
    return Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 0.5)
        ),
        color:  Colors.grey[800],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: _positionAndOrderOptions(options),
          ),
          _orderCreation()
        ],
      ),
    );
  }

  List<Widget> _positionAndOrderOptions(List<String> options) {
    return options.map((String option){
      return Container(
        color: pickedPositionAndOrderMode == option ? Colors.grey[500] : Colors.transparent,
        width: 70,
        padding: EdgeInsets.zero,
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            print("press $option");
            setState(() {
              pickedPositionAndOrderMode = option;
            });
          }, 
          child: Text(option, style: TextStyle(color: Colors.grey[200], fontSize: 8),)
        )
      );
    }).toList();
  }

  Widget _orderCreation() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300])
            ),
            child: Text(pickedPairSymbol, style: TextStyle(color: Colors.grey[300], fontSize: 10), ),
          ),
          Container(
            height: 16,
            margin: EdgeInsets.only(left: 2.0, right : 2.0),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                //TODO implement callback
                print("press Create order");
              }, 
              child: Text("Create order", style: TextStyle(color: Colors.white, fontSize: 10), )
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchAndSwitch() {
    return Container(
      height: 30,
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100,
            height: 25,
            margin: EdgeInsets.only(right: 4.0, left: 4.0),
            child: _search()
          ),
          Container(
            margin: EdgeInsets.only(right: 4.0, left: 4.0),
            child: _switch(),
          )
        ],
      ),
    );
  }

  Widget _search() {
    return TextField(
      onChanged: (String text) {
        print("change drawer search");
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search, color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              const BorderSide(color: Colors.grey, width: 0.0),
        ),
      ),
    );
  }

  Widget _switch() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Demo", style: TextStyle(color: isReal ? Colors.white : Colors.yellow, fontSize: 10),),
          Switch(
            value: false, 
            onChanged: (bool newIsReal) {
              print(isReal.toString());
              setState(() {
                isReal = !isReal;
              });
            }
          ),
          Text("Real", style: TextStyle(color: isReal ? Colors.yellow : Colors.white, fontSize: 10),),
        ],
      ),
    );
  }

  Widget _orderTable() {
    return Container(
      height: 100,
      child: BidirectionalScrollViewPlugin(
        child: _orderTableRows(),
      )
    );
  }

  Widget _orderTableRows(){
    return Container(
      child: Column(
        children: <Widget>[
          _orderTableInitRow()
        ],
      ),
    );
  }

  Widget _orderTableInitRow(){
    List<String> initRowCells = ['ID',	'Symbol',	'Type',	'Size',	'Open rate',	'Open time',	'Stop loss',	'Take profit',	'Profit',	'Swap',	'Contract',	'Current rate',	'Actions'];
    List<Widget> cells = initRowCells.map((String name){
      return _initRowCell(name);
    }).toList();
    return Container(
      color: Colors.grey[700],
      child: Row(
        children: cells,
      )
    );
  }

  Widget _initRowCell(String name){
    return Container(
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.black, width: 0.5)
        )
      ),
      padding: EdgeInsets.all(4.0),
      child: Text(name, style: TextStyle(color: Colors.white, fontSize: 10),)
    );
  }

  List<Widget> orderTableRows(){
    
  }
}
