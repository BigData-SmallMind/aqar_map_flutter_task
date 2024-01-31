import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class TabContainerScreen extends StatefulWidget {
  const TabContainerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TabContainerScreen> createState() => _TabContainerScreenState();
}

class _TabContainerScreenState extends State<TabContainerScreen> {
  bool? shouldInvokeInitialNavSwitcher = true;

  @override
  Widget build(BuildContext context) {
    final TabPageState tabPageState = TabPage.of(context);

    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabPageState.controller,
        dragStartBehavior: DragStartBehavior.down,
        children: [
          for (final stack in tabPageState.stacks)
            PageStackNavigator(stack: stack)
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 0,
        child: TabBar(
          controller: tabPageState.controller,
          indicatorColor: Colors.transparent,
          tabs: const [
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
