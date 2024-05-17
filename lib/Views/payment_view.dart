import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/Models/product_model.dart';
import 'package:storeapp/Models/user_data.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/cubit/PaymentProducts/payment_products_cubit.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({
    super.key,
    required this.user,
  });
  static const String id = 'PaymentView';
  final UserData user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: BlocProvider(
        create: (context) => PaymentProductsCubit(),
        child: const PaymentViewBody(),
      ),
    );
  }
}

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({
    super.key,
  });

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  "Shopping Cart ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: kPrimaryColor),
                ),
              ),
            ),
            BlocBuilder<PaymentProductsCubit, PaymentProductsState>(
              builder: (context, state) {
                List<ProductModel> productList =
                    BlocProvider.of<PaymentProductsCubit>(context).products;
                return SliverList.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ProductPaidListTile(product: productList[index]);
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProductPaidListTile extends StatelessWidget {
  const ProductPaidListTile({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        height: 70,
        width: 70,
      ),
      title: Text(
        product.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        children: [
          Text(
            product.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey[200]),
                child: Text(
                  "quantity : ${product.quantity}",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () async {
                  await BlocProvider.of<PaymentProductsCubit>(context)
                      .deleteProducts(product);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200]),
                  child: const Text(
                    "Remove ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      trailing: Text(
        product.price.toString(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
