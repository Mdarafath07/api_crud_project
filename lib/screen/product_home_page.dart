import 'dart:convert';

import 'package:api_crud_project/model/product_model.dart';
import 'package:api_crud_project/screen/add_new_product.dart';
import 'package:api_crud_project/screen/update_product_screen.dart';
import 'package:api_crud_project/utils/urls.dart';
import 'package:api_crud_project/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  final List<ProductModel> _productList = [];
   bool _getProductInProgress = false;

  @override
  void initState() {
    super.initState();
    _getProductList();
  }
  Future<void> _getProductList() async{
    _productList.clear();
    _getProductInProgress = true;
    setState(() {

    });
    Uri uri =Uri.parse(Urls.getProductsUrl);
    Response response = await get(uri);
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode == 200){
      final decodedJson = jsonDecode(response.body);
      for(Map<String,dynamic> productJson in decodedJson["data"]){
        ProductModel productModel = ProductModel.fromJson(productJson);
        _productList.add(productModel);
      }
    }
    _getProductInProgress =false;
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Visibility(
        visible: _getProductInProgress == false,
        replacement: Center(
          child: CircularProgressIndicator(
            backgroundColor: Color(0xff091B6A),
          ),
        ),
        child: Column(
          children: [

            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:[
                      Color(0xff0029FF),
                      Color(0xff091B6A),
                    ]),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(

                                "https://i.pinimg.com/736x/30/6f/d0/306fd0fb64f67ff40f81d8e37f8bf674.jpg"
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome Back,",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: Colors.white,
                              ),),
                              Text("Md Aafath",style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Colors.white,
                              ),),
                            ],
                          ),

                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )

                        ),
                        onPressed: (){
                          _getProductList();

                        }, child: Text("Refresh",style: TextStyle(
                      color: Colors.white,

                    ),)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Product List",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20
            ),),
            Container(
              width: 200,
              child: Divider(
                thickness: 2,
                color: Color(0xff091B6A),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _productList.length,
                itemBuilder: (context, index){
                  return product_item(product: _productList[index], refreshProductList: () {
                    _getProductList();
                  },);

                },
              ),
            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewProduct()));
      },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xff091B6A),
      ),
    );
  }
}


