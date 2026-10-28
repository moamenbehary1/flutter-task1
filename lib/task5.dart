

abstract class Product {
  String name;
  int price;

  Product(this.name, this.price);

  int calculateDiscount();

  int get finalPrice => price - calculateDiscount();
}

class Electronics extends Product {
  Electronics(String name, int price) : super(name, price);

  @override
  int calculateDiscount() {
    return (price * 0.10).toInt();
  }
}

class Clothing extends Product {
  Clothing(String name, int price) : super(name, price);

  @override
  int calculateDiscount() {
    return (price * 0.20).toInt();
  }
}

class ShoppingCart {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  bool removeProduct(Product product) {
    return _products.remove(product);
  }

  int get totalPrice {
    int total = 0;
    for (var product in _products) {
      total += product.finalPrice;
    }
    return total;
  }

  void displayCart() {
    if (_products.isEmpty) {
      print('The cart is empty.');
      return;
    }

    for (var product in _products) {
      int discount = product.calculateDiscount();
      int netPrice = product.finalPrice;
      print(
        '${product.name} - Original: ${product.price} | Discount: $discount | Final: $netPrice',
      );
    }
    print('Total Price: $totalPrice');
  }
}
