import 'package:flutter/material.dart';
import 'package:unicodetask/modules/home/home_view_model.dart';
import 'package:unicodetask/shared/base_widget.dart';

import '../../shared/resources/app_assets.dart';
import '../../shared/widgets/dys.dart';
import '../../shared/review_card.dart';
import '../../shared/widgets/expan_card.dart';
import '../../shared/widgets/section_title.dart';

TextStyle subtitleTextStyle = const TextStyle(color: Colors.grey);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  final List<Tab> topTabs = <Tab>[
    const Tab(text: 'المعرض'),
    const Tab(text: 'شروط المدرب'),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),
        centerTitle: true,
        elevation: 0,
        title: const Text('احمد محمد',style: TextStyle(color: Colors.black38),),
      ),
      body: BaseWidget<HomeViewModel>(
        initState: (m) async {
          await m.getUserData();
        },
        model: HomeViewModel(),
        builder: (context, model, _) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Column(
                  children: [
                    titleWidget(model),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: Text(
                                  model.userModel?.sportType ?? "",
                                  style: const TextStyle(color: Colors.pink),
                                ),
                              ),
                            )
                            ,Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(AppAssets.faceIcon),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(AppAssets.faceIcon),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(AppAssets.faceIcon),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset(AppAssets.faceIcon),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          model.userModel?.description ?? '',
                          maxLines: 4,
                          style: subtitleTextStyle,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 2,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 4),
                                child: Text(
                                  "عرض الكل",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ))
                      ],
                    ),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              'https://www.propertyfinder.eg/blog/wp-content/uploads/2021/04/shutterstock_412095283-1.jpg'),
                        ),
                        Positioned(
                            right: 12,
                            top: 12,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4),
                                child: Text(
                                  "ملصق جانبى",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: TabBar(
                        controller: tabController,
                        indicatorColor: Colors.pink,
                        labelColor: Colors.pink,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        tabs: [
                          Expanded(
                            child: Row(
                              children: const [
                                Text(
                                  'شروط المدرب',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(Icons.run_circle),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: const [
                                Text('المعرض',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19)),
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(Icons.image),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("صور المدرب"),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        model.userModel?.coachImages?.length ??
                                            0,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          model.userModel
                                                  ?.coachImages?[index] ??
                                              '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text("نتائج المتدربين"),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 120,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model
                                            .userModel?.traineeImages?.length ??
                                        0,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                      width: 10,
                                    ),
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          model.userModel
                                                  ?.traineeImages?[index] ??
                                              '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ExpandCard()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children:  [
                        const SectionTitle(
                          title: "اراء المشتركين",
                          subTitle: "عرض جميع الأراء",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            separatorBuilder: (context,index)=>const SizedBox(width: 5,),
                            itemBuilder: (context,index)=>const ReviewCard(),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const SectionTitle(
                          title: "خطط الإشتراك",
                        ),
                        const Dys(),
                      ],
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

  titleWidget(HomeViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Image.network(
                      model.userModel?.profileImage ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text(
                      model.userModel?.name ?? "",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(model.userModel?.country ?? "",style: const TextStyle(color: Colors.black45),),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(model.userModel?.city ?? "",style: const TextStyle(color: Colors.black45),)
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.ac_unit,color: Colors.white,),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(model.userModel!.rate.toString(),style: const TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
