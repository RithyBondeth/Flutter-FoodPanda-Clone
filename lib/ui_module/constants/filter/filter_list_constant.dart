//SortBy List
class Sort {
  late int id;
  late String label;
  late int value;

  Sort({required this.id, required this.label, required this.value});
}

List<Sort> sortList = [
  Sort(id: 1, label: "Relavance (default)", value: 1),
  Sort(id: 2, label: "Fast Delivery", value: 2),
  Sort(id: 3, label: "Distance", value: 3),
];

//Cuisines List
class Cuisines {
  late int id;
  late String label;
  Cuisines({required this.id, required this.label});
}

List<Cuisines> cuisinesList = [
  Cuisines(id: 1, label: "African"),
  Cuisines(id: 2, label: "American"),
  Cuisines(id: 3, label: "Asian"),
  Cuisines(id: 4, label: "BBQ/Skewers"),
  Cuisines(id: 5, label: "Beverages"),
  Cuisines(id: 6, label: "Bread"),
  Cuisines(id: 7, label: "Burgers"),
  Cuisines(id: 8, label: "Cakes & Bakery"),
  Cuisines(id: 9, label: "Cambodian"),
  Cuisines(id: 10, label: "Chicken"),
  Cuisines(id: 11, label: "Chinese"),
  Cuisines(id: 12, label: "Chinese BBQ"),
  Cuisines(id: 13, label: "Congee"),
  Cuisines(id: 14, label: "Curry"),
  Cuisines(id: 15, label: "Desserts"),
  Cuisines(id: 16, label: "Dim Sum"),
  Cuisines(id: 17, label: "Dumpling"),
  Cuisines(id: 18, label: "Fast Food"),
  Cuisines(id: 19, label: "Frappe & Smoothies"),
  Cuisines(id: 20, label: "French"),
  Cuisines(id: 21, label: "Fried Chicken"),
  Cuisines(id: 22, label: "Fruit Juice"),
  Cuisines(id: 23, label: "Grilled Meat"),
  Cuisines(id: 24, label: "Halal"),
  Cuisines(id: 25, label: "Healthy Food"),
  Cuisines(id: 26, label: "Hot Pot"),
  Cuisines(id: 27, label: "Ice Cream"),
  Cuisines(id: 28, label: "Indian"),
  Cuisines(id: 29, label: "Indonesia"),
  Cuisines(id: 30, label: "International"),
  Cuisines(id: 31, label: "Italian"),
  Cuisines(id: 32, label: "Japanese"),
  Cuisines(id: 33, label: "Kebab"),
  Cuisines(id: 34, label: "Korean"),
  Cuisines(id: 35, label: "Lot Chha"),
  Cuisines(id: 36, label: "Malaysian"),
  Cuisines(id: 37, label: "Meat"),
  Cuisines(id: 38, label: "Meatball"),
  Cuisines(id: 39, label: "Mexican"),
  Cuisines(id: 40, label: "Middle Eastern"),
  Cuisines(id: 41, label: "Milk Tea"),
  Cuisines(id: 42, label: "Noodles"),
  Cuisines(id: 43, label: "Num Banh Chok - Khmer Noodle"),
  Cuisines(id: 44, label: "Pasta"),
  Cuisines(id: 45, label: "Pho"),
  Cuisines(id: 46, label: "Pizza"),
  Cuisines(id: 47, label: "Ramen"),
  Cuisines(id: 48, label: "Rice Dishes"),
  Cuisines(id: 49, label: "Rice Noodle"),
  Cuisines(id: 50, label: "Roasted Meat"),
  Cuisines(id: 51, label: "Salads"),
  Cuisines(id: 52, label: "Sandwiches"),
  Cuisines(id: 53, label: "Seafood"),
  Cuisines(id: 54, label: "Singaporean"),
  Cuisines(id: 55, label: "Snacks"),
  Cuisines(id: 56, label: "Soups"),
  Cuisines(id: 57, label: "Sour Fruit"),
  Cuisines(id: 58, label: "Spicy Salad"),
  Cuisines(id: 59, label: "Steak"),
  Cuisines(id: 60, label: "Sushi"),
  Cuisines(id: 61, label: "Tea & Coffee"),
  Cuisines(id: 62, label: "Thai"),
  Cuisines(id: 63, label: "Turkish"),
  Cuisines(id: 64, label: "Udon"),
  Cuisines(id: 65, label: "Vegan"),
  Cuisines(id: 66, label: "Vegetarian"),
  Cuisines(id: 67, label: "Vietnamese"),
  Cuisines(id: 68, label: "Western")
];

class Offers {
  late int id;
  late String label;

  Offers({required this.id, required this.label});
}

List<Offers> offersList = [
  Offers(id: 1, label: "Free Delivery"),
  Offers(id: 2, label: "Deal"),
  Offers(id: 3, label: "Accepts vouchers")
];
