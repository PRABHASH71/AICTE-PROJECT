import 'dart:io';
import 'dart:math';

import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class scheme extends StatefulWidget {
  const scheme({Key? key}) : super(key: key);

  @override
  State<scheme> createState() => _schemeState();
}

class _schemeState extends State<scheme> {
  static final data1 =
      'Scheme to foster cross-border partnerships focussed on creating a platform that opens the path for collaborative research between Canada and India to a wider pool of student talent in India.';

  static final data4 =
      'AICTE has decided to establish AICTE-IDEA (Idea Development, Evaluation & Application) Lab in AICTE approved institutions, encouraging students for application of science, technologies, engineering and mathematics (STEM) fundamentals towards enhanced hands-on experience, learning by doing and product visualisation.';
  static final data2 =
      'AICTE has approved AICTE – SWANATH SCHOLARSHIP SCHEME for children from any one of the following categories:Orphan Either or both parents died due to Covid-19 Wards of Armed Forces and Central Paramilitary Forces martyred in action (Shaheed)to provide them financial support of Rs. 50,000/- per annum for every year of study.';

  static final data3 =
      'AICTE intends to seek applications for AICTEs LILAVATI AWARD-2021-22 based on the theme “Women Empowerment” from the eligible teams of AICTE approved institutions, who have undertaken remarkable intervention for the cause and made an impact that showcases their work under eight different sub-themes.';
  final mainReference = FirebaseDatabase.instance.ref().child('Database');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 80,
              backgroundColor: Color.fromARGB(255, 9, 8, 9),
              title: const Text(
                " SCHEMES",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            body: ListView(
              children: [
                buildCard(
                  'AICTE-MITACS GLOBALINK RESEARCH INTERNSHIP (GRI) SCHEME',
                ),
                buildCard1(
                  'AICTE – SWANATH SCHOLARSHIP SCHEME',
                ),
                buildCard3(
                  'AICTE LILAVATI AWARD',
                ),
                buildCard4(
                  'AICTE- IDEA LAB',
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 251, 250, 247),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 188, 234, 164),
                Color.fromARGB(255, 126, 221, 233)
              ])),
        ),
      ),
    );
  }

  Widget buildCard(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 169, 222, 136),
                  Color.fromARGB(255, 159, 240, 233)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data1,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data1).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard1(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 234, 164),
                  Color.fromARGB(255, 126, 221, 233),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data2,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data2).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard3(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 234, 164),
                  Color.fromARGB(255, 126, 221, 233)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data3,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data3).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard4(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 234, 164),
                  Color.fromARGB(255, 126, 221, 233)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data4,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data3).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );
}
