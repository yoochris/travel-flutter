import 'package:flutter/material.dart';
import 'package:first_app/models/appstate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:first_app/ui/theme/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateModel>(context);
    List<String> pictures = [
      'assets/images/material/01.png',
      'assets/images/material/02.png',
      'assets/images/material/03.png',
      'assets/images/material/04.png',
      'assets/images/material/05.png',
      'assets/images/material/06.png',
      'assets/images/material/07.png',
      'assets/images/material/08.png',
      'assets/images/material/09.png',
      'assets/images/material/10.png',
      'assets/images/material/11.png',
    ];

    return Scaffold(
      body: Container(
        // color: Colors.green,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            MasonryGridView.count(
              itemCount: pictures.length,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: (index % 5 + 1) * 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    pictures[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.gradientStart,
                              AppColors.gradientEnd,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        color: AppColors.primaryBackground,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              "Welcome to ChrisTravel",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            Text(
                              "Need a weekend recharge or a month-long expedition?",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "The world missed you!",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: AppButtonStyles.defaultStyle,
                                      onPressed: () {},
                                      child: Text("Sign up"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: AppButtonStyles.lightStyle,
                                      onPressed: () {},
                                      child: Text("Log in"),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
