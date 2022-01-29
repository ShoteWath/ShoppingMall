import 'package:flutter/material.dart';
import 'package:shoppingmall/models/wallet_model.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Approve extends StatefulWidget {
  final List<WalletModel> walletModels;

  const Approve({Key? key, required this.walletModels}) : super(key: key);
  @override
  _ApproveState createState() => _ApproveState();
}

class _ApproveState extends State<Approve> {
  List<WalletModel>? approveWalletModels;

  @override
  void initState() {
    super.initState();
    approveWalletModels = widget.walletModels;
    print('approve list ==>>${approveWalletModels!.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowTitle(title: 'This is Approve'),
    );
  }
}
