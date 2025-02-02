class Category {
  late String icon;
  late String label;

  Category({required this.icon, required this.label});
}

List<Category> categoryList = [
  Category(icon: "assets/categories/offers.png", label: "Offers"),
  Category(icon: "assets/categories/restaurant.png", label: "Restaurants"),
  Category(icon: "assets/categories/pickup.png", label: "Pick-up"),
  Category(icon: "assets/categories/pandasend.png", label: "Pandasend"),
  Category(icon: "assets/categories/voucher.png", label: "Vouchers"),
  Category(
    icon: "assets/categories/toprestaurant.png",
    label: "Top Restaurant",
  ),
];
