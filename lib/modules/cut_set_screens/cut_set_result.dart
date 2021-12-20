
import 'package:flutter/material.dart';

import '../cad_calculations.dart';
import '../values.dart';
class cutSetResult extends StatelessWidget {

  var c= Calculations(isTieSet: false, AT: AT, AL: AL, Yb: YB, Eb: EB, Ib: IB);
  List<Widget> jbColumn =[];
  List<Widget> vbColumn =[];

  @override
  Widget build(BuildContext context) {
    jb();
    vb();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        title: const Text(
          'Cut_Set_Result',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'JB :',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 10,),
              Column(
                children: jbColumn,
              ),

              const SizedBox(
                height: 40,
              ),
              const Text('VB :',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),),
              const SizedBox(height: 10,),
              Column(
                children: vbColumn,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void jb(){
        for(int i=0 ; i<c.JB.length ; i++ ){
          jbColumn.add(Text(
            '${c.JB[i]}',
            style: const TextStyle(
              fontSize: 15.0,
            ),
          ),);
    }
  }

  void vb(){
    for(int i=0 ; i<c.VB.length ; i++ ){
      vbColumn.add(Text(
        '${c.VB[i]}',
        style: const TextStyle(
          fontSize: 15.0,
        ),
      ),);
    }
  }
}
