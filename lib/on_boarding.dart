import 'package:flutter/material.dart';
import 'package:smart/app_image.dart';
import 'package:smart/helper_methods.dart';
import 'package:smart/home.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    _Model(
        title: "Welcome to\nSmart Center",
        desc:
        "Discover a wide variety of denim dummies and customizations for all levels, from primary to high school.",
        image: "on_boarding1.jpg"),
    _Model(
        title: "Specialized Teachers",
        desc:
        "Learn from the best teachers in a variety of subjects, and get individual support to help you achieve your academic goals.",
        image: "on_boarding2.jpg"),
    _Model(
        title: "Various Subjects",
        desc:
        "Enjoy the variety of subjects we offer, from math to languages and science, and prepare for success in your studies.",
        image: "on_boarding3.jpg"),
  ];
  int currentPage = 0;
  final pageController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: list.length,
                  onPageChanged: (value) {
                    currentPage = value;
                    setState(() {});
                  },
                  itemBuilder: (context, index) => AppImage(
                    list[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    list.length,
                        (index) => Padding(
                      padding: EdgeInsetsDirectional.only(end: 8),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: currentPage == index
                            ? Colors.blue[900]
                            : Color(0xffD9D9D9),
                      ),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      list[currentPage].title,
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      list[currentPage].desc,
                      style: TextStyle(fontSize: 18, color: Color(0xff7E7E7E)),
                    )),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    if (currentPage != list.length - 1)
                      TextButton(
                        onPressed: () {
                          navigateTo(HomeView());
                        },
                        child: Text("Skip",style: TextStyle(color: Colors.blue[900]),),
                      ),
                    Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.blue[900],
                      onPressed: () {

                        if(currentPage==list.length-1){
                          navigateTo(HomeView());
                        }else{
                          pageController.nextPage(
                              duration: Duration(milliseconds: 650),
                              curve: Curves.linear);
                        }
                      },
                      child: AppImage("arrow_forword.svg"),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          )),
    );
  }
}
class _Model {
  final String image, title, desc;

  _Model({
    required this.image,
    required this.title,
    required this.desc,
  });
}

