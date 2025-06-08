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

    List<List<String>> splitIntoColumns(
        List<String> pictures, int columnCount) {
      List<List<String>> columns = List.generate(columnCount, (_) => []);
      for (int i = 0; i < pictures.length; i++) {
        columns[i % columnCount].add(pictures[i]);
      }
      return columns;
    }

    final columns = splitIntoColumns(pictures, 3);

    return Scaffold(
      body: Container(
        // color: Colors.green,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            // MasonryGridView.count(
            //   itemCount: pictures.length,
            //   crossAxisCount: 3,
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 10,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       height: (index % 5 + 1) * 50,
            //       clipBehavior: Clip.hardEdge,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[50],
            //           borderRadius: BorderRadius.all(Radius.circular(10))),
            //       child: Image.asset(
            //         pictures[index],
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            // ),
            Row(
              spacing: 10,
              children: List.generate(3, (i) {
                return Expanded(
                  child: AnimatedColumn(
                    images: columns[i],
                    maxOffset:
                        30.0 + i * 10, // Optional: different offset per column
                    duration:
                        Duration(seconds: 2 + i), // Optional: different speed
                  ),
                );
              }),
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
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "The world missed you!",
                              textAlign: TextAlign.center,
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

class AnimatedColumn extends StatefulWidget {
  final List<String> images;
  final double maxOffset;
  final Duration duration;

  const AnimatedColumn({
    required this.images,
    this.maxOffset = 30,
    this.duration = const Duration(seconds: 2),
    super.key,
  });

  @override
  State<AnimatedColumn> createState() => _AnimatedColumnState();
}

class _AnimatedColumnState extends State<AnimatedColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: widget.maxOffset).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Column(
            children: widget.images
                .map((img) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.asset(img, fit: BoxFit.cover),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
