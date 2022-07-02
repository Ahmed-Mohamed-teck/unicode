import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subTitle;

  const SectionTitle({Key? key, required this.title, this.subTitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
            Container(width: 20,color: Colors.pink,height: 3,)
          ],
        ),
        (subTitle!=null)?TextButton(onPressed: (){}, child: const Text("عرض جميع الأراء")):const SizedBox()
      ],);
  }
}
