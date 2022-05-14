import 'package:flutter/material.dart';
import 'package:pizza_app/Screens/customPizza.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> Images = [
    "assets/olive_pizza.png",
    "assets/mix_vegie_pizza.png",
    "assets/tomato_onion_pizza.png",
    "assets/chicken_pizza.png",
    "assets/mix_vegie_pizza.png",
    "assets/tomato_onion_pizza.png",
    "assets/olive_pizza.png",
    "assets/chicken_pizza.png",
    "assets/mix_vegie_pizza.png",
    "assets/tomato_onion_pizza.png",
    "assets/chicken_pizza.png",
    "assets/olive_pizza.png",
    "assets/tomato_onion_pizza.png",
    "assets/mix_vegie_pizza.png"
  ];

  List<String> Names = [
    "olive pizza",
    "mix vegie pizza",
    "tomato onion pizza",
    "chicken pizza",
    "mix vegie pizza",
    "tomato onion pizza",
    "olive pizza",
    "chicken pizza",
    "mix vegie pizza",
    "tomato onion pizza",
    "chicken pizza",
    "olive pizza",
    "tomato onion pizza",
    "mix vegie pizza"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your Pizza PlayList",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.white,
        child: GridView.builder(
          itemBuilder: (context, index) =>
              PizzaCard(context, Images[index], Names[index]),
          itemCount: 14,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height * 0.74),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget PizzaCard(BuildContext context, String image, String name) => Card(
      color: const Color.fromARGB(255, 116, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.hardEdge,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 4.0),

            //Pizza image in card.
            SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8.0),

            //Pizza name.
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 4.0),
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),

            const SizedBox(height: 8.0),

            //Putting two button in row.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
              child: SizedBox(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                          color: Colors.white,
                          child: SizedBox(
                              height: 40.0,
                              child: InkWell(
                                  child: Icon(Icons.dashboard_customize),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomizePizza(
                                                  pizzaimage: image,
                                                )));
                                  }))),
                    ),
                    Expanded(
                      child: Card(
                          color: Colors.white,
                          child: SizedBox(
                            height: 40.0,
                            child: InkWell(
                              child: const Icon(
                                Icons.shopping_cart,
                              ),
                              onTap: () {},
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
