// Team Members: Alex Nguyen, Amaan Panjwani
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(ValentineApp());
}

class ValentineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeartbeatScreen(),
    );
  }
}

class HeartbeatScreen extends StatefulWidget {
  @override
  _HeartbeatScreenState createState() => _HeartbeatScreenState();
}

class _HeartbeatScreenState extends State<HeartbeatScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;
  int _countdown = 10;
  String _message = "Happy Valentine's Day!";
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_countdown == 0) {
        _timer?.cancel();
        setState(() {
          _showMessage = true;
        });
      } else {
        setState(() {
          _countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$_countdown",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _showMessage ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Text(
                _message,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}