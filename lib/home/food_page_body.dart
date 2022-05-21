import 'package:flutter/material.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      //  color: Colors.redAccent,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: ((context, position) {
          return _buildPageItem(position);
        }),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    // PageView Tranformation Slider.....
    Matrix4 matrix = Matrix4.identity(); // x , y , z co-ordinate
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    // PageView Transformation Slider End...........

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven
                ? const Color(0XFF69c5df)
                : const Color(0XFF9294cd),
            image: const DecorationImage(
              image: AssetImage("assets/images/food0.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: AppColors.mainColor, size: 15))),
                      const SizedBox(width: 10),
                      SmallText(text: "4.6"),
                      const SizedBox(width: 10),
                      SmallText(text: "1287"),
                      const SizedBox(width: 10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          icon: Icons.circle,
                          iconColor: AppColors.iconColor1,
                          text: "Normal",
                          color: AppColors.textColor),
                      IconAndText(
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor,
                          text: "1.75km",
                          color: AppColors.textColor),
                      IconAndText(
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor2,
                          text: "Normal",
                          color: AppColors.textColor),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
