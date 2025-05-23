import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_chat/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:simple_chat/features/chat/presentation/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardPage()),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFf7f9fb),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            child: Column(
              children: [
                Icon(Icons.messenger, color: Color(0xFF2454a2), size: 32),
                SizedBox(height: 20),
                Text(
                  "Welcome to Simple Chat",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 200,
                  child: Text(
                    "Sign in with your Google account to start chatting securely and instantly",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthSignInRequested());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    "Continue with Google",
                    style: TextStyle(color: Color(0xFF305da6)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
