import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiabetesCarePage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'image': 'assets/46.jpg', 'label': 'Sugar Substitute'},
    {'image': 'assets/46.jpg', 'label': 'Juices & Vinegars'},
    {'image': 'assets/46.jpg', 'label': 'Vitamins Medicines'},
  ];

  final List<Map<String, String>> products = [
    {
      'image': 'assets/66.png',
      'name': 'Accu-check Active\nTest Strip',
      'price': 'Rs.112'
    },
    {
      'image': 'assets/23.jpg',
      'name': 'Omron HEM-8712\nBP Monitor',
      'price': 'Rs.150'
    },
    {'image': 'assets/23.jpg', 'name': 'Glucometer', 'price': 'Rs.200'},
    {'image': 'assets/23.jpg', 'name': 'Test Strips', 'price': 'Rs.90'},
    {'image': 'assets/23.jpg', 'name': 'BP Machine', 'price': 'Rs.180'},
    {
      'image': 'assets/23.jpg',
      'name': 'Sugar Control Juice',
      'price': 'Rs.250'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Care'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((category) {
                return CategoryItem(
                  imagePath: category['image']!,
                  label: category['label']!,
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            // Products Section
            Text(
              'All Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.go(
                      '/product',
                      extra: {
                        'image': products[index]['image']!,
                        'name': products[index]['name']!,
                        'price': products[index]['price']!,
                      },
                    );
                  },
                  child: ProductItem(
                    imagePath: products[index]['image']!,
                    name: products[index]['name']!,
                    price: products[index]['price']!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductItem(
      {required this.imagePath, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  color: Colors.red,
                  child: Text(
                    'SALE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
