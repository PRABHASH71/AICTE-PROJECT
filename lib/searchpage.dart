import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login/ApproveRequest/approvaladmin.dart';
import 'package:login/Fellowship.dart';
import 'package:login/email.dart';
import 'package:login/help.dart';
import 'package:login/index.dart';
import 'package:login/meet.dart';
import 'package:login/noti.dart';
import 'package:login/personal.dart';
import 'package:login/scheme.dart';
import 'package:login/search.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController q1;
  const SearchPage({Key? key, required this.q1}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  final controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.q1.text;
    super.initState();
  }

  List<search> search1 = allSearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefix: Icon(Icons.search),
                hintText: widget.q1.text,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: searchit,
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: search1.length,
            itemBuilder: (context, index) {
              final search2 = search1[index];
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(192, 241, 241, 241),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: ListTile(
                      title: Text(search2.title),
                      onTap: () {
                        if (search2.title == "About") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => personal()));
                        } else if (search2.title == "Fellowship") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => approval()));
                        } else if (search2.title == "Approval") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => appadmin()));
                        } else if (search2.title == "Help") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => help()));
                        } else if (search2.title == "Emaildesk") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => email()));
                        } else if (search2.title == "Meetings") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndexPage()));
                        } else if (search2.title == "Schemes") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => scheme()));
                        } else if (search2.title == "Events") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => notifi()));
                        }
                      }),
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  void searchit(String query) {
    final suggestions = allSearch.where((search2) {
      final Title = search2.title.toLowerCase();
      final input = query.toLowerCase();
      return Title.contains(input);
    }).toList();
    setState(() {
      search1 = suggestions;
    });
  }
}
