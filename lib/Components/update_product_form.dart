import 'package:flutter/material.dart';
import 'package:storeapp/Components/add_new_product_form.dart';
import 'package:storeapp/Components/custom_text_form_field.dart';
import 'package:storeapp/Components/cuttom_button.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Services/update_product.dart';

class UpdateProductForm extends StatefulWidget {
  const UpdateProductForm({super.key});

  @override
  State<UpdateProductForm> createState() => _UpdateProductFormState();
}

class _UpdateProductFormState extends State<UpdateProductForm> {
  String? productName, description, image;

  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 70,
            ),
            CustomTextField(
              text: 'Product Name ',
              onTapped: (data) {
                productName = data;
              },
              forRead: false,
            ),
            CustomTextField(
              forRead: false,
              text: 'Description ',
              onTapped: (data) {
                description = data;
              },
            ),
            CustomTextField(
              forRead: false,
              text: 'Price ',
              onTapped: (data) {
                price = data;
              },
              keyboard: TextInputType.number,
            ),
            CustomTextField(
              forRead: false,
              text: 'Image ',
              onTapped: (data) {
                image = data;
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: 'Save Changes',
              onTapped: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await update(product);
                  // ignore: use_build_context_synchronously
                  alertDialog(
                      context: context,
                      content: "The product was updated successfully");
                } catch (e) {
                  setState(() {
                    isLoading = false;
                  });
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'SomeThing Wrong , Please Try To connect To the Internet'),
                    ),
                  );
                }
                setState(() {
                  isLoading = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> update(ProductModel product) async {
    await UpdateProductDetailsService().updateService(
        title: productName == null ? product.title : productName!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        price: price == null ? product.price.toString() : price!,
        category: product.category,
        ID: product.id.toString());
  }
}
