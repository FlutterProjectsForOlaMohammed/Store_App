import 'package:flutter/material.dart';
import 'package:storeapp/Views/add_new_product_view.dart';

import 'custom_text_form_field.dart';
import 'cuttom_button.dart';
import '../Services/add_new_product_service.dart';

class AddNewProductForm extends StatefulWidget {
  const AddNewProductForm({super.key});

  @override
  State<AddNewProductForm> createState() => _AddNewProductFormState();
}

class _AddNewProductFormState extends State<AddNewProductForm> {
  String? title, description, image, category;
  num? price;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            forRead: true,
            text: 'ID : ${idGlobal + 1} ',
            onTapped: (data) {},
          ),
          CustomTextField(
            forRead: false,
            text: 'Product Name ',
            onTapped: (data) {
              title = data;
            },
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
              price = num.parse(data);
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
          CustomTextField(
            forRead: false,
            text: 'Category ',
            onTapped: (data) {
              category = data;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: 'Add Product ',
            onTapped: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await AddNewProductService().addProductService(
                    id: (++idGlobal).toString(),
                    title: title!,
                    price: price.toString(),
                    description: description!,
                    category: category!,
                    image: image!,
                  );
                  // ignore: use_build_context_synchronously
                  alertDialog(
                      context: context,
                      content: "The product was added successfully");
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}

alertDialog({required BuildContext context, required String content}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: const Text(
            "Done",
            style: TextStyle(fontSize: 32),
          ),
          content: Text(
            content,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.6)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Text(
                "OK",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      });
}
