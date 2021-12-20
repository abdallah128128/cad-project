import 'package:cad_project/modules/tie_set_screens/complete_tie_set_screen.dart';
import 'package:cad_project/widgets/input_field.dart';
import 'package:cad_project/widgets/matrix_row.dart';
import 'package:flutter/material.dart';

import '../values.dart';

class SetupTieSetScreen extends StatefulWidget {
  const SetupTieSetScreen({Key? key}) : super(key: key);

  @override
  State<SetupTieSetScreen> createState() => _SetupTieSetScreenState();
}

class _SetupTieSetScreenState extends State<SetupTieSetScreen> {
  var xController = TextEditingController();
  var bController = TextEditingController();
  var yController = TextEditingController();

  Map<String, TextEditingController> controllers = {};
  List<Widget> xWidgets = [];
  List<Widget> yWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tie-Set',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please Inter Matrices',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              matrixRow(
                matrixName: 'Matrix A',
                xController: xController,
                yController: yController,
                xChange: (value)
                async {
                  if(xController.text.isNotEmpty && yController.text.isNotEmpty) {
                    await c();
                    await w();
                    setState(() {
                    });
                  }
                },
                yChange: (value)
                async {
                  if(xController.text.isNotEmpty && yController.text.isNotEmpty) {
                    await c();
                    await w();
                    setState(() {
                    });
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children:
                [
                  const Text(
                    'Number of Branches : ',
                    style: TextStyle(
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
                      controller: bController,
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'B',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Hint: Enter Branches first',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Column(
                children: yWidgets,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15.0,
                    ),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: ()
                  async {
                    await a();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CompleteSetupScreen(),),);
                  },
                  child: const Text(
                    'Next',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> a() async
  {
    int y = int.parse(yController.text == '' ? '0' : yController.text);
    if(int.parse(bController.text.toString()) != int.parse(yController.text.toString()))
      {
        y = int.parse(bController.text.toString());
      }
    AT.clear();
    AL.clear();
    for (int i = 0; i < y; i++)
      {
        List<double> rt = [];
        for(int j = 0 ; j < int.parse(bController.text == '' ? '0' : bController.text) ; j++)
          {
            rt.add(double.parse(controllers['$i$j']!.text.toString()));
          }
        List<double> rl = [];
        for(int j = int.parse(bController.text == '' ? '0' : bController.text) ; j < int.parse(xController.text == '' ? '0' : xController.text) ; j++)
        {
          rl.add(double.parse(controllers['$i$j']!.text.toString()));
        }
        AT.add(rt);
        AL.add(rl);
      }
  }

  Future<void> w() async
  {
    yWidgets.clear();
    for (int i = 0; i < int.parse(yController.text == '' ? '0' : yController.text); i++){
      xWidgets= [];
      for(int j = 0 ; j < int.parse(xController.text == '' ? '0' : xController.text) ; j++){
        xWidgets.add(inputField(controllers['$i$j']!));
      }
      yWidgets.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: xWidgets,
        ),
      );
    }
  }

  Future<void> c() async
  {
    for(int i = 0 ; i < int.parse(yController.text == '' ? '0' : yController.text) ; i++)
      {
        for(int j = 0 ; j < int.parse(xController.text == '' ? '0' : xController.text) ; j++)
          {
            controllers.addAll({'$i$j': TextEditingController()});
          }
      }
  }
}
