// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:omise_flutter/omise_flutter.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Credic extends StatefulWidget {
  const Credic({Key? key}) : super(key: key);

  @override
  _CredicState createState() => _CredicState();
}

class _CredicState extends State<Credic> {
  String? name,
      surname,
      idCard,
      expiryDateMouth,
      expiriDateYear,
      cvc,
      amount,
      expiryDateStr;
  MaskTextInputFormatter idCardMask =
      MaskTextInputFormatter(mask: '#### - #### - #### - ####');
  MaskTextInputFormatter expiryDateMask =
      MaskTextInputFormatter(mask: '## / ####');
  MaskTextInputFormatter cvcMask = MaskTextInputFormatter(mask: '###');

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Stack(
              children: [
                Column(
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
              ],
            ),
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
        onPressed: () {
          if (formkey.currentState!.validate()) {
            getTokenAndChargeOmise();
          }
        },
        child: Text('Add Money'),
      ),
    );
  }

  Future<void> getTokenAndChargeOmise() async {
    String publicKey = MyConstant.publicKey;

    print(
        ' name = $name,surname = $surname, publicKey =$publicKey,idCard ==>>$idCard,expiryDateStr ==>> $expiryDateStr,expiryDateMount ==>> $expiryDateMouth,expiryDateYear ==>> $expiriDateYear,cvc ==>>$cvc');

    OmiseFlutter omiseFlutter = OmiseFlutter(publicKey);
    await omiseFlutter.token
        .create('$name' '$surname', idCard!, expiryDateMouth!, expiriDateYear!,
            cvc!)
        .then((value) {
      String token = value.id.toString();
      print('token ==>>$token');
    });
  }

  Widget formAmount() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill Amount in Blank';
            } else {
              return null;
            }
          },
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Expiry Date in Blank';
          } else {
            if (expiryDateStr!.length != 6) {
              return 'กรุณา กรอกให้ครบ';
            } else {
              expiryDateMouth = expiryDateStr!.substring(0, 2);
              expiriDateYear = expiryDateStr!.substring(2, 6);

              int expiryDateMouthInt = int.parse(expiryDateMouth!);
              expiryDateMouth = expiryDateMouthInt.toString();

              if (expiryDateMouthInt > 12) {
                return 'กรอกเดือนผิดค่ะ';
              } else {
                return null;
              }
            }
          }
        },
        onChanged: (value) {
          expiryDateStr = expiryDateMask.getUnmaskedText();
        },
        inputFormatters: [expiryDateMask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'xx/xxxx',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );

  Widget formCVC() => TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill CVC in Blank';
          } else {
            if (cvc!.length != 3) {
              return 'CVC ต้องมี 3 ตัว';
            } else {
              return null;
            }
          }
        },
        onChanged: (value) {
          cvc = cvcMask.getUnmaskedText();
        },
        inputFormatters: [cvcMask],
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
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill ID Card in Blank';
            } else {
              if (idCard!.length != 16) {
                return 'ID Card จะต้องมี 16 ตัวอักษร ค่ะ';
              } else {
                return null;
              }
            }
          },
          inputFormatters: [idCardMask],
          onChanged: (value) {
            // idCard = value.trim();
            idCard = idCardMask.getUnmaskedText();
          },
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
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill Name in Blank';
            } else {
              name = value.trim();
              return null;
            }
          },
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
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Fill Surname in Blank';
            } else {
              surname = value.trim();
              return null;
            }
          },
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
