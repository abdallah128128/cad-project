import 'package:cad_project/modules/tie_set_screens/tie_set_result.dart';
import 'package:cad_project/modules/values.dart';
import 'package:cad_project/widgets/input_field.dart';
import 'package:flutter/material.dart';
class CompleteSetupScreen extends StatefulWidget {
  const CompleteSetupScreen({Key? key}) : super(key: key);

  @override
  State<CompleteSetupScreen> createState() => _CompleteSetupScreenState();
}

class _CompleteSetupScreenState extends State<CompleteSetupScreen> {
  Map<String, TextEditingController> controllers = {};

  List<Widget> yZBWidgets = [];

  var yZBController = TextEditingController();

  List<Widget> yIBWidgets = [];

  var yIBController = TextEditingController();

  List<Widget> yEBWidgets = [];

  var yEBController = TextEditingController();


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
                'Please Inter Matrices ',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children:
                [
                  const Text(
                    'Number Of Columns Of Matrix ZB : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                      controller: yZBController,
                      onChanged: (value) async
                      {
                        await c(yZBController, 'ZB');
                        await w(yZBController, 'ZB');
                        setState(() {

                        });
                      },
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'R',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: yZBWidgets,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),

              Column(
                children:
                [
                  const Text(
                    'Number Of Columns Of Matrix IB : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                      controller: yIBController,
                      onChanged: (value) async
                      {
                        await c(yIBController, 'IB');
                        await w(yIBController, 'IB');
                        setState(() {

                        });
                      },
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Y',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: yIBWidgets,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children:
                [
                  const Text(
                    'Number Of Columns Of Matrix EB : ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
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
                      controller: yEBController,
                      onChanged: (value) async
                      {
                        await c(yEBController, 'EB');
                        await w(yEBController, 'EB');
                        setState(() {

                        });
                      },
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Y',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: yEBWidgets,
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
                    await m();
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => tieSetResult(),),);
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

  Future<void> c(controller, name) async
  {
    for(int i = 0 ; i < int.parse(controller.text == '' ? '0' : controller.text) ; i++)
    {
      controllers.addAll({'$name$i': TextEditingController()});
    }
  }

  Future<void> w(controller, name) async
  {
    List<Widget> list = [];
    for(int i = 0 ; i < int.parse(controller.text == '' ? '0' : controller.text) ; i++)
      {
        list.add(inputField(controllers['$name$i']!));
      }

    if(name == 'ZB') {
      yZBWidgets = list;
    } else if(name == 'IB'){
      yIBWidgets = list;
    } else{
      yEBWidgets = list;
    }
  }

  Future<void> m() async
  {
    ZB.clear();
    IB.clear();
    EB.clear();
    for(int i = 0 ; i < int.parse(yZBController.text == '' ? '0' : yZBController.text) ; i++)
      {
        ZB.add(double.parse(controllers['ZB$i']!.text.toString()));
      }
    for(int i = 0 ; i < int.parse(yIBController.text == '' ? '0' : yIBController.text) ; i++)
    {
      IB.add(double.parse(controllers['IB$i']!.text.toString()));
    }
    for(int i = 0 ; i < int.parse(yEBController.text == '' ? '0' : yEBController.text) ; i++)
    {
      EB.add(double.parse(controllers['EB$i']!.text.toString()));
    }
  }
}
