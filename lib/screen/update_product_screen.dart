import 'dart:convert';
import 'package:api_crud_project/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/urls.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product, required this.refreshProductList});
  final ProductModel product;
  final VoidCallback refreshProductList;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController =TextEditingController();
  final TextEditingController _codeTEController =TextEditingController();
  final TextEditingController _priceTEController =TextEditingController();
  final TextEditingController _quantityTEController =TextEditingController();
  final TextEditingController _imageUrlTEController =TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTEController.text=widget.product.name;
    _codeTEController.text=widget.product.code.toString();
    _priceTEController.text=widget.product.unitPrice.toString();
    _quantityTEController.text=widget.product.quantity.toString();
    _imageUrlTEController.text=widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Product",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _fromKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  spacing: 10,
                  children: [
                    SizedBox(height: 15,),
                    TextFormField(
                      controller:_nameTEController,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                          hintText: "Product Name",
                          labelText: "Product Name",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff091B6A),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff091B6A),
                                width: 2,
                              )
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    TextFormField(
                      validator: (String? value ){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your value";
                        }return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _codeTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Product Code",
                          labelText: "Product Code",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff091B6A),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff091B6A),
                                width: 2,
                              )
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    TextFormField(
                      validator: (String? value ){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your value";
                        }return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _quantityTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Quantity",
                          labelText: "Quantity",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff091B6A),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff091B6A),
                                width: 2,
                              )
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    TextFormField(
                      validator: (String? value ){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your value";
                        }return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _priceTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: "Unite Price",
                          labelText: "Unite Price",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff091B6A),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff091B6A),
                                width: 2,
                              )
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    TextFormField(
                      validator: (String? value ){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your value";
                        }return null;
                      },
                      controller: _imageUrlTEController,

                      decoration: InputDecoration(
                          hintText: "Image URL",
                          labelText: "Image URL",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff091B6A),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff091B6A),
                                width: 2,
                              )
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        _updateProduct().then((_) {

                          Navigator.pop(context);

                          widget.refreshProductList();
                        });
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff091B6A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    if(_fromKey.currentState!.validate() == false){
      return;
    }
    Uri uri = Uri.parse(Urls.updateProductUrl(widget.product.id));
    int totalPrice = int.parse(_priceTEController.text) * int.parse(_quantityTEController.text);
    Map<String, dynamic> updatedMap ={
      "ProductName": _nameTEController.text,
      "ProductCode": int.parse(_codeTEController.text),
      "Img": _imageUrlTEController.text,
      "Qty": int.parse(_quantityTEController.text),
      "UnitPrice": int.parse(_priceTEController.text),
      "TotalPrice": totalPrice
    };

    Response response = await post(uri, headers: {'Content-Type':'application/json'}, body: jsonEncode(updatedMap));

    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      if(decodedJson['status'] == 'success'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Updated Successful.')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Something went wrong.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error code: ${response.statusCode}')),
      );
    }


  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _imageUrlTEController.dispose();
    _priceTEController.dispose();
    _quantityTEController.dispose();
    _codeTEController.dispose();

    super.dispose();
  }
}

