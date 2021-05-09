import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backColor;
  final Function onPressed;
  GridItem(this.icon, this.text, this.backColor, {this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backColor),
          shadowColor: MaterialStateProperty.all<Color>(backColor),
          elevation: MaterialStateProperty.all(10.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        // margin: EdgeInsets.all(10.0),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: backColor,
        //       blurRadius: 10.0,
        //     )
        //   ],
        //   color: backColor,
        //   borderRadius: BorderRadius.circular(32),
        // ),
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
