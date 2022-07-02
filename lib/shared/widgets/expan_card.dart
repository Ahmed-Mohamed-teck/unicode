import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpandCard extends StatelessWidget {

  ExpandCard({Key? key}) : super(key: key);
  final GlobalKey<ExpansionTileCardState> cardA =  GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB =  GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC =  GlobalKey();
  @override
  Widget build(BuildContext context) {


    return  Column(
          children: [
            ExpansionTileCard(
              initialElevation:2,
              elevation: 2,
              key: cardA,
              expandedTextColor: Colors.black54,
              title: const Text('اي نوع من الأسئلة يتم وضعه هنا'),
              // subtitle: Text('اي نوع من الأسئلة يتم وضعه هنا'),
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text('اي نوع من الأسئلة يتم وضعه هنا اي نوع ؟'
                      ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
            ExpansionTileCard(
              initialElevation:2,
              elevation: 2,
              key: cardB,
              expandedTextColor: Colors.black54,
              title: const Text('اي نوع من الأسئلة يتم وضعه هنا'),
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text('اي نوع من الأسئلة يتم وضعه هنا اي نوع ؟'
                      ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
            ExpansionTileCard(
              initialElevation:2,
              elevation: 2,
              key: cardC,
              expandedTextColor: Colors.black54,
              title: const Text('اي نوع من الأسئلة يتم وضعه هنا'),
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text('اي نوع من الأسئلة يتم وضعه هنا اي نوع ؟'
                      ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),

              ],
            ),


          ],
        );
  }
}
