import 'package:flutter/material.dart';

class Dys extends StatefulWidget {

  const Dys({Key? key}) : super(key: key);
  @override
  State<Dys> createState() => _DysState();
}

class _DysState extends State<Dys> {
  bool colorb=false;

  @override
  Widget build(BuildContext context) {
    return
      Column(

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        colorb=!colorb;
                      });
                    },
                    child: Container(
                      height: 100,

                      decoration: BoxDecoration(
                          color:colorb?  Colors.pink:Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('شهري',style:TextStyle(color: colorb?Colors.white:  Colors.black),),
                          const SizedBox(height: 6,),

                          Text(r'$ 8.49',style:TextStyle(color: colorb?Colors.white:  Colors.black),),

                          Text(r'شهري/$ 4.49',style:TextStyle(color: colorb?Colors.white:  Colors.black),),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        colorb=!colorb;
                      });
                    },
                    child: Container(
                      height: 100,

                      decoration: BoxDecoration(
                          color:colorb?Colors.white:  Colors.pink,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('شهري',style: TextStyle(color: colorb?Colors.black:  Colors.white),),
                          const SizedBox(height: 6,),

                          Text(r'$ 8.49',style: TextStyle(color: colorb?Colors.black:  Colors.white),),

                          Text(r'شهري/$ 4.49',style: TextStyle(color: colorb?Colors.black:  Colors.white)),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ),
          const SizedBox(height: 22,),
          Container(
            height: 55,width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:Colors.black.withOpacity(.7)
            ),

            child: MaterialButton(
              onPressed: (){},

              child: const Text('أشتراك',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21
              ),),
            ),
          )
        ],
      );
  }
}
