import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yummy/models/restaurant.dart';
import '../checkout_page/checkout_page.dart';
import '../providers/cart/cart_provider.dart';
import 'widgets/floating_cart_button.dart';
import 'widgets/grid_view_section.dart';
import 'widgets/info_section.dart';
import 'widgets/restaurant_app_bar.dart';

class RestaurantPage extends ConsumerWidget {
  const RestaurantPage({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;
  static const desktopThreshold = 700;
  static const double drawerWidth = 375.0;
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // instead of using scaffoldKey.currentState!.openEndDrawer we used:
  // Scaffold.of(context).openEndDrawer

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final constrainedWidth = (screenWidth > desktopThreshold
            ? screenWidth * largeScreenPercentage
            : screenWidth)
        .clamp(0.0, maxWidth);

    return Scaffold(
      // key: scaffoldKey,
      endDrawer: SizedBox(
        width: drawerWidth,
        child: Drawer(child: CheckoutPage()),
      ),
      floatingActionButton: FloatingCartButton(),
      body: Center(
        child: SizedBox(
          width: constrainedWidth,
          child: CustomScrollView(
            slivers: [
              RestaurantAppBar(restaurant),
              InfoSection(restaurant),
              GridViewSection(restaurant),
            ],
          ),
        ),
      ),
    );
  }
}
