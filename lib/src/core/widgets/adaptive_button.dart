import 'package:flutter/material.dart';

class AdaptiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const AdaptiveTextButton({
    @required this.text,
    @required this.onTap,
    Key key,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatButton(
        onPressed: onTap,
        color: color ?? Theme.of(context).buttonColor,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints(maxWidth: 500),
          child: Center(
            child: Text(text),
          ),
        ),
      );
}
