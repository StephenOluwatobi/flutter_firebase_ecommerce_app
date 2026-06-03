class TPricingCalculator {
  
  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// -- Get Tax Rate based on location
  static double getTaxRateForLocation(String location) {
    // He explicitly mentions adding if/else checks for US and UK in the video
    if (location == 'US') {
      return 0.10; // 10% tax rate
    } else if (location == 'UK') {
      return 0.20; // 20% tax rate
    }
    return 0.10; // Default tax rate
  }

  /// -- Get Shipping Cost based on location
  static double getShippingCost(String location) {
    // He mentions adding checks based on distance, weight, or location
    if (location == 'US') {
      return 5.00;
    } else if (location == 'UK') {
      return 10.00;
    }
    return 5.00; // Default shipping cost
  }

  /// -- Sum all cart values and return total amount
  /// (He mentions "calculate cart total" right at the end of the calculator segment)
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}