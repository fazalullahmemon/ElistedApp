import 'package:flutter/material.dart';
import 'package:movieuiapp/JobsCategory.dart';
import 'BottomBar.dart';

class Jobs  extends StatefulWidget {
  @override
  _JobsState  createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  List<String> jobsList = [
    "All in Jobs",
    "Jobs Available",
    "Jobs Wanted",


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DockerButton(),
      bottomNavigationBar: BottomNavBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 5.0),
                color: Color(0xFFECECEC),
                height: 5.0),
            serviceListViewBuilder(),
          ],
        ),
      ),
      // bottomNavigationBar: bottomNavBar(),
      /*   floatingActionButton: GestureDetector(
        child: Container(
          height: 50.0,
          width: 50.0,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Color(0xFF0037FF),
                elevation: 0.0,
                child: Icon(
                  Icons.add,
                  size: 35.0,
                ),
                onPressed: () {}),
          ),
        ),
      ),*/
      //   floatingActionButtonLocation:
      //       FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      titleSpacing: -11.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      // automaticallyImplyLeading: false,
      leading: IconButton(
        iconSize: 30,
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        onPressed: null,
      ),
      title: Container(
        margin: EdgeInsets.only(right: 28),
        //padding: EdgeInsets.only(right: 20.0),
        height: 36.0,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(18.0),
            ),
            fillColor: Color(0xFF767680).withOpacity(0.12),
            filled: true,
            contentPadding: EdgeInsets.zero,
            isDense: true,
            hintText: "Search in Jobs",
            hintStyle: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 16,
              color: const Color(0xff6d6e70),
              // letterSpacing: -0.528,
              height: 1.375,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.zero,
              child: Icon(Icons.search, size: 25.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceListViewBuilder() {
    return Expanded(
      child: NotificationListener<OverscrollIndicatorNotification>(
          // onNotification: (OverscrollIndicatorNotification overscroll) {
          //   overscroll.disallowGlow();
          //   return;
          // },
          child: Container(
        margin: EdgeInsets.fromLTRB(20, 29, 20, 0),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  height: 45.0,
                  thickness: 0.2,
                  color: Color(0xFF6D6E70),
                ),
            itemCount: jobsList.length,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap:(){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => JobsCategory()));
                },
                child: Container(
                  // padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                  child: Text(
                    jobsList[index],
                    style: index == 0
                        ? TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 16,
                            color: const Color(0xff1b1c1e),
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontFamily: 'Roboto-Regular',
                            fontSize: 16,
                            color: const Color(0xFF6D6E70),
                          ),
                  ),
                ),
              );
            }),
      )),
    );
  }

  Widget bottomNavBar() {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 5.0,
              height: 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/feed.png", width: 22.0),
                  SizedBox(height: 2.0),
                  Text("Feed", style: TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5.0,
              height: 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/saved.png", width: 16.0),
                  SizedBox(height: 2.0),
                  Text("Saved", style: TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5.0,
              height: 40.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Post your Ad", style: TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5.0,
              height: 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("assets/chats.png", width: 22.0),
                  SizedBox(height: 2.0),
                  Text("Chats", style: TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5.0,
              height: 40.0,
              child: Column(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 28.0,
                  ),
                  Text("Menu", style: TextStyle(fontSize: 10.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
