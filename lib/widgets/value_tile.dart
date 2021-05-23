import 'package:flutter/material.dart';

class ValueTile extends StatelessWidget {
  final String label;
  final Widget value;
  final IconData iconData;
  final String imageUri;

  ValueTile(this.label, this.value, {this.iconData, this.imageUri});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            this.iconData != null
                ? Icon(
                    iconData,
                    size: 17,
                    color: Colors.white,
                  )
                : Image.asset(
                    imageUri,
                    color: Colors.white,
                    width: 15,
                  ),
            SizedBox(
              width: 4,
            ),
            Text(
              this.label,
              overflow: TextOverflow.clip,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 10,
        ),
        this.value,
      ],
    );
  }
}
