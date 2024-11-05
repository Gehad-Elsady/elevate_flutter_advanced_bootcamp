import 'package:elevate_flutter_advanced_bootcamp/Screen/product/model/AllProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'ProductDetailsScreen';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as AllProductModel;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.image!,
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // Product Title
            Center(
              child: Text(
                product.title ?? "No title available",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Description Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Text(
              product.description ?? "No description available",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1.5),

            // Price Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1.5),
            const SizedBox(height: 10),

            // Rating Section with Stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: product.rating?.rate ?? 0.0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 24.0,
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${product.rating?.rate ?? '0.0'} / 5",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
