import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppingmall/models/product_model.dart';
import 'package:shoppingmall/utility/my_constant.dart';
import 'package:shoppingmall/widgets/show_progress.dart';
import 'package:shoppingmall/widgets/show_title.dart';

class EditProduct extends StatefulWidget {
  final ProductModel productModel;
  const EditProduct({Key? key, required this.productModel}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  ProductModel? productModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  List<String> pathImages = [];
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    productModel = widget.productModel;
    // print('### image from mySQL==>${productModel!.images}');
    convertStringToArray();
    nameController.text = productModel!.name;
    priceController.text = productModel!.price;
    detailController.text = productModel!.detail;
  }

  void convertStringToArray() {
    String string = productModel!.images;
    // print('string ก่อนตัด ==>>$string');
    string = string.substring(1, string.length - 1);
    // print('string หลังตัด ==>>$string');

    List<String> strings = string.split(',');
    for (var item in strings) {
      pathImages.add(item.trim());
    }
    print('### pathImages ==>>$pathImages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () => processEdit(),
            icon: Icon(Icons.edit),
            tooltip: 'Edit Product',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(FocusScopeNode()),
              behavior: HitTestBehavior.opaque,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle('General :'),
                    buildName(constraints),
                    buildPrice(constraints),
                    buildDetail(constraints),
                    buildTitle('Image Product :'),
                    buildImage(constraints, 0),
                    buildImage(constraints, 1),
                    buildImage(constraints, 2),
                    buildImage(constraints, 3),
                    buildEditProduct(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildEditProduct(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: constraints.maxWidth,
      child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.edit),
          label: Text('Edit Product')),
    );
  }

  Container buildImage(BoxConstraints constraints, int index) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_a_photo),
          ),
          Container(
            width: constraints.maxWidth * 0.5,
            child: CachedNetworkImage(
              imageUrl:
                  '${MyConstant.domain}/shoppingmall/${pathImages[index]}',
              placeholder: (context, url) => ShowProgress(),
            ),
          ),
          IconButton(
            onPressed: () => processEdit(),
            icon: Icon(Icons.add_photo_alternate),
          ),
        ],
      ),
    );
  }

  Row buildName(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Fill Name in Blank';
              } else {
                return null;
              }
            },
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPrice(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill Price';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.number,
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price :',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildDetail(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: constraints.maxWidth * 0.75,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill Detail';
              } else {
                return null;
              }
            },
            controller: detailController,
            decoration: InputDecoration(
              labelText: 'Detail :',
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
        ),
      ],
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
        ),
      ],
    );
  }

  processEdit() {
    if (formKey.currentState!.validate()) {
      String name = nameController.text;
      String price = priceController.text;
      String detail = detailController.text;
      print('## name = $name,price= $price,detail = $detail');
    }
  }
}
