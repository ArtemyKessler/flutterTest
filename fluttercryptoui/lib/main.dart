import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:fluttercryptoui/bid.dart';
import 'package:fluttercryptoui/cityTime.dart';
import 'package:fluttercryptoui/closedPosition.dart';
import 'package:fluttercryptoui/filter.dart';
import 'package:fluttercryptoui/footerData.dart';
import 'package:fluttercryptoui/graphicType.dart';
import 'package:fluttercryptoui/language.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:bidirectional_scroll_view/bidirectional_scroll_view.dart';
import 'package:fluttercryptoui/openedPosition.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:fluttercryptoui/pendingOrders.dart';

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
      home: MyHomePage(
          title:
              'Flutter Demo Home Page') /* MyLoginPage(
        title: 'login',
      ) */
      ,
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    Color backColor = Color.fromRGBO(17, 20, 30, 1);
    Color fontColor = Color.fromRGBO(249, 122, 5, 1);
    return Scaffold(
      appBar: _loginAppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        color: backColor,
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: fontColor, fontSize: 50),
                  ),
                  _loginInputs(),
                  _loginButtons()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginAppBar() {
    Color backColor = Color.fromRGBO(17, 20, 30, 1);
    return AppBar(
      backgroundColor: backColor,
      title:
          Image.asset('images/logo.png', height: 50.0, fit: BoxFit.scaleDown),
    );
  }

  Widget _loginInputs() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Text("E-Mail Address",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          _loginTextInput("email"),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text("Password",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          _loginTextInput("password"),
        ],
      ),
    );
  }

  Widget _loginButtons() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          _loginButton(),
          _loginSecondaryButtons(),
          _loginRegistryRef()
        ],
      ),
    );
  }

  Widget _loginButton() {
    Color fontColor = Color.fromRGBO(249, 122, 5, 1);
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1, color: fontColor)),
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Text(
          "Login",
          style: TextStyle(color: fontColor, fontSize: 20),
        ),
        onPressed: () {
          // TODO implement callback
          print("press login");
        },
      ),
    );
  }

  Widget _loginSecondaryButtons() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 20,
                  height: 20,
                  color: Colors.white,
                  child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: isRemember,
                      onChanged: (bool newIsRemember) {
                        // TODO implement callback
                        print("press remember checkbox");
                        setState(() {
                          isRemember = newIsRemember;
                        });
                      })),
              Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Remember me",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      // TODO implement callback
                      print("press forgot password");
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}

Widget _loginTextInput(String field) {
  return Container(
    width: 200.0,
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
    child: TextField(
      onChanged: (String text) {
        print("change $field input");
      },
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget _loginRegistryRef() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child: Text(
          'Are you new here?',
          style: TextStyle(color: Colors.grey[300]),
        )),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Create account",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              // TODO implement callback
              print("press logo ref");
            },
          ),
        )
      ],
    ),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
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
    GraphicType(
        name: "candle",
        icon: Icon(
          FontAwesome.bar_chart,
          color: Colors.white,
          size: 12,
        )),
    GraphicType(
        name: "stroke",
        icon: Icon(
          MaterialCommunityIcons.chart_bar,
          color: Colors.white,
          size: 12,
        )),
    GraphicType(
        name: "line",
        icon: Icon(
          FontAwesome.line_chart,
          color: Colors.white,
          size: 12,
        )),
    GraphicType(
        name: "area",
        icon: Icon(
          FontAwesome.area_chart,
          color: Colors.white,
          size: 12,
        )),
  ];

  GraphicType pickedType =
      GraphicType(name: "candle", icon: Icon(FontAwesome.bar_chart));
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
  List<OpenedPosition> openedPositionRows = [
    OpenedPosition(
        id: "2",
        symbol: "JIJA",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "4",
        symbol: "JUJA",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "122",
        symbol: "QOQOQU",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "3",
        symbol: "ZUZUZ",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "3",
        symbol: "ZUZUZ",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "3",
        symbol: "ZUZUZ",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "3",
        symbol: "ZUZUZ",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    OpenedPosition(
        id: "3",
        symbol: "ZUZUZ",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
  ];

  List<ClosedPosition> closedPositionRows = [
    ClosedPosition(
        id: "2",
        symbol: "ZXV",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "4",
        symbol: "FDF",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "122",
        symbol: "UGD",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "3",
        symbol: "QSQS",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "3",
        symbol: "ASAS",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "3",
        symbol: "GKGK",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "3",
        symbol: "ODOG",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
    ClosedPosition(
        id: "3",
        symbol: "ISISI",
        type: "QU",
        size: "120",
        openRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        closeRate: "300"),
  ];

  List<PendingOrder> pendingOrdersRows = [
    PendingOrder(
        id: "2",
        symbol: "KIKI",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "4",
        symbol: "ZZZZ",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "122",
        symbol: "XXX",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "3",
        symbol: "GFHSG",
        type: "SDH",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "3",
        symbol: "DUJG",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "3",
        symbol: "KT",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "3",
        symbol: "QWGRTK",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
    PendingOrder(
        id: "3",
        symbol: "KJYT",
        type: "QU",
        size: "120",
        atTheRate: "300",
        openTime: "740",
        stopLoss: "10",
        takeProfit: "1200",
        profit: "1705",
        swap: "1200",
        contract: "200",
        currentRate: "300"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _drawer(),
        appBar: _appBar(),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(children: <Widget>[
            _body(),
          ]),
        ));
  }

  Widget _appBar() {
    return AppBar(
      // title: FlatButton(
      //     onPressed: () {
      //       // TODO implement callback
      //       print("press logo");
      //     },
      //     child: Image.asset('images/logo.png',
      //         height: 30.0, fit: BoxFit.scaleDown)),
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
              showDialogModal(menuOption);
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
                showDialogModal("Deposit");
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
                showDialogModal("TechSupport");
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLoginPage()),
                );
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
              Expanded(child: _search())
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
                      child: Text("Favorites",
                          style: TextStyle(color: Colors.white))),
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
    const darkPurple = Color.fromRGBO(33, 31, 46, 1);
    return Container(
      // height: MediaQuery.of(context).size.height,
      color: Colors.grey[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _cityList(),
          _graphicList(),
          _info(),
          _chart(),
          _positionsAndOrders(),
          _searchAndSwitch(),
          _currentTable(),
          _footer()
        ],
      ),
    );
  }

  Widget _cityList() {
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
        ));
  }

  Widget _graphicList() {
    const darkPurple = Color.fromRGBO(33, 31, 46, 1);
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
        ));
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

  Widget _graphicTypes() {
    List<Widget> types = graphicTypes.map((GraphicType type) {
      return Container(
        color:
            type.name == pickedType.name ? Colors.green : Colors.blueGrey[600],
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
            }),
      );
    }).toList();
    return Container(
      child: Row(
        children: types,
      ),
    );
  }

  Widget _timeBoundaries() {
    List<String> timeBoundaries = [
      '1m',
      '5m',
      '15m',
      '30m',
      '1h',
      '1d',
      '5d',
      '1M',
      '3M',
      '6M',
      '1Y'
    ];
    var boundaries = timeBoundaries.map((String boundary) {
      return Container(
        color: boundary == pickedTimeBoundary
            ? Colors.green
            : Colors.blueGrey[600],
        width: 25,
        // padding: EdgeInsets.all(4.0),
        child: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              boundary,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            onPressed: () {
              // TODO press change graphic type
              print(boundary);
              setState(() {
                pickedTimeBoundary = boundary;
              });
            }),
      );
    }).toList();
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 0.5, color: Colors.white)),
      ),
      child: Row(
        children: boundaries,
      ),
    );
  }

  Widget _graphicDropdown() {
    return Container(
      margin: EdgeInsets.only(left: 4.0),
      child: PopupMenuButton<String>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.multiline_chart,
              color: Colors.white,
              size: 18,
            ),
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
                  Text(
                    option.name,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Switch(
                      value: option.isOn,
                      onChanged: (bool newIsOn) {
                        // TODO implement callback
                        print("press switch");
                      })
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
                child: Text(
                  "Delete All",
                  style: TextStyle(color: Colors.white),
                )),
          );
          listWithButton.addAll(filters);
          listWithButton.add(button);
          return listWithButton;
        },
      ),
    );
  }

  Widget _info() {
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
            child: Text(
              dateString,
              style: TextStyle(color: Colors.green, fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Text(
              timeZone,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: Text(
              pickedPairSymbol,
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  Widget _chart() {
    List sampleData = [
      {
        "open": 50.0,
        "high": 100.0,
        "low": 40.0,
        "close": 80,
        "volumeto": 5000.0
      },
      {
        "open": 80.0,
        "high": 90.0,
        "low": 55.0,
        "close": 65,
        "volumeto": 4000.0
      },
      {
        "open": 65.0,
        "high": 120.0,
        "low": 60.0,
        "close": 90,
        "volumeto": 7000.0
      },
      {
        "open": 90.0,
        "high": 95.0,
        "low": 85.0,
        "close": 80,
        "volumeto": 2000.0
      },
      {
        "open": 80.0,
        "high": 85.0,
        "low": 40.0,
        "close": 50,
        "volumeto": 3000.0
      },
    ];
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      // margin: EdgeInsets.only(top : 4.0),
      color: Colors.grey[900],
      height: windowHeight * 0.44,
      child: OHLCVGraph(
          data: sampleData,
          enableGridLines: true,
          volumeProp: 0.2,
          gridLineAmount: 5,
          gridLineColor: Colors.grey[300],
          gridLineLabelColor: Colors.grey),
    );
  }

  Widget _positionsAndOrders() {
    List<String> options = [
      'Opened positions',
      'Closed positions',
      'Pending orders'
    ];
    return Container(
      height: 25,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 0.5)),
        color: Colors.grey[800],
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
    return options.map((String option) {
      return Container(
          color: pickedPositionAndOrderMode == option
              ? Colors.grey[500]
              : Colors.transparent,
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
              child: Text(
                option,
                style: TextStyle(color: Colors.grey[200], fontSize: 8),
              )));
    }).toList();
  }

  Widget _orderCreation() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300])),
            child: Text(
              pickedPairSymbol,
              style: TextStyle(color: Colors.grey[300], fontSize: 10),
            ),
          ),
          Container(
            height: 16,
            margin: EdgeInsets.only(left: 2.0, right: 2.0),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  //TODO implement callback
                  print("press Create order");
                  // showDialogModal("CreateOrder");
                },
                child: Text(
                  "Create order",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )),
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
              child: _search()),
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
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
      ),
    );
  }

  Widget _switch() {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            "Demo",
            style: TextStyle(
                color: isReal ? Colors.white : Colors.yellow, fontSize: 10),
          ),
          Container(
            child: Checkbox(
                value: isReal,
                onChanged: (bool newIsReal) {
                  print(isReal.toString());
                  setState(() {
                    isReal = !isReal;
                  });
                }),
          ),
          Text(
            "Real",
            style: TextStyle(
                color: isReal ? Colors.yellow : Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _currentTable() {
    return Container(
      height: 136.5,
      child: pickedPositionAndOrderMode == "Opened positions"
          ? BidirectionalScrollViewPlugin(
              scrollOverflow: Overflow.clip,
              child: _openedTableRows(),
            )
          : pickedPositionAndOrderMode == "Closed positions"
              ? Container(
                  child: BidirectionalScrollViewPlugin(
                    scrollOverflow: Overflow.clip,
                    child: _closedTableRows(),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.zero,
                  child: BidirectionalScrollViewPlugin(
                    scrollOverflow: Overflow.clip,
                    child: _pendingTableRows(),
                  ),
                ),
    );
  }

  Widget _openedTableRows() {
    return Container(
      child: Column(
        children: <Widget>[
          _openedPositionInitRow(),
          _openedPositionTableRows()
        ],
      ),
    );
  }

  Widget _closedTableRows() {
    return Container(
      child: Column(
        children: <Widget>[
          _closedPositionInitRow(),
          _closedPositionTableRows()
        ],
      ),
    );
  }

  Widget _pendingTableRows() {
    return Container(
      child: Column(
        children: <Widget>[_pendingOrderInitRow(), _pendingPositionTableRows()],
      ),
    );
  }

  Widget _openedPositionInitRow() {
    List<String> initRowCells = [
      'ID',
      'Symbol',
      'Type',
      'Size',
      'Open rate',
      'Open time',
      'Stop loss',
      'Take profit',
      'Profit',
      'Swap',
      'Contract',
      'Current rate',
      'Actions'
    ];
    List<Widget> cells = initRowCells.map((String name) {
      return _initRowCell(name);
    }).toList();
    return Container(
        color: Colors.grey[700],
        child: Row(
          children: cells,
        ));
  }

  Widget _closedPositionInitRow() {
    List<String> initRowCells = [
      'ID',
      'Symbol',
      'Type',
      'Size',
      'Open rate',
      'Open time',
      'Stop loss',
      'Take profit',
      'Profit',
      'Swap',
      'Contract',
      'Closed rate',
    ];
    List<Widget> cells = initRowCells.map((String name) {
      return _initRowCell(name);
    }).toList();
    return Container(
        color: Colors.grey[700],
        child: Row(
          children: cells,
        ));
  }

  Widget _pendingOrderInitRow() {
    List<String> initRowCells = [
      'ID',
      'Symbol',
      'Type',
      'Size',
      'At the rate',
      'Open time',
      'Stop loss',
      'Take profit',
      'Profit',
      'Swap',
      'Contract',
      'Current rate',
      "Actions"
    ];
    List<Widget> cells = initRowCells.map((String name) {
      return _initRowCell(name);
    }).toList();
    return Container(
        color: Colors.grey[700],
        child: Row(
          children: cells,
        ));
  }

  Widget _initRowCell(String name) {
    return Container(
        width: 70,
        height: 20,
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black, width: 0.5))),
        padding: EdgeInsets.all(4.0),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ));
  }

  Widget _openedPositionTableRows() {
    List<Widget> rows = openedPositionRows.map((OpenedPosition position) {
      return Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _orderTableCell(position.id),
            _orderTableCell(position.symbol),
            _orderTableCell(position.type),
            _orderTableCell(position.size),
            _orderTableCell(position.openRate),
            _orderTableCell(position.openTime),
            _orderTableCell(position.stopLoss),
            _orderTableCell(position.takeProfit),
            _orderTableCell(position.profit),
            _orderTableCell(position.swap),
            _orderTableCell(position.contract),
            _orderTableCell(position.currentRate),
            _actions()
          ],
        ),
      );
    }).toList();
    return Container(
      child: Column(
        children: rows,
      ),
    );
  }

  Widget _closedPositionTableRows() {
    List<Widget> rows = closedPositionRows.map((ClosedPosition position) {
      return Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _orderTableCell(position.id),
            _orderTableCell(position.symbol),
            _orderTableCell(position.type),
            _orderTableCell(position.size),
            _orderTableCell(position.openRate),
            _orderTableCell(position.openTime),
            _orderTableCell(position.stopLoss),
            _orderTableCell(position.takeProfit),
            _orderTableCell(position.profit),
            _orderTableCell(position.swap),
            _orderTableCell(position.contract),
            _orderTableCell(position.closeRate),
          ],
        ),
      );
    }).toList();
    return Container(
      child: Column(
        children: rows,
      ),
    );
  }

  Widget _pendingPositionTableRows() {
    List<Widget> rows = pendingOrdersRows.map((PendingOrder position) {
      return Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _orderTableCell(position.id),
            _orderTableCell(position.symbol),
            _orderTableCell(position.type),
            _orderTableCell(position.size),
            _orderTableCell(position.atTheRate),
            _orderTableCell(position.openTime),
            _orderTableCell(position.stopLoss),
            _orderTableCell(position.takeProfit),
            _orderTableCell(position.profit),
            _orderTableCell(position.swap),
            _orderTableCell(position.contract),
            _orderTableCell(position.currentRate),
            _actions()
          ],
        ),
      );
    }).toList();
    return Container(
      child: Column(
        children: rows,
      ),
    );
  }

  Widget _orderTableCell(String value) {
    return Container(
      width: 70,
      height: 30,
      padding: EdgeInsets.only(left: 4.0),
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }

  Widget _actions() {
    return Container(
      width: 70,
      child: Row(
        children: <Widget>[
          Container(
            width: 25,
            child: FlatButton(
              padding: EdgeInsets.zero,
              child: Text(
                "Edit",
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
              onPressed: () {
                // TODO implement callback
                print("press edit table item");
              },
            ),
          ),
          Container(
            width: 25,
            child: FlatButton(
              padding: EdgeInsets.zero,
              child: Text(
                "Delete",
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
              onPressed: () {
                // TODO implement callback
                print("press edit table item");
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _footer() {
    List<FooterData> footerData = [
      FooterData(name: "Balance", value: "12009"),
      FooterData(name: "Equity", value: "166"),
      FooterData(name: "Margin", value: "433"),
      FooterData(name: "Free margin", value: "511"),
    ];
    List<Widget> footer = footerData.map((FooterData data) {
      return Container(
        padding: EdgeInsets.all(4.0),
        child: Text(
          '${data.name}: ${data.value}',
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      );
    }).toList();
    return Container(
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: footer,
      ),
    );
  }

  void showDialogModal(String type) {
    print("press show $type dialog");
    Widget simpleDialog;
    if (type == "Deposit") {
      simpleDialog = DepositDialog();
    }
    if (type == "TechSupport") {
      simpleDialog = _techSupportDialog();
    }
    if (type == "Withdraw") {
      simpleDialog = _withdrawDialog();
    }
    if (type == "Finance") {
      simpleDialog = _financeDialog();
    }
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }
}

Dialog _financeDialog() {
  return Dialog(
    backgroundColor: Colors.blueGrey[700],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
        height: 250.0,
        width: 500.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: FlatButton(
                  child: Text("Pick date interval"),
                  onPressed: () {
                    // TODO implement callback
                    print("Finance pick date");
                    // showDatePicker(context: Bi, initialDate: null, firstDate: null, lastDate: null);
                  },
                ),
              ),
            ],
          ),
        )),
  );
}

Dialog _withdrawDialog() {
  return Dialog(
    backgroundColor: Colors.blueGrey[700],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
        height: 250.0,
        width: 450.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Withdraw",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Amount",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      suffixIcon: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 20,
                              height: 20,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.arrow_upward,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // TODO implement callback
                                  print("withdraw up");
                                },
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.arrow_downward,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // TODO implement callback
                                  print("withdraw down");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      // hintText: 'Please select merchant',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      )),
                ),
              ),
              Container(
                width: 170,
                height: 40,
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Text("Order withdrawal",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  onPressed: () {
                    // TODO implement callback
                    print("press send message to tech support");
                  },
                ),
              )
            ],
          ),
        )),
  );
}

class DepositDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DepositDialogState();
}

Dialog _techSupportDialog() {
  return Dialog(
    backgroundColor: Colors.blueGrey[700],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
        height: 250.0,
        width: 450.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: TextField(
                  maxLines: 3,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      // hintText: 'Please select merchant',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Text("Send",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  onPressed: () {
                    // TODO implement callback
                    print("press send message to tech support");
                  },
                ),
              )
            ],
          ),
        )),
  );
}

class DepositDialogState extends State<DepositDialog> {
  int moneyLeftForVip = 9600;
  String pickedAmount = "10,000";
  String _currentSelectedMerchant = null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: _depositDialogModal(),
    );
  }

  Dialog _depositDialogModal() {
    var _merchants = [
      "PayBoutique",
      "Accentpay",
      "ECommPay",
    ];
    return Dialog(
      backgroundColor: Colors.blueGrey[700],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          height: 500.0,
          width: 450.0,
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[_moneyValuesColumn()],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("Merchant", style: TextStyle(color: Colors.white)),
                        Container(
                          margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          width: 180,
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.white),
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 16.0),
                                    // hintText: 'Please select merchant',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                isEmpty: _currentSelectedMerchant == null,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.white,
                                    value: _currentSelectedMerchant,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _currentSelectedMerchant = newValue;
                                        state.didChange(newValue);
                                      });
                                    },
                                    items: _merchants.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          color: Colors.blueGrey[700],
                                          child: Text(value,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text("Amount", style: TextStyle(color: Colors.white)),
                        Container(
                          margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          width: 180,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            color: Colors.green,
                          ),
                          child: FlatButton(
                            child: Text("Proceed to payment",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              // TODO implement callback
                              print("press proceed to payment");
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _moneyValuesColumn() {
    Color paleOrange = Color.fromRGBO(203, 151, 112, 1);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(MaterialCommunityIcons.crown, size: 12, color: paleOrange),
                Text("Remaining for VIP: \$ $moneyLeftForVip",
                    style: TextStyle(color: paleOrange, fontSize: 10)),
              ],
            ),
          ),
          Text("Get VIP now", style: TextStyle(color: paleOrange, fontSize: 8)),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: _moneyAmountCheck(),
          )
        ],
      ),
    );
  }

  Widget _moneyAmountCheck() {
    List<String> moneyValues = [
      "10,000",
      "7,000",
      "5,000",
      "3,000",
      "2,500",
      "2,000",
      "1,500",
      "1,000",
      "700",
      "500"
    ];
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _singleAmountCheck(moneyValues[0]),
            _singleAmountCheck(moneyValues[1]),
          ],
        ),
        Row(
          children: <Widget>[
            _singleAmountCheck(moneyValues[2]),
            _singleAmountCheck(moneyValues[3]),
          ],
        ),
        Row(
          children: <Widget>[
            _singleAmountCheck(moneyValues[4]),
            _singleAmountCheck(moneyValues[5]),
          ],
        ),
        Row(
          children: <Widget>[
            _singleAmountCheck(moneyValues[6]),
            _singleAmountCheck(moneyValues[7]),
          ],
        ),
        Row(
          children: <Widget>[
            _singleAmountCheck(moneyValues[8]),
            _singleAmountCheck(moneyValues[9]),
          ],
        )
      ],
    ));
  }

  Widget _singleAmountCheck(String amount) {
    Color paleOrange = Color.fromRGBO(203, 151, 112, 1);
    return Container(
      height: 30,
      width: 80,
      margin: EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(
              width: 0.5,
              color: amount == pickedAmount ? paleOrange : Colors.grey[300])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 40,
              child: CircularCheckBox(
                inactiveColor: Colors.white,
                activeColor: paleOrange,
                onChanged: (bool newIsChecked) {
                  // TODO implement callback
                  print("money amount checkbox pressed");
                  setState(() {
                    pickedAmount = amount;
                  });
                },
                value: amount == pickedAmount,
              )),
          Container(
            margin: EdgeInsets.only(right: 2.5),
            child: Text('\$$amount',
                style: TextStyle(
                    fontSize: 10,
                    color: amount == pickedAmount
                        ? paleOrange
                        : Colors.grey[300])),
          )
        ],
      ),
    );
  }
}
