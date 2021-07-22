import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ShowSign0ut extends StatelessWidget {
  const ShowSign0ut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then(
                  (value) => Navigator.pushNamedAndRemoveUntil(
                      context, MyConstant.routeAuthen, (route) => false),
                );
          },
          tileColor: Colors.red.shade900,
          leading: Icon(
            Icons.exit_to_app,
            size: 36,
            color: Colors.white,
          ),
          title: ShowTitle(
            title: 'SignOut',
            textStyle: MyConstant().h2whiteStyle(),
          ),
          subtitle: ShowTitle(
            title: 'SignOut And Go to Authen',
            textStyle: MyConstant().h3whiteStyle(),
          ),
        ),
      ],
    );
  }
}
