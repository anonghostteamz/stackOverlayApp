import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../controller/home_page_controller.dart';
import 'CategoriesScroller.dart';

class RepayMoneyWidget extends StatelessWidget {
  RepayMoneyWidget({Key? key}) : super(key: key);

  final HomePageController controller = Get.put(HomePageController());
  final CategoriesScroller categoriesScroller = const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: const Color(0xff1a1c29), boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Obx((){
              if(controller.itemsDataFilling.length == 2){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "how do you wish to repay?",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20, color: Color(0xff86909a), fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "choose one of our recommended plan or make your\nown",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12, color: Color(0xff414551), fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Obx((){
                          if(controller.itemsDataFilling.length != 2)
                            return Icon(Icons.arrow_downward_sharp, color: Colors.grey,);
                          return Container();
                        })
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    categoriesScroller,
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff5e6671),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(25))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Create your own plan", style: TextStyle(color: Color(0xff5e6671), fontWeight: FontWeight.bold),),
                        )
                    )
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EMI",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16, color: Color(0xff86909a), fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${format.format(4247)} /mo",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Color(0xff414551), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Obx((){
                        if(controller.itemsDataFilling.length != 2)
                          return const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 35,);
                        return Container();
                      })
                    ],
                  ),
                ],
              );
            })
        ));
  }
}
