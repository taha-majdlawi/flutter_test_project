import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/core/utils/app_router.dart';
import 'package:flutter_test_project/features/order/data/models/product.dart';
import 'package:flutter_test_project/features/order/data/repos/product_client.dart';
import 'package:flutter_test_project/features/order/data/repos/product_clint_implemnt.dart';
import 'package:flutter_test_project/features/order/persentation/order_screen.dart';

void main() {
  ProductClintImplemnt productClient = ProductClintImplemnt(productClient: ProductClient(Dio(),baseUrl: 'https://app.giotheapp.com/api-sample/'));
  productClient.getProducts(); 
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),

      routerConfig: AppRouter.router,
    );
  }
}


// void main() {
//   runApp(MaterialApp(home: SuggestionDemo()));
// }

class SuggestionDemo extends StatefulWidget {
  @override
  _SuggestionDemoState createState() => _SuggestionDemoState();
}

class _SuggestionDemoState extends State<SuggestionDemo> {
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final GlobalKey _textFieldKey = GlobalKey();
  List<String> _suggestions = [];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Future<void> _showOverlay() async {
    // 1. Fetch products first
    ProductClintImplemnt productClient = ProductClintImplemnt(
        productClient: ProductClient(Dio(),
            baseUrl: 'https://app.giotheapp.com/api-sample/'));
    List<Product> products = await productClient.getProducts();

    // 2. Update suggestions
    
  _suggestions = products
      .where((p) => p.name
          .toLowerCase()
          .startsWith(_controller.text.toLowerCase()))
      .map((p) => p.name)
      .toList();

   if (_suggestions.length<2) {
  _suggestions += products
     .where((p) => p.name
         .toLowerCase()
         .contains(_controller.text.toLowerCase()))
     .map((p) => p.name)
     .toList();
}

    // 3. Remove old overlay
    _removeOverlay();

    // 4. Create and insert new overlay
    final RenderBox renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy + size.height + 5,
        width: size.width,
        child: Material(
          elevation: 4.0,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: _suggestions.map((suggestion) {
              return ListTile(
                title: Text(suggestion),
                onTap: () {
                  _controller.text = suggestion;
                  _removeOverlay();
                },
              );
            }).toList(),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Suggestions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CompositedTransformTarget(
          link: _layerLink,
          child: TextField(
            key: _textFieldKey,
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              labelText: "Search product",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                _showOverlay();
              } else {
                _removeOverlay();
              }
            },
          ),
        ),
      ),
    );
  }
}