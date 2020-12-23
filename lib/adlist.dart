import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'DetailListView.dart';
import 'filterPage.dart';
import 'gridView.dart';
import 'briefListView.dart';

class ServicesAdList extends StatefulWidget {
  final String categoryName;
  final String subCategoryName;
  ServicesAdList(this.categoryName, this.subCategoryName);

  get allServicesList => null;
  @override
  _ServicesAdListState createState() => _ServicesAdListState();

  fetchData(String categoryName, String subCategoryName,
      {bool isAdPromoted,
      int price,
      bool containPhotos,
      String offerType,
      String adLanguage}) {}
}

class _ServicesAdListState extends State<ServicesAdList> {
  int _selectedLayout = 0;
  // among 3 layouts, 0 indicates detail list view , 1 indicates grid view and 2 indicates brief list view
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(),
          body: _selectedLayout == 0
              ? DetailListViewLayout(
                  widget.categoryName, widget.subCategoryName)
              : (_selectedLayout == 1
                  ? gridViewLayout(widget.categoryName, widget.subCategoryName)
                  : BriefListLayoutView(
                      widget.categoryName, widget.subCategoryName))),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(124.2),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 42.5,
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: Text(
                    '24, 465 Results',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF6D6E70)),
                  ),
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF6D6E70),
                      ),
                      onPressed: () => Navigator.pop(context)),
                ),
              ),
              Container(
                height: 0.1,
                color: Color(0xFF6D6E70),
              ),
              Container(
                alignment: Alignment.center,
                height: 48,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServiceFilterDesign())),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF1877F2),
                                borderRadius: BorderRadius.circular(4.0)),
                            height: 24.0,
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/filter.svg'),
                                SizedBox(width: 5.61),
                                Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Roboto'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: 11,
                            child: VerticalDivider(
                              thickness: 2,
                              color: Color(0xFFC4C4C4),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              // color: Color(0xFF1877F2),
                              borderRadius: BorderRadius.circular(4.0)),
                          height: 24.0,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/saved.svg'),
                              SizedBox(width: 5.61),
                              Text(
                                'Save search',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Roboto'),
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: 11,
                            child: VerticalDivider(
                              thickness: 2,
                              color: Color(0xFFC4C4C4),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              // color: Color(0xFF1877F2),
                              borderRadius: BorderRadius.circular(4.0)),
                          height: 24.0,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/sortBy.svg'),
                              SizedBox(width: 5.61),
                              Text(
                                'Sort',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Roboto'),
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: 11,
                            child: VerticalDivider(
                              thickness: 2,
                              color: Color(0xFFC4C4C4),
                            )),
                        Container(
                            height: 24.0,
                            child: _selectedLayout == 0
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedLayout = 1;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/fourDotIcon.svg',
                                      width: 16,
                                      height: 18,
                                    ),
                                  )
                                : (_selectedLayout == 1
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedLayout = 2;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          'assets/bigViewChange.svg',
                                          width: 16.85,
                                          height: 18,
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedLayout = 0;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                          'assets/hamburgerMenuIcon.svg',
                                          width: 17.85,
                                          height: 13.22,
                                        ),
                                      ))),
                      ],
                    )),
              ),
              Container(
                height: 5,
                color: Color(0xFFECECEC),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'All in Services',
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF1B1C1E)),
                      ),
                      SizedBox(width: 9),
                      SvgPicture.asset('assets/arrowRightIcon.svg'),
                      SizedBox(width: 9),
                      Text(
                        widget.categoryName,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF1B1C1E)),
                      ),
                      SizedBox(width: 9),
                      SvgPicture.asset('assets/arrowRightIcon.svg'),
                      SizedBox(width: 9),
                      Text(
                        widget.subCategoryName,
                        style:
                            TextStyle(fontSize: 10, color: Color(0xFF1B1C1E)),
                      ),
                    ],
                  )),
              SizedBox(
                height: 6.5,
              ),
              Container(
                color: Color(0xFF6D6E70),
                height: 0.1,
              ),
            ],
          ),
        ));
  }
}
