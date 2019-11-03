import 'package:flutter/material.dart';

class Product extends StatefulWidget{
  @override
  _ProductState createState() => _ProductState();

}

class _ProductState extends State<Product>{

  var product_list = [
    {
       'name':'blazer1',
       'picture':'images/products/blazer1.jpeg',
       'old_price':'120',
       'price': '85',
    },
    {
       'name':'dress',
       'picture':'images/products/dress1.jpeg',
       'old_price':'150',
       'price': '105',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (BuildContext context, int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_pic: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
  },
    );
  }

}

class Single_prod extends StatelessWidget{

  final prod_name;
  final prod_pic;
  final prod_old_price;
  final prod_price;

  Single_prod({
   this.prod_name,
   this.prod_pic,
   this.prod_old_price,
   this.prod_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: prod_name, child: InkWell(
        onTap: (){},
        child: GridTile(
          child: Image.asset(prod_pic, fit: BoxFit.cover,),
          footer: Container(
            color: Colors.white70,
            child: ListTile(leading: Text(prod_name, style:TextStyle(fontWeight: FontWeight.bold)),
            title: Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
            subtitle: Text("\$$prod_old_price",
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough)),
            ),
          ),

        ),
      ),),
    );
  }

}

