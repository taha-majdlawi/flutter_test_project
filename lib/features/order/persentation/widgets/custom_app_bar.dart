import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/core/utils/assets.dart';
import 'package:flutter_test_project/core/utils/helper.dart';
import 'package:flutter_test_project/core/widgets/order_number_text.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image.asset(AppAssets.drawer, width: 31, height: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95.0, top: 50),
                child: Image.asset(AppAssets.logo, width: 123, height: 80),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Image.asset(AppAssets.cancel, width: 24, height: 24),
              ),
              GestureDetector(
                child: Image.asset(
                  AppAssets.arrow_forword,
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  if (Helper.currentProductNameTextFeildIsEmpty == true ||
                      Helper.currentProductQuantityTextFeildIsEmpty == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Row ${Helper.currentProductTextFeildsIndex+1} have some empty fields'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    GoRouter.of(context).push(AppRouter.kOrderSettingScreen);
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomOrderNumberText(orderNumber: 112096),
          ),
        ],
      ),
    );
  }
}
