import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailTextField extends StatelessWidget {
  final TextFormField child;
  final String text;

  const DetailTextField({
    Key? key,
    required this.child,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: child,
          ),
          SizedBox(
            width: 8,
          ),
          InkWell(
            highlightColor: Colors.blue[200],
            customBorder: CircleBorder(),
            child: SizedBox(
              height: 48,
              width: 48,
              child: Icon(
                Icons.copy,
                size: 24,
              ),
            ),
            onTap: () async {
              if (text.isNotEmpty) {
                await Clipboard.setData(
                  ClipboardData(text: text),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
