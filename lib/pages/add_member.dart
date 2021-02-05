import 'package:flutter/material.dart';
import '../sub_pages/next_of_kin.dart';
import '../sub_pages/scheme_info.dart';
import '../sub_pages/national_id.dart';
import '../sub_pages/personal_info.dart';
import '../utils/constants.dart';
import '../models/classes/panel.dart';
import '../sub_pages/funds_info.dart';

class AddMember extends StatefulWidget {

  static const routeName = '/addMember';

  @override
  _AddMemberState createState() => _AddMemberState();
}



class _AddMemberState extends State<AddMember> {

  List<Panel> panels = [
    Panel(1, 'Personal Info', true),
    Panel(2, 'National ID Info', false),
    Panel(3, 'Funds Info', false),
    Panel(4, 'Scheme Info', false),
    Panel(5, 'Next of Kin', false),
  ];

  Widget getSubPage(int subPageIndex){
    Widget subPage = Container();
    switch(subPageIndex){
      case 1:
        subPage = PersonalInfo();
        break;
      case 2:
        subPage = NationalId();
        break;
      case 3:
        subPage = FundsInfo();
        break;
      case 4:
        subPage = SchemeInfo();
        break;
      case 5:
        subPage = NextOfKin();
        break;
    }
    return subPage;
  }

  ExpansionPanel createPanel(Panel panel){
    return ExpansionPanel(headerBuilder: (BuildContext context, bool expanded){
      return ListTile(title: Text(panel.title),);
    }, body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: getSubPage(panel.id),
    ),
        isExpanded : panel.isExpanded);
  }

  Widget getPanels() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          panels[index].isExpanded = !isExpanded;
        });
      },
      children: panels.map<ExpansionPanel>((panel) => createPanel(panel)).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(Constants.ADD_MEMBER),
              actions: [
                IconButton(icon: Icon(Icons.save, color: Colors.lightGreen,), onPressed: (){}),
              ],
            ),
            SliverList(delegate: SliverChildListDelegate([
              Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: getPanels(),),
            ])),
          ],
        ),
      ),
    );
  }
}
