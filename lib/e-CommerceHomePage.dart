import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class ECommerceHomePage extends StatefulWidget {
  const ECommerceHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ECommerceHomePage> createState() => _ECommerceHomePageState();
}

class _ECommerceHomePageState extends State<ECommerceHomePage> {

  List<String> carouselSliderImageUrls = [
    'https://biteable.com/content/uploads/2020/07/Sale_Now_On_thumb-1280x0-c-default.jpg',
    'https://i.pinimg.com/originals/0b/1d/33/0b1d33a8d964940b257880e2e265692f.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b9cebc56206093.59a527509701d.jpg',
    'https://i.pinimg.com/originals/44/27/1b/44271b8f4f0083c6c823a43f9cbb026a.png'
  ];


  Widget _createCircularButtonWithText(String text, Icon icon){
    return Container(
      height: 100,
      child: InkWell(
        onTap: () => {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 226,233,250),
              radius: 30,
              child : icon,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color:Colors.blue,
                ),),
            ),
          ],
        )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('\nHome',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),),
              ),
              
            ],
          ),

          CarouselSlider(
            options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayInterval: Duration(seconds: 4),
                enlargeCenterPage: true,
            ),
            items: [0, 1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255,2,1,254),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(carouselSliderImageUrls[i]),
                        ),
                        ),
                      //child: Image.network(carouselSliderImageUrls[i]),
                  );
                },
              );
            }).toList(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                _createCircularButtonWithText('Categories', Icon(Icons.list)),
                _createCircularButtonWithText('Favorites',Icon(Icons.star_border_purple500_rounded)),
                _createCircularButtonWithText('Gifts', Icon(Icons.card_giftcard_rounded)),
                _createCircularButtonWithText('Best Selling', Icon(Icons.account_circle_outlined)),

                //ElevatedButton.icon(icon: Icon(Icons.list), label: Text('Component'))
              ],
            ),
          )
        ]
      ),
      
      
      
      
    )
    ;
  }
}
