import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:first_app/models/travel_card.dart';
import 'package:first_app/ui/pages/home/components/card_container.dart';
import 'package:first_app/ui/pages/home/components/card_cover_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/appstate.dart';
import 'package:first_app/ui/pages/login/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<String> _tabs = [
    "Asia",
    "Europe",
    "South America",
    "North America",
    "Africa",
    "Australia",
    "Antarctica",
  ];

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateModel>(context);
    if (!appState.authenticated) {
      return const Scaffold(
        body: LoginPage(),
      );
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            bottom: false,
            child: ChangeNotifierProvider(
                create: (_) {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 44),
                            Text(
                              "Hello, Chris",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            // Text("Home"),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Center(
                            // this is a search bar
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 15),
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withAlpha(100)),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  suffixIcon: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Icon(
                                      Icons.tune,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  // Add your search logic here
                                  // print('Searching for: $value');
                                },
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Select your next trip",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )),
                      SizedBox(height: 20),
                      DefaultTabController(
                        length: _tabs.length,
                        child: Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 60,
                            child: Column(
                              children: [
                                ButtonsTabBar(
                                  height: 36,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                  buttonMargin:
                                      EdgeInsets.symmetric(horizontal: 8),
                                  radius: 40,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  unselectedBackgroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  unselectedLabelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withAlpha(170)),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontWeight: FontWeight.w400),
                                  tabs: _tabs
                                      .map((toElement) => Tab(
                                            text: toElement,
                                          ))
                                      .toList(),
                                ),
                              ],
                            )),
                      ),
                      Center(
                        child: CardContainer(
                          iteamCount: TravelCard.fakeTravelCardList.length,
                          itemBuilder: (context, index, isFrontCard) =>
                              CardCoverImage(
                                  card: TravelCard.fakeTravelCardList[index],
                                  isFrontCard: isFrontCard),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
