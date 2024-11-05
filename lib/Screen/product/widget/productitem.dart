import 'package:elevate_flutter_advanced_bootcamp/Screen/productdetails/product-details-screen.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/model/AllProductModel.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final AllProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailsScreen.routeName,
              arguments: product);
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  product.image ?? "",
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
                const SizedBox(height: 8),
                Text(
                  product.title ?? "Untitled",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.amber,
                    ),
                    Text(
                      product.rating?.rate?.toStringAsFixed(1) ?? "N/A",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
