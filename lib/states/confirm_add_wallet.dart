import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/widgets/show_image.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class ConfirmAddWallet extends StatefulWidget {
  const ConfirmAddWallet({Key? key}) : super(key: key);

  @override
  _ConfirmAddWalletState createState() => _ConfirmAddWalletState();
}

class _ConfirmAddWalletState extends State<ConfirmAddWallet> {
  String? dateTimeStr;
  File? file;
  var formKey = GlobalKey<FormState>();
  String? idBuyer;
  TextEditingController moneyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    findCerrentTime();
    findIdBuyer();
  }

  Future<void> findIdBuyer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    idBuyer = preferences.getString('id');
  }

  void findCerrentTime() {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    dateTimeStr = dateTime.toString();
    setState(() {
      dateTimeStr = dateFormat.format(dateTime);
    });
    print('dateTimeStr = $dateTimeStr');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Add Wallet'),
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.routeBuyerService, (route) => false),
          icon: Platform.isIOS
              ? Icon(Icons.arrow_back_ios)
              : Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        //SingleChildScrollView สำหรับ android version 27
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newHeader(),
                newDateTimePay(),
                // Spacer()สำหรับ android 10 - 11,
                newMoney(),
                // Spacer()สำหรับ android 10 - 11,
                newImage(),
                // Spacer()สำหรับ android 10 - 11,
                newButtonConfirm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row newMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: TextFormField(
              controller: moneyController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Fill Money ?';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                label: ShowTitle(title: 'Money'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container newButtonConfirm() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (file == null) {
                MyDialog().normalDialog(context, 'ยังไม่มีรูปภาพ',
                    'กรุณาถ่ายภาพ หรือ ใช้ภาพจากคลังภาพ');
              } else {
                processUploadAndInsertData();
              }
            }
          },
          child: Text('Confirm Add Wallet'),
        ),
      ),
    );
  }

  Future<void> processUploadAndInsertData() async {
    // Upload Image to Server
    String apiSaveSlip = '${MyConstant.domain}/shoppingmall/saveSlip.php';
    String nameSlip = 'slip${Random().nextInt(1000000)}.jpg';
    MyDialog().showProgressDialog(context);

    try {
      Map<String, dynamic> map = {};
      map['file'] =
          await MultipartFile.fromFile(file!.path, filename: nameSlip);
      FormData data = FormData.fromMap(map);
      await Dio().post(apiSaveSlip, data: data).then((value) async {
        print('value -->$value');
      });
      Navigator.pop(context);
      //  insert value to my SQL
      var pathSlip = '/slip/$nameSlip';
      var status = 'WaitOrder';
      var urlAPIinsert =
          '${MyConstant.domain}/shoppingmall/insertWallet.php?isAdd=true&idBuyer=$idBuyer&datePay=$dateTimeStr&money=${moneyController.text.trim()}&pathSlip=$pathSlip&status=$status';
      await Dio().get(urlAPIinsert).then(
            (value) => MyDialog(funcAction: success).actionDialog(
              context,
              'Confirm Success',
              'Confirm Add Monet to Wallet Success',
            ),
          );
    } catch (e) {}
  }

  void success() {
    Navigator.pushNamedAndRemoveUntil(
        context, MyConstant.routeBuyerService, (route) => false);
    print('Success Work');
  }

  Future<void> processTakePhoto(ImageSource source) async {
    try {
      var result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Row newImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: () => processTakePhoto(ImageSource.camera),
            icon: Icon(Icons.add_a_photo)),
        Container(
          width: 200,
          height: 200,
          child: file == null
              ? ShowImage(path: 'images/bill.png')
              : Image.file(file!),
        ),
        IconButton(
            onPressed: () => processTakePhoto(ImageSource.gallery),
            icon: Icon(Icons.add_photo_alternate)),
      ],
    );
  }

  ShowTitle newDateTimePay() {
    return ShowTitle(
      title: dateTimeStr == null ? 'dd/MM/yy HH:mm' : dateTimeStr!,
      textStyle: MyConstant().h2BlueStyle(),
    );
  }

  ShowTitle newHeader() {
    return ShowTitle(
        title: 'Current Date Pay', textStyle: MyConstant().h1Style());
  }
}
