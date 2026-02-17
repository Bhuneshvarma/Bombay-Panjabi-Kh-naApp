import 'package:flutter/material.dart';
import 'restaurant_home.dart'; // Aapka purana home screen code
import 'cart_screen.dart'; // Aapka naya cart screen code
import 'login_screen.dart'; // login screen

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  // 1. Current index track karne ke liye
  int _currentIndex = 0;

  // 2. Saare pages ki list
  final List<Widget> _pages = [
    const RestaurantHome(), // Index 0
    const CartScreen(), // Index 1
    const Center(child: Text("Feedback Page")), // Index 2
    const LoginScreen(), // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- COMMON APPBAR ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.restaurant,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Bombay-Punjabi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // AppBar ke icons jo click karne par page badlenge
        actions: [
          _navAction(Icons.home, "Home", 0),
          _navAction(Icons.shopping_cart, "Cart", 1),
          _navAction(Icons.chat_bubble, "Feedback", 2),
          _navAction(Icons.person, "Login", 3),
        ],
      ),

      // --- DYNAMIC BODY ---
      // Ye line decide karegi ki index ke hisab se kaun sa page dikhega
      body: _pages[_currentIndex],
    );
  }

  // Custom function icons ke liye taaki setState handle ho sake
  Widget _navAction(IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index; // Yahan "State" change ho rahi hai
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? Colors.orange : Colors.grey, size: 22),
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.orange : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
