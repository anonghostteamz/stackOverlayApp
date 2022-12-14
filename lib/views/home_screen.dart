import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_project_app/controller/home_page_controller.dart';
import 'package:test_project_app/views/bottom_bar_widget.dart';
import 'CategoriesScroller.dart';

class HomeScreen extends StatelessWidget {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  final animatedListKey = GlobalKey<AnimatedListState>();
  final HomePageController controller = Get.put(HomePageController());
  HomeScreen({super.key});

  Future<bool> _onWillPop() async {
    print("onPop Called");
    // controller.removeAboveStackItem(controller.itemsDataFilling.length -2 >= 0 ? controller.itemsDataFilling.length -2 : 0, animatedListKey);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if(controller.itemsDataFilling.isEmpty) {
      controller.addInitialDataToStack(context);
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: const Color(0xff121419),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff121419),
          leading: const Icon(
            Icons.cancel,
            color: Colors.grey,
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(Icons.search, color: Colors.black),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.question_mark_rounded, color: Colors.grey),
              onPressed: () {},
            )
          ],
        ),
        body: Stack(
          // clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height,
              // child: Stack(
              //   children: <Widget>[
              //     // Expanded(
              //     //   child:
              //     //   Obx(() => AnimatedList(
              //     //     key: animatedListKey,
              //     //     initialItemCount: controller.itemsDataFilling.length,
              //     //     // physics: const NeverScrollableScrollPhysics(),
              //     //     //  clipBehavior: Clip.none,
              //     //     // scrollDirection: Axis.vertical,
              //     //     shrinkWrap: true,
              //     //     itemBuilder: (context, index, animation) => widgetListItem(context, index, animation),
              //     //   ),
              //     //   ),
              //     // ),
              //
              //   ],
              child: Stack(
              children: controller.itemsDataFilling.value,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(animatedListKey),
            )
          ],
        ),
      ),
    );
    // return Scaffold(body: addMoneyToWallet());
  }

  Widget widgetListItem(BuildContext context, int index, animation) {
    return
      // ScaleTransition(scale: animation,
      SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(0.0, 3.0), end: const Offset(0.0, 0.0)),
      ),
      // Simply display the letter.
      //controller.removeAboveStackItem(index, animatedListKey);
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          print("tap on index $index");
          // controller.removeAboveStackItem(index, animatedListKey);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Align(
            // heightFactor: 0.2,
            //   heightFactor: 0.1,
              alignment: Alignment.topCenter,
              child: (index >= controller.itemsDataFilling.length) ? Container() : controller.itemsDataFilling[index],
          ),
        ),
        // child: Positioned(
        //   top: 20,
        //   child: (index >= controller.itemsDataFilling.length) ? Container() : controller.itemsDataFilling[index]),
        // child: ColumnSuper(
        //   innerDistance: -20,
        //   children: [
        // (index >= controller.itemsDataFilling.length) ? Container() : controller.itemsDataFilling[index]
        //   ],
        // ),
      ),
    );
  }
}
