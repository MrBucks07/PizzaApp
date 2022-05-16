import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/Controllers/pizzaController.dart';

class HomeScreen extends StatelessWidget {
  // controller for getting data of pizzas
  final pizzaController = Get.put(PizzaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Pizza App",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          // user location or addreess
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_history,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 163, 229, 255),
        child: Column(
          children: [
            // list view for pizzas
            Expanded(child: GetBuilder<PizzaController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: controller.pizzas.length,
                  itemBuilder: ((context, index) =>
                      pizzaCard(controller, index)),
                ),
              );
            }))
          ],
        ),
      ),
      // floating cart button
      floatingActionButton: GetX<PizzaController>(builder: (controller) {
        return FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 163, 229, 255),
          onPressed: () {},
          icon: const Icon(
            Icons.add_shopping_cart,
            color: Colors.black,
          ),
          label: Text(
            controller.totalItems.toString(),
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  // pizza card widget
  Widget pizzaCard(PizzaController controller, int index) => Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 10.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // pizza image
                  Expanded(
                    child: SizedBox(
                      height: 160.0,
                      child: Image.asset(
                        controller.pizzas[index].pizza_image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: 160.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // pizza name
                              Text(
                                controller.pizzas[index].pizza_name,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              // pizza price
                              Text(
                                "Price : ${controller.pizzas[index].pizza_price}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // customize icon button
                                  Expanded(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons
                                              .dashboard_customize_outlined))),
                                  // favourite icon button
                                  Expanded(
                                      child: IconButton(
                                          onPressed: () {
                                            controller.addAsFavourite(controller
                                                .pizzas[index].pizza_id);
                                          },
                                          icon: Icon(
                                            controller.pizzas[index].favourite
                                                ? Icons.favorite_rounded
                                                : Icons.favorite_outline,
                                            color: Colors.red,
                                          )))
                                ],
                              ),
                              // add to cart button
                              SizedBox(
                                child: OutlinedButton.icon(
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(width: 1.0)),
                                        overlayColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 163, 229, 255))),
                                    onPressed: () {
                                      controller
                                          .addToCart(controller.pizzas[index]);
                                    },
                                    icon: const Icon(
                                        Icons.add_shopping_cart_sharp),
                                    label: const Text("Add to Cart")),
                              )
                            ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
