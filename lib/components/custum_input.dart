import 'package:flutter/material.dart';

class CustumInput extends StatefulWidget {
  final String placeholder;
  final controler;
  final String? Function(String?)? validator;
  const CustumInput({
    super.key,
    required this.placeholder,
    required this.controler,
    required this.validator,
  });

  @override
  State<CustumInput> createState() => _CustumInputState();
}

class _CustumInputState extends State<CustumInput> {
  String? errorMessage;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            TextFormField(
              validator: widget.validator,
              controller: widget.controler,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.placeholder,
                errorText: errorMessage,
              ),
              onChanged: (value) {
                setState(() {
                  errorMessage = widget.validator?.call(value);
                });
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
