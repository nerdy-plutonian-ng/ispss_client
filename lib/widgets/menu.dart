import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Widget getMenuItem(String title, Icon image) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(child: Center(
                child: image,
              )),
              Text(title),
            ],
          ),
        ),

      ),
      onTap: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3/2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    children: [
      getMenuItem('Add a member', Icon(Icons.person_add_rounded, color: Theme.of(context).accentColor,)),
      getMenuItem('Pay a member', Icon(Icons.payment,color: Theme.of(context).accentColor,)),
      getMenuItem('History', Icon(Icons.history,color: Theme.of(context).accentColor,)),
      getMenuItem('Favourites', Icon(Icons.favorite,color: Theme.of(context).accentColor,)),
      getMenuItem('Contribution', Icon(Icons.add_chart,color: Theme.of(context).accentColor,)),
    ],);
  }
}
