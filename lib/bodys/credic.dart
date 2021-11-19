import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Credic extends StatefulWidget {
  const Credic({Key? key}) : super(key: key);

  @override
  _CredicState createState() => _CredicState();
}

class _CredicState extends State<Credic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle('Name Surname'),
              buildNameSurname(),
              buildTitle('ID Card'),
              formIDcard(),
              buildExpiryCvc(),
              buildTitle('Amount :'),
              formAmount(),
              // Spacer(),
              buttonAddMoney(),
            ],
          ),
        ),
      ),
    );
  }

  Container buttonAddMoney() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Add Money'),
      ),
    );
  }

  Widget formAmount() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffix: ShowTitle(
              title: 'THB.',
              textStyle: MyConstant().h2RedStyle(),
            ),
            label: ShowTitle(title: 'Amount :'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );

  Container buildExpiryCvc() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          buildSizebox(30),
          Expanded(
            child: Column(
              children: [
                buildTitle('Expiry Date'),
                formExpiryData(),
              ],
            ),
          ),
          buildSizebox(8),
          Expanded(
            child: Column(
              children: [
                buildTitle('CVC :'),
                formCVC(),
              ],
            ),
          ),
          buildSizebox(30),
        ],
      ),
    );
  }

  Widget formExpiryData() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'xx/xxxx',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  Widget formCVC() => TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'xxx',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  Container buildNameSurname() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          buildSizebox(30),
          formName(),
          buildSizebox(8),
          formSurName(),
          buildSizebox(30),
        ],
      ),
    );
  }

  SizedBox buildSizebox(double width) => SizedBox(
        width: width,
      );

  Widget formIDcard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'xxxx-xxxx-xxxx-xxxx',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );

  Widget formName() => Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            label: ShowTitle(title: 'Name :'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
  Widget formSurName() => Expanded(
        child: TextFormField(
          decoration: InputDecoration(
            label: ShowTitle(title: 'Surname :'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );

  Widget buildTitle(String title) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ShowTitle(
          title: title,
          textStyle: MyConstant().h2Style(),
        ),
      );
}
