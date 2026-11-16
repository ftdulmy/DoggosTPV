import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    // Aquí se deben de poner las pantallas que se van a mostrar en el BottomNavigationBar
    // ProductsScreen(
    //   productsService: _productsService,
    //   productByIdService: _productByIdService,
    // ),
    // ShopingCartScreen(
    //   shoppingCartsService: _shoppingCartsService,
    //   cartService: _shoppingCartService,
    //   userService: _userByIdService,
    // ),
  ];

  final List<BottomNavigationBarItem> items = const [
    // Estos son los icons que aparecen en el bottom navigation bar
    BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Productos'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
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
