class AppPricingCalculator {
  /// Calculate total price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);

    return productPrice + taxAmount + shippingCost;
  }

  /// Calculate shipping cost as a formatted string
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// Calculate tax as a formatted string
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  /// Get tax rate for a location (can be updated to fetch real-time data)
  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.10; // Example tax rate of 10%
  }

  /// Get shipping cost for a location
  static double getShippingCost(String location) {
    // Lookup the shipping cost for the given location using a shipping rate API.
    // Calculate the shipping cost based on various factors like distance, weight, etc.
    return 5.00; // Example shipping cost of $5
  }

  /// Sum all cart values and return total amount
  static double calculateCartTotal(CartModel cart) {
    return cart.items
        .map((e) => e.price)
        .fold(0, (previousPrice, currentPrice) => previousPrice + currentPrice);
  }
}

/// Example CartModel class
class CartModel {
  final List<CartItem> items;

  CartModel({required this.items});
}

/// Example CartItem class
class CartItem {
  final double price;

  CartItem({required this.price});
}
