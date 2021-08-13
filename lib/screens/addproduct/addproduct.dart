import 'package:flutter/material.dart';
import 'package:myappdemo/models/Product.dart';
import 'package:myappdemo/services/rest_api.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
  Product product;

  AddProductScreen({this.product});
}


class _AddProductScreenState extends State<AddProductScreen> {

  final formKey = GlobalKey<FormState>();
  String productName, productDetail, productBarcode, productQty, productPrice, productImage, productCategory, productStatus;

  bool _isLoading = false;
  CallAPI _apiService = new CallAPI();
  // bool _isFieldNameValid;
  // bool _isFieldEmailValid;
  // bool _isFieldAgeValid;
  TextEditingController _controllerProductName = TextEditingController();
  TextEditingController _controllerProductDetail = TextEditingController();
  TextEditingController _controllerProductBarcode = TextEditingController();
  TextEditingController _controllerProductQty = TextEditingController();
  TextEditingController _controllerProductPrice = TextEditingController();
  TextEditingController _controllerProductImage = TextEditingController();
  TextEditingController _controllerProductStatus = TextEditingController();

  void initState() {
    print(widget.product);
    if (widget.product != null) {
      // _isFieldNameValid = true;
      _controllerProductName.text = widget.product.productName.toString();

      _controllerProductDetail.text = widget.product.productDetail.toString();
      // _isFieldEmailValid = true;
      _controllerProductBarcode.text = widget.product.productBarcode.toString();
      // _isFieldAgeValid = true;
      _controllerProductQty.text = widget.product.productQty.toString();
      
      _controllerProductPrice.text = widget.product.productPrice.toString();

      _controllerProductImage.text = widget.product.productImage.toString();

      _controllerProductStatus.text = widget.product.productStatus.toString();
    }
    super.initState();
  }

  Widget productNameText(){
    return TextFormField(
      controller: _controllerProductName,
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.email, color: Colors.teal, size: 24,),
        // hintText: 'xxx@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product name',
        labelStyle: TextStyle(
          color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 20.0) 
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product name cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productName = value;
      },
      
    );
  }

  Widget productDetialText(){
    return TextFormField(
      controller: _controllerProductDetail,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product detial',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product detail cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productDetail = value;
      },
    );
  }

  Widget productBarcodeText(){
    return TextFormField(
      controller: _controllerProductBarcode,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product barcode',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product barcode cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productBarcode = value;
      },
    );
  }


  Widget productQtyText(){
    return TextFormField(
      controller: _controllerProductQty,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product Qty',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product qty cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productQty = value;
      },
    );
  }

  Widget productPriceText(){
    return TextFormField(
      controller: _controllerProductPrice,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product price',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product price cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productPrice = value;
      },
    );
  }

  Widget productImageText(){
    return TextFormField(
      controller: _controllerProductImage,
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product image',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product image cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productImage = value;
      },
    );
  }

  Widget productCategoryText(){
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product category',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product category cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productCategory= value;
      },
    );
  }
 
  Widget productStatusText(){
    return TextFormField(
      controller: _controllerProductStatus,
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon: Icon(Icons.storage, color: Colors.teal, size: 24,),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product status',
        labelStyle: TextStyle(
              color: Colors.teal, fontSize: 20
        ),
        contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0)
      ),
      validator: (value){
        if(value.isEmpty){
          return "Product status cannot empty";
        }else{
          return null;
        }
      },
      onSaved: (value){
        productStatus = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('Add new product'),
      ),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formKey,
            child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productNameText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productDetialText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productBarcodeText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productQtyText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productPriceText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productImageText(),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   child: productCategoryText(),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productStatusText(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RaisedButton(
                  onPressed: (){
                    
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      print('Validation pass');
                      print('productName=$productName, productDetail=$productDetail');
                      setState(() => _isLoading = true);
                      String product_name = productName.toString();
                      String product_detail = productDetail.toString();
                      String product_barcode = productBarcode.toString();
                      int product_qty = int.parse(productQty.toString());
                      String product_price = productPrice.toString();
                      String product_image = productImage.toString();
                      String product_category = productCategory.toString();
                      int product_status = int.parse(productStatus.toString());
                      // int age = int.parse(_controllerAge.text.toString());

                      // String productName, productDetail, productBarcode, productQty, productPrice, productImage, productCategory, productStatus;
                      Product product =
                          Product(id: null,productName: product_name, productDetail: product_detail, productBarcode : product_barcode , productQty : product_qty, productPrice : product_price, productImage : product_image, productCategory : product_category, productStatus : product_status);
                      if (widget.product == null) {
                        _apiService.creatProduct(product).then((isSuccess) {
                          setState(() => _isLoading = false);
                          print(isSuccess);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context, true);
                            // Navigator.pushReplacement(context, '/')
                            // _apiService = CallAPI();
                          } else {
                            print('Submit data failed');
                            // _scaffoldState.currentState.showSnackBar(SnackBar(
                            //   content: Text("Submit data failed"),
                            // ));
                          }
                        });
                      }
                      else {
                        product.id = widget.product.id;
                        _apiService.updateProduct(product).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context, true);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Update data failed"),
                            ));
                          }
                        });
                      }
                    }

                  },
                  color: Colors.teal,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Submit', style: TextStyle(fontSize: 24, color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}