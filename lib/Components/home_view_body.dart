import 'package:flutter/material.dart';
import 'package:storeapp/Components/drop_box.dart';
import 'package:storeapp/Components/show_grid_cards.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/Views/loading_view.dart';
import 'package:storeapp/Services/get_all_products_service.dart';
import 'package:storeapp/Services/get_products_related_to_specific_category_service.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String droppedValue = 'all';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: FutureBuilder(
          future: (droppedValue == 'all')
              ? GetAllProductsService().getProductsService()
              : GetProductsRelatedToSpecificCategory()
                  .getRelatedProductsService(categoryName: droppedValue),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> finalProducts = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ShowGridCards(finalProducts: finalProducts),
                  ),
                  DropBox(
                      droppedValue: droppedValue,
                      onChanged: (data) {
                        setState(() {
                          droppedValue = data!;
                        });
                      })
                ],
              );
            } else {
              return const LoadingView();
            }
          }),
    );
  }
}
