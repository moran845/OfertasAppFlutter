import 'package:flutter/material.dart';

class MyAdvancedApp extends StatelessWidget {
  const MyAdvancedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdvancedUI(),
    );
  }
}

class AdvancedUI extends StatefulWidget {
  const AdvancedUI({super.key});

  @override
  _AdvancedUIState createState() => _AdvancedUIState();
}

class _AdvancedUIState extends State<AdvancedUI> {
  bool _isBig = false;
  Color _color = Colors.blue;

  void _toggleContainer() {
    setState(() {
      _isBig = !_isBig;
      _color = _isBig ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Avanzada'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Hero(
              tag: 'hero-animation',
              child: Icon(
                Icons.star,
                color: Colors.orange,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _toggleContainer,
              child: AnimatedContainer(
                width: _isBig ? 200 : 100,
                height: _isBig ? 200 : 100,
                color: _color,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: const Center(
                  child: Text(
                    'Clickeame',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomPaint(
              size: const Size(200, 100),
              painter: MyCustomPainter(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
