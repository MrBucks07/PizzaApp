import 'package:get/get.dart';
import 'package:pizza_app/Models/pizza_model.dart';

// controller class for fetching and binding ui stuff
class PizzaController extends GetxController {
  // list of pizzas
  List<Pizza> pizzas = <Pizza>[].obs;

  // items in cart
  List<Pizza> cart = <Pizza>[].obs;

  // total price of cart
  double get totalPrice => cart.fold(0, (sum, item) => sum + item.pizza_price);

  // number of items
  int get totalItems => cart.length;

  // add to cart method
  void addToCart(Pizza pizza) {
    cart.add(pizza);
  }

  // first calling init to initialize fetchPizza
  @override
  void onInit() {
    super.onInit();
    fetchPizzas();
  }

  // fetching data from database (here directly defining data for example purposes)
  void fetchPizzas() {
    // delay of fetching (manually giving, if fetching using api no need)
    Future.delayed(const Duration(seconds: 2));

    // server response
    List<Pizza> serverResponse = [
      Pizza(
          pizza_id: 1,
          pizza_name: "Chicken Pizza",
          pizza_image: "assets/chicken_pizza.png",
          pizza_price: 99,
          favourite: false),
      Pizza(
          pizza_id: 2,
          pizza_name: "Mix Vegie Pizza",
          pizza_image: "assets/mix_vegie_pizza.png",
          pizza_price: 220,
          favourite: false),
      Pizza(
          pizza_id: 3,
          pizza_name: "Olive Pizza",
          pizza_image: "assets/olive_pizza.png",
          pizza_price: 240,
          favourite: false),
      Pizza(
          pizza_id: 4,
          pizza_name: "Tomato Pizza",
          pizza_image: "assets/tomato_onion_pizza.png",
          pizza_price: 120,
          favourite: false),
      Pizza(
          pizza_id: 5,
          pizza_name: "Chicken Pizza",
          pizza_image: "assets/chicken_pizza.png",
          pizza_price: 180,
          favourite: false),
      Pizza(
          pizza_id: 6,
          pizza_name: "Mix Vegie Pizza",
          pizza_image: "assets/mix_vegie_pizza.png",
          pizza_price: 159,
          favourite: false),
      Pizza(
          pizza_id: 7,
          pizza_name: "Olive Pizza",
          pizza_image: "assets/olive_pizza.png",
          pizza_price: 209,
          favourite: false),
      Pizza(
          pizza_id: 8,
          pizza_name: "Tomato Pizza",
          pizza_image: "assets/tomato_onion_pizza.png",
          pizza_price: 109,
          favourite: false),
    ];

    // assigning all values to pizzas list
    pizzas.assignAll(serverResponse);
  }

  // add as favourite method
  void addAsFavourite(int id) {
    var index = pizzas.indexWhere((element) => element.pizza_id == id);
    pizzas[index].favourite = !pizzas[index].favourite;
    update();
  }
}
