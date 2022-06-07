import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nftlist.dart';

class Nftdash extends StatefulWidget {
  const Nftdash({ Key? key }) : super(key: key);

  @override
  _NftdashState createState() => _NftdashState();
}
   

class _NftdashState extends State<Nftdash> {
     int index=0;
     final controller=CarouselController();
     @override
     Widget build(BuildContext context) {
     var size=MediaQuery.of(context).size;
     var width=MediaQuery.of(context).size.width;
     void previoussong(){
      setState(() {
     if (index!=0) {
     index--;
     }
       });
     }
     void nextsong(){
      setState(() {
     if (index!=nftdata.length-1) {
     index++;
      }
       });
       }  

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: SafeArea(
     child: SingleChildScrollView(
     child: Column(
       children: [
     Padding(
     padding: const EdgeInsets.all(20),
     child: Text(" NFT Marketplace",style: GoogleFonts.openSans(
     textStyle: const TextStyle(fontSize:30,color: Colors.white,fontWeight: FontWeight.bold),),),
     ),
     GestureDetector(
     onHorizontalDragEnd: (DragEndDetails details) {
      if (details.primaryVelocity! > 0) {
     previoussong();
     controller.previousPage(duration: const Duration(milliseconds: 400));
     } else if (details.primaryVelocity! < 0) {
     nextsong();
      controller.nextPage(duration: const Duration(milliseconds:400));
     }
      },
     child: Stack(
       children: [
      Container(
     margin: const EdgeInsets.only(left: 35,right: 25,top:35,),
      width: size.width -140,
      height: size.width-140,
      decoration: BoxDecoration(
     boxShadow:const [
       BoxShadow(
     color: Color.fromRGBO(186,224,247,1),blurRadius: 40,spreadRadius: 5
       )
     ]
      ,borderRadius: BorderRadius.circular(5)),
     ),
     AbsorbPointer(
       child: Container(
      margin: const EdgeInsets.only(left:15,top: 0),
       width: size.width-100,
      child: CarouselSlider.builder(
      carouselController: controller,
      itemCount: nftdata.length,
     options:
      CarouselOptions(
     height: size.width-75,
     enlargeCenterPage: false,
     viewportFraction: 1,
     enableInfiniteScroll: false,
      ),
      itemBuilder: (context,index,realindex){
     final urlimg=nftdata[index].pic;
    return Container(
      width: width,
     margin: const EdgeInsets.all(25),
     child:  ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: Image.network(urlimg,fit: BoxFit.cover,),
    ),
    );
    
      
      },
       
      ),
       ),
     ),
     ],
     ),
     ),

     // gesture detector
     Container(
     margin: const EdgeInsets.all(12),
     height:170,
     width: MediaQuery.of(context).size.width,
     child: Card(
     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(50)
     ),
     elevation: 8,
     color: Colors.grey.withOpacity(0.2),
     child: Column(
    children: [
      Padding(
     padding: const EdgeInsets.all(15),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(nftdata[index].name,style: GoogleFonts.openSans(
      textStyle: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
       ),
       const SizedBox(width: 12,),
      CircleAvatar(backgroundImage: NetworkImage(nftdata[index].pp),)     
      ],
     ),
      ),
       Container(
       width: width-40,
       margin: const EdgeInsets.only(left: 40,right: 40),
       child:  Column(
     children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
      Container(
     padding: const EdgeInsets.all(5),
     child:Text("Top Bid",style: GoogleFonts.openSans(
     textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
      ),
      ),
    Container(
       padding: const EdgeInsets.all(5),
       child:Text(nftdata[index].topbid,style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     ),
       ],
     ),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
     Container(
       padding: const EdgeInsets.all(5),
       child:Text("Serial No.",style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
     ),
     ),
      Container(
       padding: const EdgeInsets.all(5),
       width: 100,
       child:Text(nftdata[index].serialno,style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
       textAlign: TextAlign.center,
     ),
     ),
       ],
     ),
     ],
       ), 
       )
       
     
    ],
     ),
      
     ),
     ),
     Container(
       width: width-40,
       height: 120,
       margin: const EdgeInsets.only(left: 40,right: 40,top: 12),
       child: Column(
     children: [
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
     Container(
       padding: const EdgeInsets.all(5),
       child:Text("Owned by",style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
     ),
     ),
      Container(
     alignment: Alignment.center,
       padding: const EdgeInsets.all(5),
       width: width/2,
       child:Text(nftdata[index].owner,style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     ),
       ],
     ),
      Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
     Container(
       padding: const EdgeInsets.all(5),
       child:Text("Created by",style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
     ),
     ),
      Container(
       alignment: Alignment.center,
       padding: const EdgeInsets.all(5),
       width: width/2,
       child:Text(nftdata[index].creator,style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
     ),
     ),
       ],
     ),
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
     Container(
       padding: const EdgeInsets.all(5),
       child:Text("Favorites",style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.normal),),
     ),
     ),
      Container(
      alignment: Alignment.center,
       padding: const EdgeInsets.all(5),
       width: width/2,
       child:Text(nftdata[index].fav,style: GoogleFonts.openSans(
       textStyle: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
       
     ),
     ),
       ],
     ),
     
     
     ],
       ),
     ),    
       Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children:  <Widget> [
     const Padding(
       padding: EdgeInsets.all(25),
       child: Icon(Icons.favorite_outline,color: Colors.white,size: 35,),
     ),
       Container(
     width: 280,
       alignment: Alignment.center,
       padding: const EdgeInsets.all(30),
     child: ElevatedButton(
     child: const Text("BUY",style: TextStyle(fontFamily: 'Gilroy',fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold)),   
     onPressed: (){
      
     },
      style: ButtonStyle(
     textStyle:MaterialStateProperty.all(const TextStyle(fontSize: 20,)),
     fixedSize: MaterialStateProperty.all(const Size(double.maxFinite, 65)),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 54, 244, 111)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
     RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(32),
       side: const BorderSide(color:Color.fromARGB(255, 54, 244, 111))
     )
      ) )
     
     ),
       ),       
      
     ],
       )
      ],
     ),
     ),
      ),
    );
    
  }
  Widget buildImage(String urlimg, int index) =>
   Container(
    margin: const EdgeInsets.all(25),
    decoration: BoxDecoration(image: DecorationImage(
    image: NetworkImage(nftdata[index].pic),
     
    )
     ,borderRadius: BorderRadius.circular(5)),
     );
     

}

