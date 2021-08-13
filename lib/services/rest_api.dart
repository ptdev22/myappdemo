import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myappdemo/utils/constants.dart';
import 'package:myappdemo/models/Product.dart';

class CallAPI {
  _setHeaders() =>
      {'Content-Type': 'application/json', 'Accept': 'application/json'};

  // Login
  postData(data, apiURL) async {
    var fullURL = baseURLAPILogin + apiURL;
    return await http.post(fullURL,
        body: jsonEncode(data), headers: _setHeaders());
  }

  // ส่วนของการ CRUD Product
  // Get All Products
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(baseURLAPIProduct + "products", headers: _setHeaders());
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
  }

  // Create Products
  Future<bool> creatProduct(Product data) async {
    print(data);
    final response = await http.post(baseURLAPIProduct + "products",
        headers: _setHeaders(), body: productToJson(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Update Products
  Future<bool> updateProduct(Product data) async {
    final response = await http.put(
      baseURLAPIProduct + "products/${data.id}",
      headers: _setHeaders(),
      body: productToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Delete Products
  Future<bool> deleteProduct(int id) async {
    final response = await http.delete(baseURLAPIProduct + "products/$id",
        headers: _setHeaders());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
