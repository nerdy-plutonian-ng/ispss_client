import 'package:flutter/material.dart';
import '../pages/add_member.dart';
import '../pages/pay_member.dart';
class MenuItem extends StatelessWidget {

  final int id;
  final String title;
  final Icon image;

  MenuItem(this.id, this.title, this.image);

  @override
  Widget build(BuildContext context) {
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
      onTap: (){
        switch(id){
          case 1 :
            Navigator.of(context).pushNamed(AddMember.routeName);
            break;
          case 2:
            Navigator.of(context).pushNamed(PayMember.routeName);
            break;
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
            break;
        }
      },
    );
  }
}
