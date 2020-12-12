import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key key,
    @required this.controller,
    @required this.onPressed,
  }) : super(key: key);

  final TextEditingController controller;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
