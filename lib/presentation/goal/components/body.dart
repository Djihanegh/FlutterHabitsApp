import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils_export.dart';
import '../../components/components_export.dart';
import '../../habit/habit_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  TabController? tabController;

  int? chatEnabled;
  Map<String, dynamic> order = {};
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int page = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {
        selectedIndex = tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
                elevation: 0,
                primary: false,
                centerTitle: false,
                floating: false,
                pinned: true,
                snap: false,
                bottom: PreferredSize(
                    child: const SizedBox.shrink(),
                    preferredSize:
                        Size.fromHeight(SizeConfig.screenHeight! * 0.175)),
                //leading: SizedBox(),
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ProgressWidget(
                        actual: 1,
                        total: 4,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: AutoSizeText("What's your main goal?",
                              style: TextStyles.semiBold.copyWith(
                                  color: AppColors.kPrimaryText,
                                  fontSize: 24))),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                            "Let’s start with one of these habits.",
                            style: TextStyles.medium.copyWith(
                                color: AppColors.kPrimaryText,
                                fontSize: 16,
                                decorationThickness: 1)),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: SizeConfig.screenHeight! * 0.1,
                            child: AppBar(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              automaticallyImplyLeading: false,
                              bottom: TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                /*labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),*/
                                controller: tabController,
                                isScrollable: false,
                                onTap: (index) {
                                  selectedIndex = index;
                                },
                                indicator: CustomTabIndicator(
                                    indicatorColor: AppColors.kPrimaryDarkColor,
                                    borderRadius: const Radius.circular(10)),
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  Tab(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                        Icon(
                                          PavlokIcons.leaf,
                                          size: 16,
                                          color: selectedIndex == 0
                                              ? AppColors.kPrimaryColor
                                              : AppColors.kSecondaryText,
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            "Start a good habit",
                                            style: selectedIndex == 0
                                                ? TextStyles.semiBold.copyWith(
                                                    color:
                                                        AppColors.kPrimaryColor,
                                                    fontSize: 10)
                                                : TextStyles.medium.copyWith(
                                                    color: AppColors
                                                        .kSecondaryText,
                                                    fontSize: 10),
                                          ),
                                        ),
                                      ])),
                                  Tab(
                                      child: Row(children: [
                                    Icon(
                                      PavlokIcons.bolt,
                                      size: 15,
                                      color: selectedIndex == 1
                                          ? AppColors.kPrimaryColor
                                          : AppColors.kSecondaryText,
                                    ),
                                  Flexible(child:  AutoSizeText("Break a bad habit",
                                        style: selectedIndex == 1
                                            ? TextStyles.semiBold.copyWith(
                                                color: AppColors.kPrimaryColor,
                                                fontSize: 10)
                                            : TextStyles.medium.copyWith(
                                                color: AppColors.kSecondaryText,
                                                fontSize: 10)))
                                  ])),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ))
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            HabitScreen(key:Key('good')),
            HabitScreen(key:Key('bad')),
          ],
        ),
      ),
    );
  }
}
