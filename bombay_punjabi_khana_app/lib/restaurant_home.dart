import 'package:flutter/material.dart';
import 'components/food_card.dart';

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({super.key});

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  // 1. DUMMY DATA LIST (15 items)
  final List<Map<String, dynamic>> allFoods = [
    {
      "name": "Vada Pav",
      "category": "Bombay Special",
      "price": "40.00",
      "rating": "4.8",
      "img":
          "https://images.unsplash.com/photo-1606491956689-2ea866880c84?q=80&w=1921&auto=format&fit=crop",
    },
    {
      "name": "Pav Bhaji",
      "category": "Bombay Special",
      "price": "120.00",
      "rating": "4.9",
      "img":
          "https://images.unsplash.com/photo-1601050690597-df0568f70950?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Butter Chicken",
      "category": "Punjabi",
      "price": "350.00",
      "rating": "4.7",
      "img":
          "https://images.unsplash.com/photo-1603894584713-b48633299931?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Chole Bhature",
      "category": "Punjabi",
      "price": "150.00",
      "rating": "4.8",
      "img":
          "https://images.unsplash.com/photo-1626132646529-5003375a9541?q=80&w=1935&auto=format&fit=crop",
    },
    {
      "name": "Hakka Noodles",
      "category": "Chinese",
      "price": "180.00",
      "rating": "4.4",
      "img":
          "https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=1859&auto=format&fit=crop",
    },
    {
      "name": "Manchurian",
      "category": "Chinese",
      "price": "160.00",
      "rating": "4.3",
      "img":
          "https://images.unsplash.com/photo-1512058560366-cd2427ff2963?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Masala Dosa",
      "category": "South Indian",
      "price": "100.00",
      "rating": "4.7",
      "img":
          "https://images.unsplash.com/photo-1630383249896-424e482df921?q=80&w=1974&auto=format&fit=crop",
    },
    {
      "name": "Idli Sambar",
      "category": "South Indian",
      "price": "60.00",
      "rating": "4.5",
      "img":
          "https://images.unsplash.com/photo-1589301760014-d929f3979dbc?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Bombay Sandwich",
      "category": "Bombay Special",
      "price": "70.00",
      "rating": "4.3",
      "img":
          "https://images.unsplash.com/photo-1528733918455-5a59687cedf0?q=80&w=1887&auto=format&fit=crop",
    },
    {
      "name": "Dal Makhani",
      "category": "Punjabi",
      "price": "220.00",
      "rating": "4.6",
      "img":
          "https://images.unsplash.com/photo-1546833999-b9f581a1996d?q=80&w=1887&auto=format&fit=crop",
    },
    {
      "name": "Spring Rolls",
      "category": "Chinese",
      "price": "120.00",
      "rating": "4.1",
      "img":
          "https://images.unsplash.com/photo-1617093727343-374698b1b08d?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Meduvada",
      "category": "South Indian",
      "price": "80.00",
      "rating": "4.4",
      "img":
          "https://images.unsplash.com/photo-1645177623574-2d1ff1f911cd?q=80&w=1887&auto=format&fit=crop",
    },
    {
      "name": "Paneer Tikka",
      "category": "Punjabi",
      "price": "280.00",
      "rating": "4.6",
      "img":
          "https://images.unsplash.com/photo-1567184109171-9b5757761944?q=80&w=1740&auto=format&fit=crop",
    },
    {
      "name": "Misal Pav",
      "category": "Bombay Special",
      "price": "80.00",
      "rating": "4.5",
      "img":
          "https://images.unsplash.com/photo-1505253149613-112d21d9f6a9?q=80&w=1887&auto=format&fit=crop",
    },
    {
      "name": "Veg Fried Rice",
      "category": "Chinese",
      "price": "150.00",
      "rating": "4.2",
      "img":
          "https://images.unsplash.com/photo-1603133872878-684f208fb84b?q=80&w=1925&auto=format&fit=crop",
    },
  ];

  // 2. STATE VARIABLES
  String selectedCategory = "All";
  List<Map<String, dynamic>> filteredFoods = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredFoods = allFoods; // Starting mein sab dikhega
  }

  // 3. FILTER LOGIC
  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == "All") {
        filteredFoods = allFoods;
      } else {
        filteredFoods = allFoods
            .where((food) => food['category'] == category)
            .toList();
      }
    });
  }

  // 4. Search Logic
  void searchFood(String query) {
    setState(() {
      // Agar query khali hai toh sirf selected category dikhao
      if (query.isEmpty) {
        if (selectedCategory == "All") {
          filteredFoods = allFoods;
        } else {
          filteredFoods = allFoods
              .where((food) => food['category'] == selectedCategory)
              .toList();
        }
      } else {
        // Search logic: Name ya Category mein se match karega
        filteredFoods = allFoods.where((food) {
          final foodName = food['name'].toLowerCase();
          final searchLower = query.toLowerCase();

          // Filter criteria: search text matches AND (category matches OR it's 'All')
          bool matchesCategory =
              (selectedCategory == "All" ||
              food['category'] == selectedCategory);
          return foodName.contains(searchLower) && matchesCategory;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => searchFood(value),
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search for Pav Bhaji...",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  searchFood("");
                                },
                              )
                            : null,
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

            // CATEGORY SCROLLER
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  _buildCategoryChip("All"),
                  _buildCategoryChip("Bombay Special"),
                  _buildCategoryChip("Punjabi"),
                  _buildCategoryChip("Chinese"),
                  _buildCategoryChip("South Indian"),
                  const SizedBox(width: 16),
                ],
              ),
            ),

            // DYNAMIC HEADING
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 8),
              child: Text(
                selectedCategory == "All"
                    ? "All Items"
                    : "$selectedCategory Items",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "${filteredFoods.length} items available",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            // FOOD CARDS LOOP
            // empty foods wala + loop wala logic:
            filteredFoods.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Icon(
                            Icons.fastfood_outlined,
                            size: 80,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Oops! No food found.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Try searching for something else",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: filteredFoods.map((food) {
                      return FoodCard(
                        title: food['name'],
                        description: food['category'],
                        price: food['price'],
                        rating: food['rating'],
                        imageUrl: food['img'],
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // CUSTOM CHIP WIDGET
  Widget _buildCategoryChip(String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => filterByCategory(label),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
