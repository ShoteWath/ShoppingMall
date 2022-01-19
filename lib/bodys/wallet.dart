import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Wallet extends StatefulWidget {
  final int approveWallet, waitApproveWallet;

  const Wallet(
      {Key? key, required this.approveWallet, required this.waitApproveWallet})
      : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int? approveWallet, awaiApproveWallet;

  @override
  void initState() {
    super.initState();
    this.approveWallet = widget.approveWallet;
    this.awaiApproveWallet = widget.waitApproveWallet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyConstant().planBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              newListTile(Icons.wallet_giftcard, 'จำนวนเงินที่ใช้ได้',
                  '$approveWallet thb'),
              newListTile(Icons.wallet_membership, 'จำนวนเงินที่รอตรวจสอบ',
                  '$awaiApproveWallet thb'),
              newListTile(Icons.grading_sharp, 'จำนวนเงินทั้งหมด',
                  '${approveWallet! + awaiApproveWallet!} thb'),
            ],
          ),
        ),
      ),
    );
  }

  Widget newListTile(IconData iconData, String title, String subTitle) {
    return Center(
      child: Container(
        width: 300,
        child: Card(
          color: MyConstant.primary.withOpacity(0.25),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ListTile(
              leading: Icon(
                iconData,
                size: 48,
              ),
              title: ShowTitle(
                title: title,
                textStyle: MyConstant().h2BlueStyle(),
              ),
              subtitle: ShowTitle(
                title: subTitle,
                textStyle: MyConstant().h1RedStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
