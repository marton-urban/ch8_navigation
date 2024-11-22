import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yummy/models/restaurant.dart';
import 'package:yummy/models/user.dart';
import 'package:yummy/screens/account_page/account_page.dart';
import 'package:yummy/screens/explore_page/explore_page.dart';
import 'package:yummy/screens/orders_page/orders_page.dart';
import 'package:yummy/screens/restaurant_page/restaurant_page.dart';
import 'package:yummy/screens/sign_in_page/sign_in_page.dart';
import '../../components/scaffold_with_nav_bar.dart';
import '../../screens/providers/auth_state/auth_state_provider.dart';
import 'route_names.dart';
part 'router_provider.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final loggedIn = authState.unwrapPrevious().valueOrNull ?? false;
      final isOnLoginPage = state.matchedLocation == '/login';

      // Go to /login if the user is not signed in
      if (!loggedIn) {
        return '/login';
      }
      // Go to root of app / if the user is already signed in
      else if (loggedIn && isOnLoginPage) {
        return '/explore';
      }

      // no redirect
      return null;
    },
    routes: [
      GoRoute(
          path: '/login',
          name: RouteNames.login,
          builder: (context, state) {
            return SignInPage();
          }),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/explore',
                name: RouteNames.explore,
                builder: (context, state) {
                  return ExplorePage();
                },
                routes: [
                  GoRoute(
                      path: 'restaurant/:id',
                      name: RouteNames.restaurant,
                      builder: (context, state) {
                        final id =
                            int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
                        final restaurant = restaurants[id];
                        return RestaurantPage(
                          restaurant: restaurant,
                        );
                      }),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/myorders',
                name: RouteNames.myorders,
                builder: (context, state) {
                  return OrdersPage();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/account',
                name: RouteNames.account,
                builder: (context, state) {
                  return AccountPage(
                      user: User(
                          firstName: 'Stef',
                          lastName: 'P',
                          role: 'Flutteristas',
                          profileImageUrl:
                              'assets/profile_pics/person_stef.jpeg',
                          points: 100,
                          darkMode: true));
                },
              ),
            ],
          ),
        ],
      ),
      // GoRoute(
      //     path: '/:tab',
      //     name: RouteNames.tab,
      //     builder: (context, state) {
      //       return Home(
      //           tab: int.tryParse(state.pathParameters['tab'] ?? '') ?? 0);
      //     },
      // ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}
