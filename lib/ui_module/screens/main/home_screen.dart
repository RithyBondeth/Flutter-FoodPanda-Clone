import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/category/list_constant.dart';
import 'package:foodpanda_app/ui_module/constants/filter/filter_list_constant.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/widgets/buttons/custom_normal_button.dart';
import 'package:foodpanda_app/ui_module/widgets/cards/custom_restaurant_card.dart';
import 'package:foodpanda_app/ui_module/widgets/utils/custom_appbar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedSortValue = 1;
  bool _isSortValueSelected = false;

  List<bool> _selectedCuisines =
      List.generate(cuisinesList.length, (_) => false);

  List<bool> _selectedOffers = List.generate(offersList.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          const CustomAppbar(),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: secondaryColor),
                child: Column(
                  children: [
                    _buildCategoryBox(),
                    Divider(color: greyColor),
                    _buildFilterBox(),
                    _buildHorizontalFoodList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================================> Category Button Groups Section <=================================
  Widget _buildCategoryBox() {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        categoryList[index].icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categoryList[index].label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  // ==============================> END Category Button Groups Section <==============================

  // ================================> Filter Button Groups Section <==================================
  Widget _buildFilterBox() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 40,
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            _buildFilterButton(
              noLabel: true,
              icon: Icons.tune,
              onTap: () => _buildFilterBS(),
            ),
            _buildFilterButton(
              label: "Sort",
              icon: Icons.arrow_drop_down,
              onTap: () => _buildSortByBottomSheet(),
            ),
            _buildFilterButton(
              label: "Cuisines",
              icon: Icons.arrow_drop_down,
              onTap: () => _buildCuisinesBottomSheet(),
            ),
            _buildFilterButton(
              label: "Offers",
              icon: Icons.arrow_drop_down,
              onTap: () => _buildOffersBottomSheet(),
            ),
            _buildFilterButton(
              label: "Ratings 4.0+",
              noIcon: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
  // ==============================> END Filter Button Groups Section <================================

  // ==================================> Filter BottomSheet Section <==================================
  _buildFilterBS() {
    return showMaterialModalBottomSheet(
      bounce: true,
      backgroundColor: secondaryColor,
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setModalState) {
        return SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  _buildFilterHeaderBox(),
                  Divider(color: greyColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        children: [
                          _buildSortFilterBox(setModalState),
                          _buildOffersFilterBox(setModalState),
                          _buildCuisinesFilterBox(setModalState),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: greyColor),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomNormalButton(
                        backgroundColor: primaryColor,
                        color: secondaryColor,
                        label: "Apply",
                        onTap: () {}),
                  ),
                ],
              )),
        );
      }),
    );
  }

  Widget _buildFilterHeaderBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                "Filter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          _isSortValueSelected |
                  _selectedCuisines.contains(true) |
                  _selectedOffers.contains(true)
              ? InkWell(
                  onTap: () {
                    _selectedSortValue = 1;
                    _isSortValueSelected = false;
                    _selectedCuisines =
                        _selectedCuisines.map((item) => item = false).toList();
                    _selectedOffers =
                        _selectedOffers.map((item) => item = false).toList();
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Clear",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildSortFilterBox(void Function(void Function()) setModalState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: StickyHeader(
        header: Container(
          width: double.infinity,
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Sort",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        content: Column(
          children: [
            ...sortList.map(
              (item) => ((RadioListTile.adaptive(
                contentPadding: EdgeInsets.only(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 10,
                ),
                controlAffinity: ListTileControlAffinity.trailing,
                value: item.value,
                groupValue: _selectedSortValue,
                title: Text(item.label),
                activeColor: primaryColor,
                onChanged: (value) {
                  setModalState(() {
                    _selectedSortValue = value as int;
                    _isSortValueSelected =
                        value == 2 || value == 3 ? true : false;
                  });
                },
              ))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffersFilterBox(void Function(void Function()) setModalState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: StickyHeader(
        header: Container(
          width: double.infinity,
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Offers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        content: Column(
          children: [
            for (int index = 0; index < offersList.length; index++)
              CheckboxListTile.adaptive(
                contentPadding: EdgeInsets.all(0),
                title: Text(offersList[index].label),
                value: _selectedOffers[index],
                activeColor: primaryColor,
                onChanged: (value) {
                  setModalState(() {
                    _selectedOffers[index] = value as bool;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCuisinesFilterBox(void Function(void Function()) setModalState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: StickyHeader(
        header: Container(
          width: double.infinity,
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "Cuisines",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        content: Column(
          children: [
            for (int index = 0; index < cuisinesList.length; index++)
              CheckboxListTile.adaptive(
                contentPadding: EdgeInsets.only(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                ),
                title: Text(
                  cuisinesList[index].label,
                  style: TextStyle(fontSize: 15),
                ),
                activeColor: primaryColor,
                value: _selectedCuisines[index],
                onChanged: (value) {
                  setModalState(() {
                    _selectedCuisines[index] = value as bool;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
  // ================================> END Filter BottomSheet Section <================================

  // ==================================> SortBy BottomSheet Section <==================================
  _buildSortByBottomSheet() {
    return showMaterialModalBottomSheet(
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      bounce: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort by",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        _isSortValueSelected
                            ? InkWell(
                                onTap: () {
                                  _selectedSortValue = 1;
                                  _isSortValueSelected = false;
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Clear",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      ...sortList.map(
                        (item) => (RadioListTile.adaptive(
                          value: item.value,
                          title: Text(item.label),
                          groupValue: _selectedSortValue,
                          activeColor: primaryColor,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (value) {
                            setModalState(() {
                              _selectedSortValue = value as int;
                              _isSortValueSelected =
                                  value == 2 || value == 3 ? true : false;
                            });
                          },
                        )),
                      )
                    ],
                  ),
                  Divider(color: greyColor),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                    child: CustomNormalButton(
                      backgroundColor: primaryColor,
                      color: secondaryColor,
                      label: "Apply",
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
  // ================================> END SortBy BottomSheet Section <==================================

  // ==================================> Cuisines BottomSheet Section <==================================
  _buildCuisinesBottomSheet() {
    return showMaterialModalBottomSheet(
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      bounce: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cuisines",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          _selectedCuisines.contains(true)
                              ? InkWell(
                                  onTap: () {
                                    _selectedCuisines = _selectedCuisines
                                        .map((item) => item = false)
                                        .toList();
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      "Clear",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        cursorColor: accentGreyColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: greyColor,
                          hintText: "Search for cuisines",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: accentGreyColor,
                          ),
                          contentPadding: EdgeInsets.only(top: 12),
                          prefixIcon:
                              Icon(Icons.search, color: accentGreyColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(color: greyColor),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: cuisinesList.length,
                    itemBuilder: (context, index) => CheckboxListTile.adaptive(
                      title: Text(
                        cuisinesList[index].label,
                        style: TextStyle(fontSize: 15),
                      ),
                      activeColor: primaryColor,
                      value: _selectedCuisines[index],
                      onChanged: (value) {
                        setModalState(() {
                          _selectedCuisines[index] = value as bool;
                        });
                      },
                    ),
                  ),
                ),
                Divider(color: greyColor),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: CustomNormalButton(
                    backgroundColor: primaryColor,
                    color: secondaryColor,
                    label: "Apply",
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // ================================> END Cuisines BottomSheet Section <=================================

  // ====================================> Offers BottomSheet Section <===================================
  _buildOffersBottomSheet() {
    return showMaterialModalBottomSheet(
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      bounce: true,
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setModalState) => Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offers",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      _selectedOffers.contains(true)
                          ? InkWell(
                              onTap: () {
                                _selectedOffers = _selectedOffers
                                    .map((item) => item = false)
                                    .toList();
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Clear",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    for (int index = 0; index < offersList.length; index++)
                      CheckboxListTile.adaptive(
                        title: Text(offersList[index].label),
                        value: _selectedOffers[index],
                        activeColor: primaryColor,
                        onChanged: (value) {
                          setModalState(() {
                            _selectedOffers[index] = value as bool;
                          });
                        },
                      )
                  ],
                ),
                Divider(color: greyColor),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: CustomNormalButton(
                    backgroundColor: primaryColor,
                    color: secondaryColor,
                    label: "Apply",
                    onTap: () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
// ===================================> END Offers BottomSheet Section <=====================================

// ======================================> Custom Filter Box Section <=======================================
  Widget _buildFilterButton({
    String label = "",
    bool noIcon = false,
    bool noLabel = false,
    IconData? icon,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: accentGreyColor),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 5, noLabel ? 15 : 10, 5),
              child: Row(
                children: [
                  noLabel ? SizedBox() : Text(label),
                  noLabel | noIcon ? SizedBox() : SizedBox(width: 5),
                  noIcon ? SizedBox() : Icon(icon),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  // ====================================> END Custom Filter Box Section <=======================================

  // ======================================> Horizontal Food Card Section <=======================================
  Widget _buildHorizontalFoodList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New arrivals up to 50% off",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: CustomRestaurantCard(
                      restaurantName: "Freedom Burger (Chomkadong)",
                      restaurantPoster:
                          "https://images.deliveryhero.io/image/fd-kh/Products/3333039.jpg?width=%s",
                      restaurantRating: 4.5,
                      restaurantOrdered: 30,
                      restaurantCategory: "Burgers",
                      deliveryTime: "30 - 40 min",
                      deliveryPrice: 1.05),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// ====================================> END Horizontal Food Card Section <=======================================

