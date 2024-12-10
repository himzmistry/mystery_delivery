import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mystery_delivery/custom_widgets/custom_textfield.dart';
import 'package:mystery_delivery/custom_widgets/custom_widgets.dart';
import 'package:mystery_delivery/utils/util_helper.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import '../custom_widgets/persistantSliverDeligate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController();
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: floatingButton(),
          backgroundColor: AppColors.white,
          body: Column(
            children: [
              scrollView(safePadding),
              // Text('navigation bar')
            ],
          )),
    );
  }

  floatingButton() => Stack(
        children: [
          CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 25.r,
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.white,
              )),
          Positioned(
            right: 10.0,
            top: 4.0,
            child: CircleAvatar(
              radius: 9.r,
              backgroundColor: AppColors.secondaryColor,
              child: Text(
                '2',
                style: normalTextStyle(fontSize: 12.sp, color: AppColors.searchBarColor),
              ),
            ),
          ),
        ],
      );

  scrollView(safePadding) => SizedBox(
        height: UtilHelper.getHeight(context) - safePadding,
        // - 50,
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverAppBar(
            //   automaticallyImplyLeading: false,
            //   pinned: _pinned,
            //   snap: _snap,
            //   floating: _floating,
            //   backgroundColor: AppColors.white,
            //   flexibleSpace: FlexibleSpaceBar(
            //     background: appBar(),
            //   ),
            // ),
            SliverToBoxAdapter(
                // todo implement UI
                child: addressContainer()),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                  minHeight: 75,
                  maxHeight: 35,
                  // todo UI
                  child: searchWidget()
                  // yourOneWordText(),

                  ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 16, top: 10.h),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 6.0,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 8.w, right: 8.w),
                      width: 100.0,
                      height: 100.0,
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: boxShadow(),
                          color: AppColors.cardBgColor,
                          borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          productImage(),
                          verticalBox(height: 5),
                          productTitle(),
                          verticalBox(height: 5),
                          productPrice(),
                        ],
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      );

  productPrice() => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          children: [
            Text(
              '${UtilHelper.getRupee()} 50',
              style: normalTextStyle(color: AppColors.primaryColor),
            ),
            Spacer(),
            submitButton(
                text: 'Add',
                textStyle: normalTextStyle(fontSize: 11.sp, color: AppColors.searchBarColor),
                buttonColor: AppColors.secondaryColor,
                width: 60.w,
                height: 25.h)
          ],
        ),
      );

  productImage() => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.network(
            'https://picsum.photos/seed/picsum/200/300',
            width: 100.w,
            height: 100.w,
            fit: BoxFit.cover,
          ),
        ),
      );

  productTitle() => Center(
        child: Text(
          'Navneet Note book',
          style: normalTextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        ),
      );

  addressContainer() => Container(
        padding: EdgeInsets.only(top: 10.0.h, left: 8.0.w),
        color: AppColors.searchBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.location_pin),
            horizontalBox(),
            Text(
              '19 B, Swarg bhoomie bunglows \nparnera pardi, valsad - 396001',
              style: normalTextStyle(),
            ),
          ],
        ),
      );

  searchWidget() => Container(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
        color: AppColors.searchBarColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(22.0.r)),
              height: 50.0,
              child: CustomTextField(
                iconData: Icons.search,
                controller: searchCtrl,
                hintText: 'Search for "note books"',
                showBorder: true,
              ),
            ),
          ],
        ),
      );

  appBar() => Container(
        color: AppColors.bodyBgColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: 40,
                // width: 90,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
                child: Text('data')),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  width: 40.0,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.ac_unit_sharp)),
            ),
          ],
        ),
      );
}
