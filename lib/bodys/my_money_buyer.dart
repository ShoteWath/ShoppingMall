import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/bodys/approve.dart';
import 'package:shoppingmall/bodys/wait.dart';
import 'package:shoppingmall/bodys/wallet.dart';
import 'package:shoppingmall/models/wallet_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';

class MyMoneyBuyer extends StatefulWidget {
  const MyMoneyBuyer({Key? key}) : super(key: key);

  @override
  _MyMoneyBuyerState createState() => _MyMoneyBuyerState();
}

class _MyMoneyBuyerState extends State<MyMoneyBuyer> {
  int indexWidget = 0;
  var widgets = <Widget>[];

  var titles = <String>[
    'Wallet',
    'Approve',
    'Wait',
  ];

  var iconDatas = <IconData>[
    Icons.money,
    Icons.fact_check,
    Icons.hourglass_bottom
  ];

  var bottomNavigationBarItems = <BottomNavigationBarItem>[];
  int approvedWallet = 0, waitApprovedWallet = 0;
  bool load = true;

  var approveWalletModels = <WalletModel>[];
  var waitWalletModels = <WalletModel>[];

  @override
  void initState() {
    super.initState();
    readAllWallet();
    setUpBottomBar();
  }

  Future<void> readAllWallet() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var idBuyer = preferences.getString('id');
    print('idBuyer ==>>$idBuyer');
    var path =
        '${MyConstant.domain}/shoppingmall/getWalletWhereIdBuyer.php?isAdd=true&idBuyer=$idBuyer';
    await Dio().get(path).then((value) {
      print('value ==>>$value');

      for (var item in json.decode(value.data)) {
        WalletModel model = WalletModel.fromMap(item);
        switch (model.status) {
          case 'Approve':
            approvedWallet = approvedWallet + int.parse(model.money);
            approveWalletModels.add(model);
            break;
          case 'WaitOrder':
            waitApprovedWallet = waitApprovedWallet + int.parse(model.money);
            waitWalletModels.add(model);
            break;
          default:
        }
      }
      print(
          'approveWallet ==>> $approvedWallet,waitApproveWallet ==>> $waitApprovedWallet');
      widgets.add(Wallet(
        approveWallet: approvedWallet,
        waitApproveWallet: waitApprovedWallet,
      ));
      widgets.add(Approve(
        walletModels: approveWalletModels,
      ));
      widgets.add(Wait(
        walletModels: waitWalletModels,
      ));

      setState(() {
        load = false;
      });
    });
  }

  void setUpBottomBar() {
    int index = 0;
    for (var title in titles) {
      bottomNavigationBarItems.add(
        BottomNavigationBarItem(
          label: title,
          icon: Icon(
            iconDatas[index],
          ),
        ),
      );
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load ? ShowProgress() : widgets[indexWidget],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: MyConstant.light,
        selectedItemColor: MyConstant.dark,
        onTap: (value) {
          setState(() {
            indexWidget = value;
          });
        },
        currentIndex: indexWidget,
        items: bottomNavigationBarItems,
      ),
    );
  }
}
