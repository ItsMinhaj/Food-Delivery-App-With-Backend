import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utlis/colors.dart';
import 'package:food_delivery/utlis/dimensions.dart';
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
    return Column(
      children: [
        // Slider section
        SizedBox(
          height: Dimensions.pageViewFullContainer,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: ((context, position) {
              return _buildPageItem(position);
            }),
          ),
        ),
        // Dots
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Popular Text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: BigText(text: "Popular")),
              SizedBox(width: Dimensions.width10),
              BigText(text: ".", color: Colors.black26),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "Food pairing", color: Colors.black26),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30),
        SizedBox(
          height: 600,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    children: [
                      // Image section

                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        height: Dimensions.height100,
                        width: Dimensions.width45 * 2,
                        decoration: const BoxDecoration(
                          color: Colors.white38,
                          image: DecorationImage(
                              image: AssetImage("assets/images/food2.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      //  Text Container
                      Expanded(
                        child: Container(
                          // margin: EdgeInsets.only(left: Dimensions.width10),
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          height: Dimensions.height100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(
                                Dimensions.radius20,
                              ),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "Chinese Side"),
                              SizedBox(height: Dimensions.height10),
                              SmallText(
                                text: "With chinese characteristics",
                                color: AppColors.textColor,
                              ),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
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
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(
              left: Dimensions.width05, right: Dimensions.width05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven
                ? const Color(0XFF69c5df)
                : const Color(0XFF9294cd),
            image: const DecorationImage(
              image: AssetImage("assets/images/food1.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(height: Dimensions.height10),
                  Row(
                    children: [
                      Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.height15))),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "4.6"),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "1287"),
                      SizedBox(width: Dimensions.width10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(height: Dimensions.height20),
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
