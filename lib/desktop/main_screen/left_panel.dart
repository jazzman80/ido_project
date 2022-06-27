import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ido_project/business_logic/business_logic.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessLogic>(builder: (context, businessLogic, child) {
      return Container(
        width: 200.0,
        child: Expanded(
          child: ListView(
            children: [
              MenuItem(
                businessLogic: businessLogic,
                itemName: 'Task List',
              ),
              MenuItem(
                businessLogic: businessLogic,
                itemName: 'Completed List',
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key, required this.businessLogic, required this.itemName})
      : super(key: key);

  final BusinessLogic businessLogic;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemName),
      onTap: () {
        businessLogic.selectList(itemName);
      },
      selected: itemName == businessLogic.selectedList,
    );
  }
}
