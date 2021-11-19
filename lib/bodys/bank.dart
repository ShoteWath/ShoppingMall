import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Bank extends StatefulWidget {
  const Bank({Key? key}) : super(key: key);

  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTitle(),
          buildBKKbank(),
          buildKbank(),
        ],
      ),
    );
  }

  Widget buildBKKbank() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      height: 150,
      child: Center(
        child: Card(
          color: Colors.indigo.shade100,
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/bbl.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารกรุงเทพ สาขาบิ๊กซี บางพลี',
              textStyle: MyConstant().h2Style(),
            ),
            subtitle: ShowTitle(
              title: 'ชื่อบัญชี นายโชติวัธ นาคะราเขต เลขบัญชี 124-0-02146-5',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ),
    );
  }

  Container buildKbank() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      height: 150,
      child: Center(
        child: Card(
          color: Colors.green[100],
          child: ListTile(
            leading: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/kbank.svg'),
              ),
            ),
            title: ShowTitle(
              title: 'ธนาคารกสิกรไทย สาขาบิ๊กซี บางพลี',
              textStyle: MyConstant().h2Style(),
            ),
            subtitle: ShowTitle(
              title: 'ชื่อบัญชี นายโชติวัธ นาคะราเขต เลขบัญชี 322-0-4149-3',
              textStyle: MyConstant().h3Style(),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShowTitle(
          title: 'การโอนเงิน เข้าบัญชีธนาคาร',
          textStyle: MyConstant().h1Style()),
    );
  }
}
