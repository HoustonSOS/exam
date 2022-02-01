import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  var searchController = TextEditingController();
  bool once = false;
  List<String> names = ["Burger", "Sushi", "Somsa", "Osh", "Pizza", "Fish", "Salad", "Meat", "Burito"];
  List<String> images = ['img_0.jpg','img_1.jpg','img_2.jpg','img_3.jpg','img_4.jpg','img_5.jpg','img_6.jpg','img_7.jpg', 'img_8.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.food_bank),
        title: Text("FreindlyEats ${images.length}"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              height: 60,
              child: ListTile(
                minLeadingWidth: 3.0,
                isThreeLine: true,
                tileColor: Colors.white,
                leading: Icon(Icons.sort_outlined),
                title: Text("All Restaraunts", style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("by rating"),
              ),
            ),
          )
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 500));

          if(!once){
            setState(() {
              names.addAll(["Indian", "Chinese"]);
              images.shuffle();
              images.addAll(["img_9.jpg", "img_10.jpg"]);
              once = true;
            });
          }
        },
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index){
              return Card(
                elevation: 3.0,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset("assets/images/${images[index]}").image,
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5.0), child: Text(names[index], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),),
                            SizedBox(height: 20, width: 250, child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index){
                                  return Icon(Icons.star, color: Colors.amber,);
                                }),),
                            Padding(padding: EdgeInsets.all(10.0), child: Text("Brunch * Colorado"),)
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(5.0), child: Text("\$\$\$"),),
                      ],
                    )
                  ],
                ),
              );
            }),
      )
    );
  }
}
