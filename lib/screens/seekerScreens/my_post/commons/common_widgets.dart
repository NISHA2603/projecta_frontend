import 'package:flutter/material.dart';

class IdeasListCommonWidget extends StatelessWidget {
  final String? name;
  final String? date;
  final String? suggestionsTxt;
  final String? title;
  final String? desc;

  const IdeasListCommonWidget(
      {Key? key,
      this.name,
      this.date,
      this.suggestionsTxt,
      this.title,
      this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          SizedBox(height: 8.0),
          _desc(),
          SizedBox(height: 8.0),
          _footer()
        ],
      ),
    );
  }

  _title() {
    return Row(
      children: [
        Expanded(
            child: Text(
          title!,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        )),
        Icon(Icons.bookmark_border)
      ],
    );
  }

  _desc() {
    return Text(desc!, style: TextStyle(fontSize: 12.0, color: Colors.grey));
  }

  _footer() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.person_pin),
            Text(name!),
            Spacer(),
            suggestionsTxt==null?
            Row(
              children: [
                Icon(Icons.calendar_today_outlined),
                Text(date!),
              ],
            )
            :Icon(Icons.message_outlined),
          ],
        ),

        if (suggestionsTxt!=null)Row(
          children: [
            Icon(Icons.calendar_today_outlined),
            Text(date!),
            Spacer(),
            Text(suggestionsTxt!),
          ],
        ),
      ],
    );
  }
}
