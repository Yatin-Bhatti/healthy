import 'package:flutter/material.dart';
import 'login_page.dart';
import 'signup_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Welcome to",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: Text(
                  "Self Care",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),

              // Illustration
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: Image.asset("assets/selfcare.png", height: 250),
              ),

              const SizedBox(height: 40),

              // Sign Up button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text("Sign Up"),
                ),
              ),

              const SizedBox(height: 10),

              // Login button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
