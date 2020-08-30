import 'package:flutter/material.dart';
import 'package:mementor/generated/l10n.dart';
import 'package:mementor/interface/pages/debit_page.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;
  int index;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    index = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.mementor),
        bottom: TabBar(
          controller: tabController,
          onTap: (int newIndex) => setState(() => this.index = newIndex),
          tabs: [
            Tab(text: S.current.debit),
            Tab(text: S.current.credit),
          ],
        ),
      ),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        DebitPage(),
        Container(),
      ],
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: index == 0 ? Colors.red : Colors.green,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
