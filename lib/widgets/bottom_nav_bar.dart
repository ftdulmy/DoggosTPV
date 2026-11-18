import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:doggos_tpv/screens/orders.dart';
import 'package:doggos_tpv/screens/products.dart';
import 'package:doggos_tpv/screens/create_orders.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;
  final http.Client _httpClient = http.Client();

  // Lo de abajo son los servicios que se van a usar para obtener los datos de la API, pero no se están usando en este momento
  // late final ProductsService _productsService = ProductsService(
  //   productsApi: ProductsApi(httpClient: _httpClient),
  // );
  // late final ProductByIdService _productByIdService = ProductByIdService(
  //   productByIdApi: ProductByIdApi(httpClient: _httpClient),
  // );

  // late final ShoppingCartsService _shoppingCartsService = ShoppingCartsService(
  //   shoppingCartsApi: ShoppingCartsApi(httpClient: _httpClient),
  // );

  // late final ShoppingCartService _shoppingCartService = ShoppingCartService(
  //   shoppingCartApi: ShoppingCartApi(httpClient: _httpClient),
  // );
  // late final UserByIdService _userByIdService = UserByIdService(
  //   userByIdApi: UserByIdApi(httpClient: _httpClient),
  // );

  late final List<Widget> screens = [
    OrdersScreen(),
    ProductsScreen(),
    CreateOrdersScreen(),
  ];

  final List<BottomNavigationBarItem> items = const [
    // Estos son los icons que aparecen en el bottom navigation bar
    BottomNavigationBarItem(icon: Icon(Icons.dining), label: 'Ordenes'),
    BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Crear Orden'),
    BottomNavigationBarItem(icon: Icon(Icons.egg), label: 'Productos'),
  ];

  @override
  void dispose() {
    _httpClient.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}
