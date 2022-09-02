import 'package:checktemp_v1/calendarData.dart';
import 'package:checktemp_v1/pages/newLocation.dart';
import 'package:checktemp_v1/pages/settings.dart';
import 'package:checktemp_v1/pages/uvIndex.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  
  String place = "city=Safi,MA";
  int initialIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.deepPurple,
        child: TabBar( 
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 0.1,
        controller: tabController,
        onTap: (index){
           initialIndex = index;
        },
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.calendar_today,),
           
          ),
          Tab(
            icon: Icon(Icons.location_city),
          ),
          Tab(
            icon: Icon(Icons.flag),
          ),
           Tab(
            icon: Icon(Icons.settings),
          ),
       
        ],
      ),
      ),

      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Calendar(place: place),
          NewLocation(),
          UvIndex(),
          Settings(),
        ],
      ),
    );
  }

 
}
