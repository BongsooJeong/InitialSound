import 'package:flutter/material.dart';
import 'package:initialsound/src/constants/const_data.dart';
import 'package:initialsound/src/constants/sizes.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../constants/gaps.dart';

class PaywallWidget extends StatefulWidget {
  const PaywallWidget(
      {Key? key,
      required this.title,
      required this.packages,
      required this.onClickPackage})
      : super(key: key);

  final String title;
  final List<Package> packages;
  final ValueChanged<Package> onClickPackage;

  @override
  State<PaywallWidget> createState() => _PaywallWidgetState();
}

class _PaywallWidgetState extends State<PaywallWidget> {
  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: GameDarkColor,
          borderRadius: BorderRadius.circular(
            Sizes.size6,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v16,
            buildPackages(),
          ]),
        ),
      );

  Widget buildPackages() => ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: widget.packages.length,
        itemBuilder: (context, index) {
          final package = widget.packages[index];
          return buildPackage(context, package);
        },
      );

  Widget buildPackage(BuildContext context, Package package) {
    final product = package.storeProduct;

    return Card(
      color: GamePrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(
          product.title,
          style: TextStyle(
            fontSize: Sizes.size14,
          ),
        ),
        subtitle: Text(
          product.description,
          style: TextStyle(
            fontSize: Sizes.size12,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          product.priceString,
          style: TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.bold,
            color: GameDarkColor,
          ),
        ),
        onTap: () => widget.onClickPackage(package),
      ),
    );
  }
}
