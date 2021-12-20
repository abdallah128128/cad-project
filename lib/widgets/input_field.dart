import 'package:flutter/material.dart';

Widget inputField(TextEditingController controller) => Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.0,
            ),
          ),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: '0',
          ),
        ),
      ),
    );
