import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class SearchTextEdit extends StatefulWidget {
  const SearchTextEdit({
    Key? key,
    required this.hint,
    required this.textInputType,
    required this.textEditingController,
    required this.textInputAction,
  }) : super(key: key);

  final String hint;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;

  @override
  State<SearchTextEdit> createState() => _SearchTextEditState();
}

class _SearchTextEditState extends State<SearchTextEdit> {
  late FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode = FocusNode();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      cursorColor: greyThreeColor,
      controller: widget.textEditingController,
      maxLines: 1,
      style: primaryTextStyle.copyWith(fontSize: 14),
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: _focusNode!.hasFocus ? greenColor : Colors.grey,
        ),
        hintText: widget.hint,
        hintStyle: greyTwoTextStyle.copyWith(
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: greyColor,
        filled: true,
      ),
      focusNode: _focusNode,
      onTap: _requestFocus,
    );
  }
}
