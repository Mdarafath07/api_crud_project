import 'dart:convert';

import 'package:api_crud_project/widgets/snackbar_massage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  bool _addProductinProgress = false;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController =TextEditingController();
  final TextEditingController _codeTEController =TextEditingController();
  final TextEditingController _priceTEController =TextEditingController();
  final TextEditingController _quantityTEController =TextEditingController();
  final TextEditingController _imageUrlTEController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add New Product",
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
                      validator: (String? value ){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter your value";
                        }return null;
                      },
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
                    Visibility(
                      visible: _addProductinProgress == false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(onPressed: _onTapAddProductButton, child: Text("Submit",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                      ),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff091B6A),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
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
  Future<void> _onTapAddProductButton() async {
    if(_fromKey.currentState!.validate() == false){
      return ;

    }
    _addProductinProgress = true;
    setState(() {});

    Uri uri = Uri.parse("http://35.73.30.144:2008/api/v1/CreateProduct");
    int totalPrice =int.parse(_priceTEController.text) * int.parse(_quantityTEController.text);
    Map <String, dynamic> requestBody={
      "ProductName": _nameTEController.text.trim(),
      "ProductCode": int.parse(_codeTEController.text.trim()),
      "Img": _imageUrlTEController.text.trim(),
      "Qty": int.parse(_quantityTEController.text.trim()),
      "UnitPrice": int.parse(_priceTEController.text.trim()),
      "TotalPrice": totalPrice,
  };
    Response response = await post(
        uri,
        headers: {
          "Content-type": "Application/json"
        },
        body: jsonEncode(requestBody));
    print(response.statusCode);
    print(response.body);



    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      if(decodedJson["status"] == "success"){
        _clearTextfields();
        showSnackBarMessage(context, "Product created successfully");

      }else{
        String errorMassage = decodedJson["data"];
       showSnackBarMessage(context, errorMassage);

      }

    }
    _addProductinProgress = false;
    setState(() {});

  }
  
  void _clearTextfields(){
    _nameTEController.clear();
    _codeTEController.clear();
    _imageUrlTEController.clear();
    _quantityTEController.clear();
    _priceTEController.clear();
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

