
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Job.dart';
import 'adlist.dart';
import 'filterOptionSelector.dart';

class ServiceFilterDesign extends StatefulWidget {
  @override
  _ServiceFilterDesignState createState() => _ServiceFilterDesignState();
}

class _ServiceFilterDesignState extends State<ServiceFilterDesign> {
  List<String> _allLocationsList = [
    'Dubai',
    'UAE',
    'America',
    'Japan',
    'Korea',
    'New Zealand'
  ];

  List<String> _allSearchInList = ['Motors', 'Services', 'Jobs'];

  List<String> _allCategoryList = [];

  List<String> _allSubCategoryList = [];

  List<String> _allLangaugeAvailable = ['English', 'Arabic'];

  List<String> _allOfferType = ['Want', 'Any'];

  String _location = 'Dubai';
  String _searchIn = 'Services';
  String _category = 'Wedding';
  String _subCategory = 'Florists';
  double _price = 20000;
  String _adLanguage = 'English';
  String _offerType = 'Any';
  bool _showPhotosOnlyAd = true;
  bool _showPromotedAdOnly = true;

  bool _loadNewData = true;

  ServicesAdList _list = Get.find();

  @override
  Widget build(BuildContext context) {
    _loadNewData == true
        ? _list.fetchData(_category, _subCategory,
        isAdPromoted: _showPromotedAdOnly,
        price: _price.toInt(),
        containPhotos: _showPhotosOnlyAd,
        offerType: _offerType,
        adLanguage: _adLanguage)
        : null;
    _loadNewData = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Filters",
          style: TextStyle(
              fontSize: 28.0, fontFamily: 'Roboto', color: Color(0xFF1877F2)),
        ),
        leading: Container(
          width: 8.25,
          height: 14.44,
          margin: EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Reset",
                style: TextStyle(
                    color: Colors.black, fontSize: 16.0, fontFamily: 'Roboto'),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Location', _location, _allLocationsList)));
                if (result != null) {
                  setState(() {
                    _location = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(_location,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0)),
                          ),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Search In', _searchIn, _allSearchInList)));
                if (result != null) {
                  setState(() {
                    _searchIn = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search In",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(_searchIn,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0)),
                          ),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                _allCategoryList = [];
                jobList.forEach((element) {
                  _allCategoryList.add(element['category']);
                });
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Category', _category, _allCategoryList)));
                if (result != null) {
                  setState(() {
                    _category = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Text(
                          "Category",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Text(_category,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 16.0)),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                _allSubCategoryList = [];
                jobList.forEach((element) {
                  if (element['category'] == _category) {
                    _allSubCategoryList.addAll(element['subcategory']);
                  }
                });
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Sub Category',
                            _subCategory,
                            _allSubCategoryList)));
                if (result != null) {
                  setState(() {
                    _subCategory = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Category",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(_subCategory,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 16.0)),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Price(AED)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                )),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 155.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        border:
                        Border.all(width: 0.5, color: Color(0xFF707070))),
                    child: Text(
                      "0",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF1877F2),
                          fontSize: 16.0),
                    ),
                  ),
                  Container(
                    width: 155.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        border:
                        Border.all(width: 0.5, color: Color(0xFF707070))),
                    child: Text(
                      _price.truncateToDouble().toString(),
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF1877F2),
                          fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
              ),
              child: Slider(
                min: 0,
                max: 50000.0,
                value: _price,
                onChanged: (value) {
                  setState(() {
                    _price = value;
                    _loadNewData = true;
                  });
                },
              ),
            ),
            SizedBox(height: 23.0),
            Container(
              height: 0.3,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              color: Color(0xFF6D6E70),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Ad Language',
                            _adLanguage,
                            _allLangaugeAvailable)));
                if (result != null) {
                  setState(() {
                    _adLanguage = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ad Langauge",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(_adLanguage,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0)),
                          ),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterOptionsSelector(
                            'Offer Type', _offerType, _allOfferType)));
                if (result != null) {
                  setState(() {
                    _offerType = result;
                    _loadNewData = true;
                  });
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offer Type",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          FittedBox(
                            child: Text(_offerType,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 16.0)),
                          ),
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ads posted",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 28.0),
                          Container(
                            width: 6.58,
                            height: 11.52,
                            child: SvgPicture.asset('assets/arrowForward.svg'),
                          )
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showPhotosOnlyAd = !_showPhotosOnlyAd;
                  _loadNewData = true;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show ads with photos only",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      _showPhotosOnlyAd == true
                          ? Container(
                          width: 16.0,
                          height: 16.0,
                          child: SvgPicture.asset('assets/checkBox.svg'))
                          : Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: Color(0xFF6D6E70), width: 1.5)),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showPromotedAdOnly = !_showPromotedAdOnly;
                  _loadNewData = true;
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 51.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Show promoted ads only",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      _showPromotedAdOnly == true
                          ? Container(
                          width: 16.0,
                          height: 16.0,
                          child: SvgPicture.asset('assets/checkBox.svg'))
                          : Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: Color(0xFF6D6E70), width: 1.5)),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 23.0),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Keyword",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              height: 51.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 0.5, color: Color(0xFF6D6E70))),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle:
                    TextStyle(fontSize: 16.0, color: Color(0xFF6D6E70)),
                    hintText: "Search Keywords"),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            SizedBox(height: 60.0)
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: Colors.transparent.withAlpha(0),
        onClosing: () {},
        builder: (context) {
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 4.0),
              height: 51.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF1877F2)),
              child: Obx(() {
                return Text(
                  "Show " +
                      _list.allServicesList.length.toString() +
                      " Results",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
