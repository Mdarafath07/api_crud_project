import 'package:flutter/material.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

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
                    ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(
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

