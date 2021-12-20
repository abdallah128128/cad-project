import 'package:flutter/material.dart';

Widget matrixRow({
  required String matrixName,
  required xController,
  required yController,
  required Function xChange,
  required Function yChange,
}) =>
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$matrixName : ',
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: yController,
            onChanged: (value)
            {
              yChange(value);
            },
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'R',
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,),
          child: Text(
            'X',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 50.0,
          width: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
            color: Colors.white,
          ),
          child: TextFormField(
            onChanged: (value)
            {
              xChange(value);
            },
            controller: xController,
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'C',
            ),
          ),
        ),
      ],
    );
