import 'package:cad_project/modules/cut_set_screens/setup_cut_set_screen.dart';
import 'package:cad_project/modules/tie_set_screens/setup_tie_set_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CAD Project',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 300,
              width: double.infinity,
              child: const Image(
                  image: AssetImage('assets/images/cad_icon2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Select Mode ',
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 30.0,
            ),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetupTieSetScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          'Tie_Set',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetupCutSetScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20.0,
                          ),
                        ),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          'Cut_Set',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],),

          ],
        ),
      ),
    );
  }
}
