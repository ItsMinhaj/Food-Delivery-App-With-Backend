import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: ((context, position) {
          return _buildPageItem(position);
        }),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: index.isEven ? const Color(0XFF69c5df) : const Color(0XFF9294cd),
        image: const DecorationImage(
          image: AssetImage("assets/images/food0.png"),
        ),
      ),
    );
  }
}
