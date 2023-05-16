import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tradix/presentation/screens/image_categories/views/image_category_mobile_view.dart';

@RoutePage()
class ImageCategoryView extends StatelessWidget {
  const ImageCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        mode: OrientationLayoutBuilderMode.portrait,
        portrait: (context) => const ImageCategoryMobileView(),
      ),
    );
  }
}
