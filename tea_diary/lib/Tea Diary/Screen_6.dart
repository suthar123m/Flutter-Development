import 'package:flutter/material.dart';

class billhistory extends StatefulWidget {
  const billhistory({super.key});

  @override
  State<billhistory> createState() => _billhistoryState();
}

class _billhistoryState extends State<billhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill History", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown,
      ),
      body: Container(
      color: Color.fromARGB(255, 224, 220, 220),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 60, 
            decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:7.0, left: 8, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rambhai", style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 108, 106, 106)),),
                   Text("₹ 35", style: TextStyle(color: const Color.fromARGB(255, 41, 137, 44), fontSize: 20),)
                    ],
                  ),
                ), 


                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  
                  
                      Row(
                        children: [
                   Text("19 - 05 - 2024", style: TextStyle(color: const Color.fromARGB(255, 108, 106, 106),)), 
                   SizedBox(width: 10,),
                      Text("|", style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 108, 106, 106) ),), 
                       SizedBox(width: 10,),
                      Text("09 : 40 :10 AM",style: TextStyle(color: const Color.fromARGB(255, 108, 106, 106),))
                        ],
                      ), 
                  
                      Row(children: [
                        Text("₹ 35",style: TextStyle(color: Colors.red, fontSize: 15),)
                      ],)
                     
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],)
      ),
    );
  }
}