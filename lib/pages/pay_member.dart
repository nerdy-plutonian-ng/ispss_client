import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PayMember extends StatefulWidget {

  static const routeName = '/payMember';

  @override
  _PayMemberState createState() => _PayMemberState();
}

class _PayMemberState extends State<PayMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(Constants.PAY_MEMBER),
            ),
            SliverList(delegate: SliverChildListDelegate([
              Padding(padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                  ],
                ),),
            ])),
          ],
        ),
      ),
    );
  }
}
