import 'package:flutter/material.dart';

class Alerts {
  customDialog(
      {BuildContext? context,
      Widget? content,
      String? title,
      required bool dismissOnBackPressed,
      Function()? onTapA,
      Function()? onTapB,
      String? btnNameA,
      String? btnNameB,
      Color? iconColor,
      Color? titleColor,
      IconData? icon}) {
    return showDialog(
        builder: (context) => WillPopScope(
          onWillPop: () async {
            return dismissOnBackPressed ? true : false;
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.0)),
            backgroundColor: Colors.grey[300],
            title: Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: iconColor,
                      )
                    : Container(),
                SizedBox(width: 8.0),
                FittedBox(
                  child: Text(
                    "$title",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: titleColor),
                  ),
                ),
              ],
            ),
            content: content,
            actions: [
              if(btnNameA!=null)FlatButton(
                  onPressed: onTapA,
                  child: Text(
                    "$btnNameA",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
              if(btnNameB!=null)FlatButton(
                  onPressed: onTapB,
                  child: Text(
                    "$btnNameB",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ), barrierDismissible: false,
        context: context!);
  }

  snackBar(text,color){
    return SnackBar(
      backgroundColor: color,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text,
          style: TextStyle(
            color: Colors.white,
          ),),
        ],
      ),
    );
  }
}
