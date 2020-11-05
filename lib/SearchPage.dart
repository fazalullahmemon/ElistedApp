import 'package:flutter/material.dart';

class ServiceSearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        // color: Colors.green,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  final List searchQueries = [
    "IT Repair",
    "Gardeners",
    "Electronic Repair",
    "General Maintainence",
    "Personal Services",
    "IT Repair",
    "Gardeners",
    "Electronic Repair",
    "General Maintainence",
    "Personal Services",
    "Vehicle Services"
  ];
  final List recentSearchQueries = [
    "General Maintainence",
    "Personal Services",
    "Vehicle Services"
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    final displayList = query.isEmpty
        ? recentSearchQueries
        : searchQueries.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.near_me),
          title: RichText(
              text: TextSpan(
                  text: displayList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: displayList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ]))),
    );
  }
}
