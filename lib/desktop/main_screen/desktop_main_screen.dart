import 'package:flutter/material.dart';
import 'package:ido_project/business_logic/business_logic.dart';
import 'package:ido_project/desktop/main_screen/left_panel.dart';
import 'package:ido_project/desktop/main_screen/right_panel.dart';
import 'package:provider/provider.dart';

class DesktopMainScreen extends StatelessWidget {
  const DesktopMainScreen({Key? key}) : super(key: key);

  static String route = 'Desktop Tasks Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<BusinessLogic>(context).selectedList),
      ),
      body: Row(
        children: [
          LeftPanel(),
          Expanded(
            child: RightPanel(),
          ),
        ],
      ),
    );
  }
}
