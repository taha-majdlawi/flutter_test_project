import 'package:flutter/material.dart';
import 'package:flutter_test_project/features/order/data/models/product.dart';
import 'package:flutter_test_project/features/order/data/repos/product_client.dart';
import 'package:flutter_test_project/features/order/data/repos/product_clint_implemnt.dart';
import 'package:dio/dio.dart';

class CustomTextFeilds extends StatefulWidget {
  const CustomTextFeilds({super.key});

  @override
  State<CustomTextFeilds> createState() => _CustomTextFeildsState();
}

class _CustomTextFeildsState extends State<CustomTextFeilds>
    with AutomaticKeepAliveClientMixin {
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final FocusNode _productFocus = FocusNode();
  final FocusNode _quantityFocus = FocusNode();
  OverlayEntry? _overlayEntry;
  final GlobalKey _textFieldKey = GlobalKey();
  List<String> _suggestions = [];
  String productTextFeildQuantity = '';

  @override
  bool get wantKeepAlive => true;
  
  @override
  void initState() {
    super.initState();

    _productFocus.addListener(() {
      if (!_productFocus.hasFocus) {
        final productText = _productController.text.trim();
        final quantityText = _quantityController.text.trim();

        if (productText.isEmpty && quantityText.isNotEmpty) {
      
          Future.delayed(Duration.zero, () {
            FocusScope.of(context).requestFocus(_productFocus);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You have to fill the product field first.'),
              duration: Duration(seconds: 2),
            ),
          );
        }

        if (productText.isNotEmpty && quantityText.isEmpty) {

          Future.delayed(Duration.zero, () {
            FocusScope.of(context).requestFocus(_quantityFocus);
          });
        }
      }
    });
    _quantityFocus.addListener(() {
      if (!_quantityFocus.hasFocus) {
        final productText = _productController.text.trim();
        final quantityText = _quantityController.text.trim();

        if (productText.isNotEmpty && quantityText.isEmpty) {
          Future.delayed(Duration.zero, () {
            FocusScope.of(context).requestFocus(_quantityFocus);
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You have to fill the quantity field first.'),
              duration: Duration(seconds: 2),
            ),
          );
        }

        if (productText.isEmpty && quantityText.isNotEmpty) {
          Future.delayed(Duration.zero, () {
            FocusScope.of(context).requestFocus(_productFocus);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _productController.dispose();
    _quantityController.dispose();
    _productFocus.dispose();
    _quantityFocus.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            controller: _quantityController,
            focusNode: _quantityFocus,
            textAlign: TextAlign.center,
            onChanged: (value) {
              productTextFeildQuantity = value;
            },
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
          child: CompositedTransformTarget(
            link: _layerLink,
            child: TextField(
              key: _textFieldKey,
              controller: _productController,
              focusNode: _productFocus,
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
      ],
    );
  }

  Future<void> _showOverlay() async {

    ProductClintImplemnt productClient = ProductClintImplemnt(
      productClient: ProductClient(
        Dio(),
        baseUrl: 'https://app.giotheapp.com/api-sample/',
      ),
    );
    List<Product> products = await productClient.getProducts();

    _suggestions =
        products
            .where(
              (p) => p.name.toLowerCase().startsWith(
                _productController.text.toLowerCase(),
              ),
            )
            .map((p) => p.name)
            .toList();

    if (_suggestions.length < 2) {
      _suggestions +=
          products
              .where(
                (p) => p.name.toLowerCase().contains(
                  _productController.text.toLowerCase(),
                ),
              )
              .map((p) => p.name)
              .toList();
    }

    _removeOverlay();

    final RenderBox renderBox =
        _textFieldKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 5,
            width: size.width,
            child: Material(
              elevation: 4.0,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children:
                    _suggestions.map((suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                        onTap: () {
                          _productController.text = suggestion;
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
