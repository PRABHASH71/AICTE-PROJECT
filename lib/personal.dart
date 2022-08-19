import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/approval.dart';

class personal extends StatefulWidget {
  const personal({Key? key}) : super(key: key);

  @override
  State<personal> createState() => _personalState();
}

class _personalState extends State<personal> {
  static final data1 =
      'The beginning of formal technical education in India can be dated back to the mid-19th century.\n Major policy initiatives in the pre-independence period included the appointment of the Indian Universities Commission in 1902, issue of the Indian Education Policy Resolution in 1904, and the Governor General’s policy statement of 1913 stressing the importance of technical education,\n The establishment of IISc in Bangalore, Institute for Sugar, Textile & Leather Technology in Kanpur, N.C.E. in Bengal in 1905, and industrial schools in several provinces.';

  static final data2 =
      'All India Council for Technical Education (AICTE) was set up in November 1945 as a national-level apex advisory body to conduct a survey on the facilities available for technical education and to promote development in the country in a coordinated and integrated manner.\nAnd to ensure the same, as stipulated in the National Policy of Education (1986), \nAICTE was vested with:\n • Statutory authority for planning, formulation, and maintenance of norms & standards \n• Quality assurance through accreditation \n • Funding in priority areas, monitoring, and evaluation \n • Maintaining parity of certification & awards \n • The management of technical education in the country 1943 Constitution of the Technical Education Committee of the Central Advisory Board of Education (CABE) 1944 Preparation of the Sergeant Report 1945 Formation of the All India Council for Technical Education (AICTE)';

  static final data =
      'The Government of India (the Ministry of Human Resource Development) also constituted a National Working Group to look into the role of AICTE in the context of proliferation of technical institutions, maintenance of standards, and other related matters. The Working Group recommended that AICTE be vested with the necessary statutory authority for making it more effective, which would consequently require restructuring and strengthening with the necessary infrastructure and operating mechanisms.';

  static final data3 =
      '(No 52 of 1987 as passed by both the Houses of Parliament) The AICTE Act was constituted to provide for the establishment of an All India Council for Technical Education with a view to proper planning and co-ordinated development of a technical education system throughout the country, the promotion of qualitative improvements of such education in relation to planned quantitative growth, and regulation & proper maintenance of norms and standards in the technical education system and for the matters connected therewith.\n Download the Act The purview of AICTE (the Council) covers programmes of technical education including training and research in Engineering, Technology, Architecture, Town Planning, Management, Pharmacy, Applied Arts and Crafts, Hotel Management and Catering Technology etc. at different levels.';
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 63, 5, 97),
            title: Text(
              "ABOUT",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            elevation: 4.0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => approval()));
                  },
                  icon: Icon(Icons.account_balance))
            ],
          ),
          body: Container(
            child: Center(
              child: ListView(
                children: [
                  buildCard(
                    'AICTE-HISTORY',
                  ),
                  buildCard1(
                    'Initial Set-up',
                  ),
                  buildCard2(
                    'Role of National Working Group',
                  ),
                  buildCard3(
                    'The All India Council For Technical Education Act 1987',
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient:
                    const LinearGradient(colors: [Colors.red, Colors.yellow])),
          ),
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
                colors: [Colors.red, Colors.yellow],
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
                    fontSize: 34,
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
                maxLines: 9,
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
                colors: [Colors.red, Colors.yellow],
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
                maxLines: 6,
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

  Widget buildCard2(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Column(
            children: [
              Stack(
                children: [
                  Ink.image(
                    image: AssetImage('assets/jk.png'),
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.yellow],
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
                    data,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    softWrap: true,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Text(
                    List.generate(1, (_) => data).join('\n\n'),
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
            ],
          ),
        ),
      );

  Widget buildCard3(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.yellow],
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
            ],
          ),
        ),
      );
}
