import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';
import '../widgets/menu.dart';
import '../widgets/welcome.dart';
import '../widgets/menu_item.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _currentIndex = 0;

  List<Widget> menus = [];

  void getMenus() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getDouble(Constants.MMC) == 0){
      setState(() {
        menus = [
          MenuItem(1,'Add a member', Icon(Icons.person_add_rounded, color: Theme.of(context).accentColor,)),
          MenuItem(2,'Pay a member', Icon(Icons.payment,color: Theme.of(context).accentColor,)),
          MenuItem(3,'History', Icon(Icons.history,color: Theme.of(context).accentColor,)),
          MenuItem(4,'Favourites', Icon(Icons.favorite,color: Theme.of(context).accentColor,)),
        ];
      });
    } else if(prefs.getDouble(Constants.MMC) > 0){
      print('built');
      setState(() {
        menus = [
          MenuItem(1,'Add a member', Icon(Icons.person_add_rounded, color: Theme.of(context).accentColor,)),
          MenuItem(2,'Pay a member', Icon(Icons.payment,color: Theme.of(context).accentColor,)),
          MenuItem(3,'Contribution', Icon(Icons.add_chart,color: Theme.of(context).accentColor,)),
          MenuItem(4,'Savings Info', Icon(Icons.info,color: Theme.of(context).accentColor,)),
          MenuItem(5,'Schemes', Icon(Icons.description,color: Theme.of(context).accentColor,)),
          MenuItem(6,'Beneficiaries', Icon(Icons.people,color: Theme.of(context).accentColor,)),
          MenuItem(7,'Favourites', Icon(Icons.favorite,color: Theme.of(context).accentColor,)),
          MenuItem(8,'History', Icon(Icons.history,color: Theme.of(context).accentColor,)),
        ];
      });
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMenus();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Header',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Item 1'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Item 2'),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Item 3'),
                onTap: (){},
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Label',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Item A'),
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: Text(Constants.HOME),
            ),
            SliverList(delegate: SliverChildListDelegate([
              Welcome(),
            ])),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 3/2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: menus.toList(),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notifications',),
        ],
      ),
    );
  }
}
