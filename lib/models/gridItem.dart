import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backColor;
  final Function onClick;
  GridItem(this.icon, this.text, this.backColor, {this.onClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: backColor,
              blurRadius: 10.0,
            )
          ],
          color: backColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 80,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
