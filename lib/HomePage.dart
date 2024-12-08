import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:finaltaskl1/allproduct.dart';
import 'package:finaltaskl1/carshop.dart';
import 'package:finaltaskl1/natification.dart';
import 'package:finaltaskl1/profile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/66.png'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, bebo",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text("Welcome to bebo Medical Store",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  context.go('/notifications');
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  context.go('/cart');
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Top Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryCard("Dental", Colors.pink, context),
                  _buildCategoryCard("Wellness", Colors.green, context),
                  _buildCategoryCard("Homeo", Colors.orange, context),
                  _buildCategoryCard("Eye Care", Colors.blue, context),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/23.jpg'), fit: BoxFit.cover),
                ),
                child: Center(
                  child: Text("",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Deals of the Day",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      context.go('/DiabetesCarePage');
                    },
                    child: Text("More", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildProductCard();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                context.go('/home');
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                context.go('/notifications');
              },
            ),
            IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {
                context.go('/cart');
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                context.go('/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Category Card
  Widget _buildCategoryCard(String name, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/category/$name');
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          width: 80,
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Product Card
  Widget _buildProductCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/66.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Accu Check Active \nTest Strip",
                    style: TextStyle(fontSize: 14)),
                Text("Rs. 112",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
