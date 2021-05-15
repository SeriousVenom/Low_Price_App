import 'package:flutter/material.dart';
import 'package:searchprice/my_webview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../models/Cart.dart';
import '../models/Product.dart';

const _url = 'viber://pa?chatURI=minprice_bot';
const _url2 = 'https://t.me/evrikaspace7_bot';
const _url3 = 'https://vk.com/im?sel=-198656411';
const _url4 = 'https://m.me/103041254853309';
const _url5 = 'mailto:direct7rk@yandex.ru';
const _url6 = 'https://auth.robokassa.ru/Merchant/Index.aspx?MerchantLogin=evrika7&InvId=0&Culture=ru&Encoding=utf-8&OutSum=35&SignatureValue=365cc5b59b22a1020ccfcec03a4b1876';



class ItemPage extends StatelessWidget {

  final String productId;

  ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = context.watch<ProductDataProvider>()
      .getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.title, style: GoogleFonts.roboto(),),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.imgUrl, 
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(data.title, style: TextStyle(fontSize: 26.0),),
                    Divider(),
                    Row(
                      children: <Widget>[
                        //Text('Цена: ', style: TextStyle(fontSize: 24.0),),
                        //Text('${data.price}', style: TextStyle(fontSize: 24.0),),
                      ],
                    ),
                    Divider(),
                    Text(data.description),

                    SizedBox(
                      height: 20.0,
                    ),

                    //Provider.of<CartDataProvider>(context)
                    context.watch<CartDataProvider>()
                      .cartItems
                      .containsKey(productId)
                    ? Column(
                    )
                    : MaterialButton(
                      onPressed: _launchURL,
                        color: Colors.white,
                        child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'lib/assets/images/viber.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),                          
                            child: new Text(
                              "Viber          ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),   
                        shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(50)),                     
                      ),
                      MaterialButton(
                      onPressed: _launchURL2,
                        color: Colors.white,
                        child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'lib/assets/images/tg.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: new Text(
                              "Telegram   ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                        
                        shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(50)),                       
                      ),
                      MaterialButton(
                      onPressed: _launchURL3,
                        color: Colors.white,
                        child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'lib/assets/images/vk.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: new Text(
                              "Вконтакте",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                        shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(50)),                        
                      ),
                      MaterialButton(
                      onPressed: _launchURL4,
                        color: Colors.white,
                        child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'lib/assets/images/fb.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: new Text(
                              "Facebook   ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                        shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(50)),                        
                      ),
                      MaterialButton(
                      onPressed: _launchURL5,
                        color: Colors.white,
                        child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'lib/assets/images/email.png',
                          height: 20.0,
                          width: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: new Text(
                              "Email          ",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ), 
                        shape: RoundedRectangleBorder(side: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid
                              ), borderRadius: BorderRadius.circular(50)),                       
                      ),

                      Container(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                          title: "Оплата заявки",
                          selectedUrl: "https://auth.robokassa.ru/Merchant/Index.aspx?MerchantLogin=evrika7&InvId=0&Culture=ru&Encoding=utf-8&OutSum=35&SignatureValue=365cc5b59b22a1020ccfcec03a4b1876",
                        )
                      ));
                      },
                        color: Color(0xFFFFFFFF),
                        child: Icon(Icons.payment), 
                        padding: EdgeInsets.all(0),
                        elevation: 55.0,
                        minWidth: 0,
                      
                                               
                      ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
    
void _launchURL2() async =>
  await canLaunch(_url2) ? await launch(_url2) : throw 'Could not launch $_url2';

void _launchURL3() async =>
  await canLaunch(_url3) ? await launch(_url3) : throw 'Could not launch $_url3';

void _launchURL4() async =>
  await canLaunch(_url4) ? await launch(_url4) : throw 'Could not launch $_url4';

void _launchURL5() async =>
  await canLaunch(_url5) ? await launch(_url5) : throw 'Could not launch $_url5';

void _launchURL6() async =>
  await canLaunch(_url6) ? await launch(_url6) : throw 'Could not launch $_url6';
