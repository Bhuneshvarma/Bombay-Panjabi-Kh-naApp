import 'package:flutter/material.dart';
import 'components/food_card.dart';

class RestaurantHome extends StatelessWidget {
  const RestaurantHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /* appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.restaurant, color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bombay-Punjabi",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Khana",
                  style: TextStyle(color: Colors.orange, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.home, color: Colors.orange),
          SizedBox(width: 15),
          Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          SizedBox(width: 15),
          Icon(Icons.chat_bubble_outline, color: Colors.grey),
          SizedBox(width: 15),
          Icon(Icons.person_outline, color: Colors.grey),
          SizedBox(width: 10),
        ],
      ),*/
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Orange Gradient Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.redAccent],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Authentic Bombay-\nPunjabi Flavors",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "From Mumbai streets to Punjabi kitchens...",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search for Pav Bhaji...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Category Row
            // Row ko SingleChildScrollView mein lapet diya
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Isse horizontal scroll hoga
              physics:
                  const BouncingScrollPhysics(), // Isse iOS jaisa smooth bounce effect aayega
              child: Row(
                children: [
                  const SizedBox(width: 16), // Shuruat mein thoda gap
                  _buildCategoryChip("All", true),
                  _buildCategoryChip("Bombay Special", false),
                  _buildCategoryChip("Punjabi", false),
                  _buildCategoryChip("Chinese", false),
                  _buildCategoryChip(
                    "South Indian",
                    false,
                  ), // Ab aap jitne chahe add karo
                  _buildCategoryChip("Desserts", false),
                  const SizedBox(width: 16), // Aakhri mein thoda gap
                ],
              ),
            ),
            // 2. Swiper ke niche Heading aur Text
            const Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                25,
                16,
                8,
              ), // Left, Top, Right, Bottom
              child: Text(
                "All Items",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "9 items available in this category",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            // Phir uske niche ye loop daaliye:
            Column(
              children: List.generate(10, (index) {
                return const FoodCard(
                  title: "Vada Pav",
                  description:
                      "Mumbai ka famous street food - crispy vada in pav",
                  price: "40.00",
                  rating: "4.6",
                  imageUrl:
                      "https://images.unsplash.com/photo-1565557623262-b51c2513a641?q=80&w=2142&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Apni image URL yahan dalein
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
