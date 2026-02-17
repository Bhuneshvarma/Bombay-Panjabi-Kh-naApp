import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Yeh hai woh 'State' jo decide karegi ki Login dikhana hai ya Register
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F6), // Light peach background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Column(
            children: [
              // 1. Logo Icon
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.fastfood,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              const SizedBox(height: 30),

              // 2. Dynamic Heading
              Text(
                isLogin ? "Welcome Back!" : "Create Account",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isLogin
                    ? "Sign in to continue ordering"
                    : "Register to start your foodie journey",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // 3. Input Fields Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Dynamic Username Field (Sirf Register mein dikhega)
                    if (!isLogin) ...[
                      _buildTextField(
                        "Username",
                        Icons.person_outline,
                        "john_doe",
                      ),
                      const SizedBox(height: 20),
                    ],

                    _buildTextField(
                      "Email Address",
                      Icons.email_outlined,
                      "you@example.com",
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      "Password",
                      Icons.lock_outline,
                      "••••••••",
                      isPassword: true,
                    ),

                    if (isLogin)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ),

                    const SizedBox(height: 20),

                    // Main Action Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        isLogin ? "Sign In" : "Sign Up",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 4. Toggle Link (Login <-> Register)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin
                        ? "Don't have an account? "
                        : "Already have an account? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      // YAHAN STATE CHANGE HO RAHI HAI
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin ? "Sign Up" : "Log In",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                "Or continue with",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // 5. Social Buttons
              Row(
                children: [
                  _socialBtn(
                    "Google",
                    "https://tse1.mm.bing.net/th/id/OIP.EhTMbGiYfYzQnWLgjZaoJAHaHa?pid=Api&P=0&h=180",
                  ),
                  const SizedBox(width: 15),
                  _socialBtn("Facebook", "https://tinyurl.com/fb-logo-png"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function for TextFields
  Widget _buildTextField(
    String label,
    IconData icon,
    String hint, {
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // Helper function for Social Buttons
  Widget _socialBtn(String label, String imgUrl) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.api), // Replace with Image.network for real icons
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
