import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/utility/my_dialog.dart';
import 'package:shoppingmall/widgets/nev_confirm_add_wallet.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class Prompay extends StatefulWidget {
  const Prompay({Key? key}) : super(key: key);

  @override
  _PrompayState createState() => _PrompayState();
}

class _PrompayState extends State<Prompay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTitle(),
            buildCopyPrompay(),
            buildQRcodePrompay(),
            buildDownload()
          ],
        ),
      ),
      floatingActionButton: NavConfirmAddWallet(),
    );
  }

  ElevatedButton buildDownload() => ElevatedButton(
        onPressed: () async {
          String path = '/sdcard/download';
          try {
            await FileUtils.mkdir([path]);
            await Dio()
                .download(MyConstant.urlPrompay, '$path/prompay.png')
                .then((value) => MyDialog().normalDialog(
                    context,
                    'Download Prompay Finish',
                    'กรุณาไปที่แอพธนาคาร เพื่อนอ่าน QR code ที่โหลดมา'));
          } catch (e) {
            print('## error ==>>${e.toString()}');
            MyDialog().normalDialog(context, 'Storage Permission Denied',
                'กรุณาเปิด Permission Storage ด้วยค่ะ');
          }
        },
        child: Text('Download QRcode'),
      );

  Container buildQRcodePrompay() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: CachedNetworkImage(
        imageUrl: MyConstant.urlPrompay,
        placeholder: (context, url) => ShowProgress(),
      ),
    );
  }

  Widget buildCopyPrompay() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: Colors.lime.shade100,
        child: ListTile(
          title: ShowTitle(
            title: '0817004273',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(title: 'บัญชี Prompay'),
          trailing: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: '0817004273'));
                MyDialog().normalDialog(context, 'Copy Prompay',
                    'Copy Prompay to Clipboard สำเร็จแล้ว กรุณาไปที่แอพ ธนาคารของท่าน เพื่อโนเงินผ่าน Prompay ได้เลยค่ะ');
              },
              icon: Icon(
                Icons.copy,
                color: MyConstant.dark,
              )),
        ),
      ),
    );
  }

  ShowTitle buildTitle() {
    return ShowTitle(
      title: 'โอนเงินโดยการใช้ Prompay',
      textStyle: MyConstant().h2Style(),
    );
  }
}
