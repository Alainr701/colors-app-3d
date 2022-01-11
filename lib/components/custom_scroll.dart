import 'package:colors/components/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
class CustomScroll extends StatelessWidget {
  const CustomScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 370,
       height: 160,
       padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
    
       child: Row(

         mainAxisSize: MainAxisSize.min,
         children:const [
         Red(),
         SizedBox(width: 5),
         Green(),
         SizedBox(width: 5),
         Blue(),
         ],
       ),

     );
  }
}
class Red extends StatelessWidget {
  const Red({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final red =Provider.of<ScrollProvider>(context);
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        diameterRatio: 0.4,
        physics: const BouncingScrollPhysics(),
       
        itemExtent: 100, 
        controller:red.scrollControllerR ,
        onSelectedItemChanged: (index){
          red.colorRed(index);
        },
      childDelegate: ListWheelChildBuilderDelegate(
        
        builder: (context, index) => Container(
          width: 120,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
                     color: Colors.red,

          ),
          child: Center(
            child: Text('$index',style:const TextStyle(color: Colors.white,fontSize: 40),),
          ),
        ),
        childCount: 256,
      ),),
    );
  }
}

class Green extends StatelessWidget {
  const Green({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final green =Provider.of<ScrollProvider>(context);
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: const BouncingScrollPhysics(),

        diameterRatio: 0.4,

        onSelectedItemChanged: (index){
          green.colorGreen(index);
        },
        itemExtent: 100, 
        controller:green.scrollControllerG ,
      childDelegate: ListWheelChildBuilderDelegate(
        
        builder: (context, index) => Container(
          width: 120,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
          child: Center(
            child: Text('$index',style: const TextStyle(color: Colors.white,fontSize: 40),),
          ),
        ),
        childCount: 256,
      ),),
    );
  }
}

class Blue extends StatelessWidget {
  const Blue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blue =Provider.of<ScrollProvider>(context);
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        physics: const BouncingScrollPhysics(),

        diameterRatio: 0.5,

         onSelectedItemChanged: (index){
          blue.colorBlue(index);
        },
        itemExtent: 100, 
        controller:blue.scrollControllerB ,
      childDelegate: ListWheelChildBuilderDelegate(
        builder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          width: 120,
          child: Center(
           child: Text('$index',style:const TextStyle(color: Colors.white,fontSize: 40),),
          ),
        ),
        childCount: 256,
      ),),
    );
  }
}