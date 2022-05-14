import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomizePizza extends StatefulWidget {
  String pizzaimage;
  CustomizePizza({Key? key, required this.pizzaimage}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<CustomizePizza> createState() => _CustomizePizzaState(pizzaimage);
}

class _CustomizePizzaState extends State<CustomizePizza> {
  String pizzaimage;
  _CustomizePizzaState(this.pizzaimage);

  bool jalchkBox = false;
  bool tomchkBox = false;
  bool olvchkBox = false;

  String topping = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Customize Your Pizza",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: Image.asset(pizzaimage)),
              if (jalchkBox && tomchkBox && olvchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/three_topping.png")))
              else if (jalchkBox && tomchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/tomJal_topping.png")))
              else if (tomchkBox && olvchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/tomOliv_topping.png")))
              else if (jalchkBox && olvchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4, child: Image.asset("assets/jalOliv.png")))
              else if (jalchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/jalapeno_topping.png")))
              else if (tomchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/tomato_topping.png")))
              else if (olvchkBox)
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.52,
                    child: Transform.scale(
                        scale: 1.4,
                        child: Image.asset("assets/olive_topping.png")))
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //add jalapeno card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text("Add Jalapeno"),
                        const SizedBox(height: 8.0),
                        SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: Image.asset("assets/jalpenoAdd.png")),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: jalchkBox,
                            onChanged: (val) {
                              setState(() {
                                jalchkBox = val!;
                              });
                            },
                            splashRadius: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //add tomato card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text("Add Tomato"),
                        const SizedBox(height: 8.0),
                        SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: Image.asset("assets/jalpenoAdd.png")),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: tomchkBox,
                            onChanged: (val) {
                              setState(() {
                                tomchkBox = val!;
                              });
                            },
                            splashRadius: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //add olive card
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text("Add Olive"),
                        const SizedBox(height: 8.0),
                        SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: Image.asset("assets/jalpenoAdd.png")),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: olvchkBox,
                            onChanged: (val) {
                              setState(() {
                                olvchkBox = val!;
                              });
                            },
                            splashRadius: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Button to place order
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 116, 0, 0))),
                  onPressed: () {},
                  child: const Text("Place Order")),
            )
          ],
        ),
      ),
    );
  }
}
