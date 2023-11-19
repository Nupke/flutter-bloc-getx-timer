import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc_widget/block_timer_page.dart';
import 'package:flutter_application_1/src/getx_widget/getx_timer_page.dart';
import 'package:get/get.dart';
import 'stateful_widget/state_timer_page.dart';

const waitTime = 80;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int aa = 10;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timer Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 58, 183, 108)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Timer'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: constant_identifier_names
const List<BottomNavigationBarItem> NavigatorsItem = [
  BottomNavigationBarItem(
      icon: Icon(Icons.youtube_searched_for), label: 'Stateful'),
  BottomNavigationBarItem(icon: Icon(Icons.block), label: 'BLoC'),
  BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'GetX'),
];

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  late Widget _bodyWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onItemTepped(selectedIndex);
  }

  Widget _buildCurrentWidget(int type) {
    Widget? buildWidget;
    switch (type) {
      case 0:
        return const StateTimerPage(waitTimeInSec: waitTime);
      case 1:
        return const BLoCTimerPage(waitTimeInSec: waitTime);
      case 2:
        return GetXTimerPage(waitTimeInSec: waitTime);
      default:
        throw ArgumentError();
    }
  }

  // static List<Widget> listTimerWidget = <Widget>[
  //   const StateTimerPage(waitTimeInSec: waitTime),
  //   const BLoCTimerPage(waitTimeInSec: waitTime),
  //   GetXTimerPage(
  //     waitTimeInSec: waitTime,
  //   )
  // ];

  void onItemTepped(int index) {
    setState(() {
      selectedIndex = index;
      _bodyWidget = _buildCurrentWidget(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.green[100]!,
        ),
        body: _bodyWidget,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.red[800]!,
            onTap: onItemTepped,
            items: NavigatorsItem));
  }
}
