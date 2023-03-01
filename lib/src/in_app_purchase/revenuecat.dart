import 'package:purchases_flutter/purchases_flutter.dart';

import 'entitlement.dart';

class RevenueCatProvider {
  static Future getPurchaseStatus() async {
    final purchaseInfo = await Purchases.getCustomerInfo();
    final entitlements = purchaseInfo.entitlements.active.values.toList();
    return entitlements.isEmpty ? Entitlement.free : Entitlement.special;
  }
}
