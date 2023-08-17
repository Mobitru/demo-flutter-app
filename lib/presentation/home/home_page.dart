import 'package:flutter/material.dart';
import 'package:flutter_demo_app/consts/colors.dart';
import 'package:flutter_demo_app/consts/sizes.dart';
import 'package:flutter_demo_app/consts/strings.dart';
import 'package:flutter_demo_app/presentation/account/account_page.dart';
import 'package:flutter_demo_app/presentation/common/cart_widget.dart';
import 'package:flutter_demo_app/presentation/common/logo_widget.dart';
import 'package:flutter_demo_app/presentation/login/login_page.dart';
import 'package:flutter_demo_app/presentation/orders/orders_page.dart';
import 'package:flutter_demo_app/presentation/products/products_page.dart';
import 'package:flutter_demo_app/state/auth_state.dart';
import 'package:flutter_demo_app/state/cart_state.dart';
import 'package:flutter_demo_app/state/orders_state.dart';
import 'package:flutter_demo_app/state/products_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _navigationState = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer4<AuthState, CartState, ProductsState, OrdersState>(
        builder: (context, authState, cartState, productsState, ordersState, child) {
      if (!authState.authenticated) {
        return LoginPage(
          showError: authState.error,
          showBiometric: authState.biometric,
        );
      } else {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: _navigationState != 2,
              backgroundColor: Colors.white,
              title: _navigationState != 2
                  ? const LogoWidget()
                  : Center(
                      child: Text(
                        myAccountLabel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.black, height: 1.3),
                      ),
                    ),
              actions: [
                if (_navigationState != 2)
                  Padding(
                    padding: const EdgeInsets.only(right: primaryPadding),
                    child: Center(
                        child: ProductCartWidget(
                      amount: cartState.products.length,
                      callback: () => context.go('/$appNavigationCart'),
                    )),
                  ),
              ],
            ),
            body: [
              ProductsPage(
                products: productsState.products,
                check: (product) => cartState.products.keys.contains(product),
                sorting: productsState.sorting,
                add: cartState.addOrRemoveToCart,
              ),
              OrdersPage(
                orders: ordersState.orders,
                currentOrder: cartState.order,
              ),
              AccountPage(
                user: authState.currentUser!,
                logout: () {
                  authState.logout();
                  cartState.logout();
                  productsState.logout();
                  setState(() {
                    _navigationState = 0;
                  });
                },
                edit: () => context.go('/$appNavigationEdit'),
              )
            ][_navigationState],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: primaryColor,
              currentIndex: _navigationState,
              onTap: (index) => setState(() {
                _navigationState = index;
              }),
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: bottomNavigationHome),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: bottomNavigationOrders),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined), label: bottomNavigationAccount),
              ],
            ),
          ),
        );
      }
    });
  }
}
