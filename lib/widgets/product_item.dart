import 'package:api_crud_project/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../screen/update_product_screen.dart';
import '../utils/urls.dart';

class product_item extends StatefulWidget {
  const product_item({super.key, required this.product, required this.refreshProductList});
  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<product_item> createState() => _product_itemState();
}

class _product_itemState extends State<product_item> {
  bool _deleteInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0xff0029FF).withOpacity(0.2),
              blurRadius:4,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: ClipOval(
              child: Image.network(
                widget.product.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Icon(
                    Icons.broken_image_rounded,
                    size: 30,
                    color: Colors.blueAccent.withOpacity(0.5),
                  );
                },
              ),
            ),
          ),


          title: Text("${widget.product.name}"),
          subtitle: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Code: ${widget.product.code}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity: ${widget.product.quantity}"),
                  Text("Unit Price: ${widget.product.unitPrice}"),
                ],
              ),
            ],
          ),
          trailing: Visibility(
            visible: _deleteInProgress == false,
            replacement: CircularProgressIndicator(
              backgroundColor: Color(0xff0029FF),
            ),
            child: PopupMenuButton<ProductOptions>(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: ProductOptions.delete, child: Text("Delete")),
                  const PopupMenuItem(
                      value: ProductOptions.update, child: Text("Update")),
                ];
              },
              onSelected: (ProductOptions selectedOption) {
                if (selectedOption == ProductOptions.delete) {
                  _deleteProduct();
                } else if (selectedOption == ProductOptions.update) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProductScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );

  }

  Future<void> _deleteProduct() async{
    _deleteInProgress = true;
    setState(() {

    });

    Uri uri =Uri.parse(Urls.deleteProductUrl(widget.product.id));
    Response response = await get(uri);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode == 200){
      widget.refreshProductList();

    }
    _deleteInProgress =false;
    setState(() {

    });

  }
}

enum ProductOptions { update, delete }
