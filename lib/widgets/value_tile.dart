import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValueTile extends StatelessWidget {
  final String label;
  final Widget value;
  final IconData? iconData;
  final String imageUri;

  ValueTile(this.label, this.value, {this.iconData, required this.imageUri});

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
                    size: 50.sp,
                    color: Colors.white,
                  )
                : Image.asset(
                    imageUri,
                    color: Colors.white,
                    width: 45.h,
                  ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            Container(
              width: ScreenUtil().setWidth(175),
              child: FittedBox(
                child: AutoSizeText(
                  this.label,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(15),
        ),
        this.value,
      ],
    );
  }
}
