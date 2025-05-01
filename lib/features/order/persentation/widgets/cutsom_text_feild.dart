import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order/data/models/product.dart';
import 'package:flutter_test_project/features/order/data/repos/product_client.dart';
import 'package:flutter_test_project/features/order/data/repos/product_clint_implemnt.dart';
import 'package:dio/src/dio.dart';
class CustomTextFeilds extends StatefulWidget {
  const CustomTextFeilds({
    super.key,
    
  });

  @override
  State<CustomTextFeilds> createState() => _CustomTextFeildsState();
}

class _CustomTextFeildsState extends State<CustomTextFeilds> {
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Color(0xff006B83), width: 1),
            ),
          ),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff006B83), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff006B83), width: 1),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: TextField(
                key: _textFieldKey,
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff006B83), width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff006B83), width: 1),
                  ),
                  border: InputBorder.none,
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
        ),
      ],
    );
    
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
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

}
