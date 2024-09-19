import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  @override
  _MoreInfo createState() => _MoreInfo();
}

class _MoreInfo extends State<MoreInfo> {
  List<Color> _rectangleColors = [Colors.blue];
  bool _isBlue = false;

  void _addRectangle() {
    setState(() {
      _rectangleColors.add(_isBlue ? Colors.blue : Colors.green);
      _isBlue = !_isBlue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Wrap(
                children: List.generate(
                  _rectangleColors.length,
                      (index) => GestureDetector(
                    onTap: _addRectangle,
                    child: Container(
                      width: 65,
                      height: 50,
                      color: _rectangleColors[index],
                      margin: EdgeInsets.all(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}