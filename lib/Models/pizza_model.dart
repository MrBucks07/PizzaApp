// Pizza Model

class Pizza {
  final int pizza_id;
  final String pizza_name;
  final String pizza_image;
  final int pizza_price;
  bool favourite;

  Pizza(
      {required this.pizza_id,
      required this.pizza_name,
      required this.pizza_image,
      required this.pizza_price,
      required this.favourite});
}
