import 'package:api_crud_project/model/product_model.dart';
import 'package:flutter/material.dart';

import '../screen/update_product_screen.dart';

class product_item extends StatelessWidget {
  const product_item({super.key, required this.product});
  final ProductModel product;

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
                product.image,
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


          title: Text("${product.name}"),
          subtitle: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Code: ${product.code}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity: ${product.quantity}"),
                  Text("Unit Price: ${product.unitPrice}"),
                ],
              ),
            ],
          ),
          trailing: PopupMenuButton<ProductOptions>(
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
                print("delete");
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
    );

  }
}

enum ProductOptions { update, delete }
