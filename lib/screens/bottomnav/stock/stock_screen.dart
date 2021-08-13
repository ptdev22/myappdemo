import 'package:flutter/material.dart';
import 'package:myappdemo/models/Product.dart';
import 'package:myappdemo/screens/addproduct/addproduct.dart';
import 'package:myappdemo/services/rest_api.dart';
import 'package:myappdemo/models/Product.dart';
GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
class StockScreen extends StatefulWidget {
  StockScreen({Key key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {

  // callAPI Service
  CallAPI callAPI;

  // สร้าง Contest
  BuildContext context;

  @override
  void initState() {
    super.initState();
    callAPI = CallAPI();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Product list'),
          actions: [
            InkWell(
              onTap: () {
                print('Tab on add button');
                // Navigator.pushNamed(context, '/addproduct');
                // MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext buildContext){
                //   return AddProductScreen();
                // });
                // Navigator.of(context).push(materialPageRoute).then((value) {
                //   setState(() {
                //     print('777777777777');
                //   });
                // });
              Route materialPageRoute = MaterialPageRoute(builder: (context) => AddProductScreen());
              Navigator.push(context, materialPageRoute).then((value){
                  setState(() {
                    print('88888888');
                  });
              });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 16.0),
                child: Icon(Icons.add),
              )
            )
          ],
        ),
        
        // // แบบใช้ API --------------------------------------------
        body: Center(
          child: FutureBuilder(
            future: callAPI.getProducts(),
            builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
              if(snapshot.hasError){
                print('Something wrong with ${snapshot.error.toString()}');
                return Center(
                  child: Text('Something wrong with ${snapshot.error.toString()}'),
                );
              }else if(snapshot.connectionState == ConnectionState.done){
                List<Product> products = snapshot.data;
                print('xxxx');
                
                return _buildListView(products);
              }else{
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
            }
          ),
        ),
        // // แบบใช้ API --------------------------------------------
        
        /*
        // // แบบไม่ใช้ API --------------------------------------------
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {
                  print('Tab on card');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image.network('https://media.bnn.in.th/media/194850483424/HP-Notebook-15s-eq1001AU-Silver-content1.jpg'),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "product name Notebook Lenovo IdeaPad 5 15ITL05 82FG006CTA (Graphite Grey)",
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,  
                                ),
                                Text("xxxxxxxxxxx"),
                                Text("29,000 THB")
                              ],
                            )
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        //   Padding(
                        //     padding: const EdgeInsets.only(right: 2.0),
                        //     child: RaisedButton(
                        //       color: Colors.blue,
                        //       onPressed: (){
                        //         print('Tab on Edit botton');
                        //       }, 
                        //       child: Text('Edit', style: TextStyle(color: Colors.white),)
                        //     ),
                        //   ),
                        //   RaisedButton(
                        //     color: Colors.red,
                        //     onPressed: (){
                        //       print('Tab on Delete botton');
                        //     }, 
                        //     child: Text('Delete', style: TextStyle(color: Colors.white),)
                        //   ),
                          FlatButton(
                            onPressed: (){
                              print('Tab on Edit botton');
                            }, 
                            child: Text('Edit', style: TextStyle(color: Colors.blue),)
                          ),
                          FlatButton(
                            onPressed: (){
                              print('Tab on Delete botton');
                            }, 
                            child: Text('Delete', style: TextStyle(color: Colors.red),)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
        // // แบบไม่ใช้ API ---------------------------------------------
        */
    );
  }

  // ListView Builder
  Widget _buildListView(List<Product> products){
      return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            // Load Model
            Product product = products[index];
            return Card(
              child: InkWell(
                onTap: () {
                  print('Tab on card');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image.network(product.productImage),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.productName,
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,  
                                ),
                                Text(product.productBarcode),
                                Text(product.productPrice + " THB")
                              ],
                            )
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        //   Padding(
                        //     padding: const EdgeInsets.only(right: 2.0),
                        //     child: RaisedButton(
                        //       color: Colors.blue,
                        //       onPressed: (){
                        //         print('Tab on Edit botton');
                        //       }, 
                        //       child: Text('Edit', style: TextStyle(color: Colors.white),)
                        //     ),
                        //   ),
                        //   RaisedButton(
                        //     color: Colors.red,
                        //     onPressed: (){
                        //       print('Tab on Delete botton');
                        //     }, 
                        //     child: Text('Delete', style: TextStyle(color: Colors.white),)
                        //   ),
                          FlatButton(
                            onPressed: () async {
                              print('Tab on Edit botton');
                              var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AddProductScreen(product: product);
                            }));
                            if (result != null) {
                              setState(() {});
                            }
                            }, 
                            child: Text('Edit', style: TextStyle(color: Colors.blue),)
                          ),
                          FlatButton(
                            onPressed: (){
                              print('Tab on Delete botton');
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text("Are you sure want to delete data profile ${product.productName}?"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          callAPI.deleteProduct(product.id).then((isSuccess) {
                                            if (isSuccess) {
                                              setState(() {});
                                              Scaffold.of(this.context).showSnackBar(SnackBar(content: Text("Delete data success")));
                                            } else {
                                              Scaffold.of(this.context).showSnackBar(SnackBar(content: Text("Delete data failed")));
                                            }
                                          });
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                            }, 
                            child: Text('Delete', style: TextStyle(color: Colors.red),)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        );
  }
}