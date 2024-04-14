import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui/theme.dart';

class MyTabbedScreen extends StatefulWidget {
  const MyTabbedScreen({super.key});

  @override
  State<MyTabbedScreen> createState() => _MyTabbedScreenState();
}

class _MyTabbedScreenState extends State<MyTabbedScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Home'),
    const Tab(text: 'Profile'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  String getGreeting(int hour) {
    if (hour < 12) {
      return 'Morning';
    } else if (hour < 17) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    String greeting = getGreeting(currentTime.hour);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const Drawer(),
        backgroundColor: context.colorScheme.secondary,
        appBar: AppBar(
          backgroundColor: context.colorScheme.secondary,
          bottom: TabBar(
            labelStyle: context.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: context.colorScheme.primary, // Set the border color
                  width: 4.0, // Set the border width
                ),
              ),
            ),
            indicatorWeight: 5.0,
            labelColor: Colors.white,
            labelPadding: const EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            tabs: myTabs,
          ),
          title: Text(
            'Good $greeting',
            style: context.textTheme.displayMedium!
                .copyWith(color: context.colorScheme.onPrimary),
          ),
        ),
        body: const TabBarView(
          physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          dragStartBehavior: DragStartBehavior.start,
          children: [
            Center(
                child: Text(
              'This is Cake Tab',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'This is Radio Tab',
              style: TextStyle(fontSize: 32),
            )),
          ],
        ),
        floatingActionButton: Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                print('pressed');
              }, // You can use an Icon or Text here
              backgroundColor: Colors.transparent,
              child: const Icon(
                Icons.add,
                size: 1,
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Image.asset(
                'assets/images/lotus.png', // Replace with your image path
                width: 46, // Set the width of the image
                height: 46, // Set the height of the image
              ),
            ),
          ],
        ),
      ),
    );
  }
}
