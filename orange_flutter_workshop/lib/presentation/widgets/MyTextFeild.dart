import 'package:flutter/material.dart';

class MyTextFeild extends StatefulWidget {
  MyTextFeild({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.textAction,
    required this.icon,
    required this.prefixIcon,
    required this.validation,
    required this.onChanged,
    this.startValue,
    this.maxLines = 1,
    
  }) : super(key: key);

  final TextEditingController controller;
  final bool prefixIcon;
  final Icon? icon;
  final TextInputType inputType;
  final String label;
  final TextInputAction textAction;
  String? startValue;
  final int? maxLines;
  Function validation;
  Function onChanged;

  @override
  State<MyTextFeild> createState() => _MyTextFeildState();
}

class _MyTextFeildState extends State<MyTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          maxLines: widget.maxLines,
          validator: (value) {
            return widget.validation(value);
          },
          onChanged: widget.onChanged != null ? widget.onChanged() : null,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          keyboardType: widget.inputType,
          cursorHeight: 20,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            floatingLabelStyle: const TextStyle(
                color: Colors.orange,
                fontSize: 23,
                fontWeight: FontWeight.bold),
            labelText: widget.label,
            labelStyle: const TextStyle(fontSize: 23),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22.0),
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 2.5,
              ),
            ),
            prefixIcon: widget.prefixIcon ? widget.icon : null,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
