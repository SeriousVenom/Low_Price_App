

import '../models/Product.dart';
import '../widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print('build HomePage');

    final productData = context.watch<ProductDataProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            )
          ),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[

              Container(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  title: Text(
                    'Сравним цены и найдём дешевле',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  //subtitle: Text(
                   // 'Найдём, обзвоним и сравним минимум 5 разных поставщиков.',
                   // textAlign: TextAlign.center,
                    //style: TextStyle(fontSize: 20)
                    //),
                  //trailing: Icon(Icons.panorama_horizontal),
                ),
              ),

              Container(                                
                padding: const EdgeInsets.all(5.0),
                width: 10000,
                height: MediaQuery.of(context).size.height*0.9,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  //physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, int index) =>

                    ChangeNotifierProvider.value(
                      value: productData.items[index],
                      child: ItemCard(),
                    )

                    //ItemCard(product: productData.items[index]),

                  ),
              ),

              //...productData.items.map((value) {
               // return CatalogListTile(imgUrl: value.imgUrl);
              //}).toList()
            ],
          )
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}

