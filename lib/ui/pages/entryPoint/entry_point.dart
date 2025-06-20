import 'dart:math';
import 'dart:ui';

import 'package:first_app/models/appstate.dart';
import 'package:first_app/models/menu.dart';
import 'package:first_app/ui/pages/entryPoint/components/btm_nav_item.dart';
import 'package:first_app/ui/pages/entryPoint/components/menu_btn.dart';
import 'package:first_app/ui/pages/entryPoint/components/side_bar.dart';
import 'package:first_app/ui/pages/home/index.dart';
import 'package:first_app/ui/pages/login/index.dart';
import 'package:first_app/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  Menu selectedBottonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;

  void updateSelectedBtmNav(Menu menu) {
    if (selectedBottonNav != menu) {
      setState(() {
        selectedBottonNav = menu;
      });
    }
  }

  late SMIBool isMenuOpenInput;

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateModel>(context);
    if (!appState.authenticated) {
      return const Scaffold(
        body: LoginPage(),
      );
    }
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: isSideBarOpen
              ? BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/material/05.png'),
                    fit: BoxFit.fill,
                  ),
                )
              : BoxDecoration(),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: 288,
                    height: MediaQuery.of(context).size.height,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    left: isSideBarOpen ? 0 : -288,
                    top: 0,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: const SideBar()),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(1 * animation.value -
                          30 * (animation.value) * pi / 180),
                    child: Transform.translate(
                      offset: Offset(animation.value * 265, 0),
                      child: Transform.scale(
                        scale: scalAnimation.value,
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                          child: HomePage(),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    left: isSideBarOpen ? 220 : 0,
                    top: 16,
                    child: MenuBtn(
                      press: () {
                        isMenuOpenInput.value = !isMenuOpenInput.value;

                        if (_animationController.value == 0) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }

                        setState(
                          () {
                            isSideBarOpen = !isSideBarOpen;
                          },
                        );
                      },
                      riveOnInit: (artboard) {
                        final controller = StateMachineController.fromArtboard(
                            artboard, "State Machine");

                        artboard.addController(controller!);

                        isMenuOpenInput =
                            controller.findInput<bool>("isOpen") as SMIBool;
                        isMenuOpenInput.value = true;
                      },
                    ),
                  ),
                ],
              ))),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(255),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withAlpha(70),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(bottomNavItems.length, (index) {
                  Menu navBar = bottomNavItems[index];
                  return BtmNavItem(
                    navBar: navBar,
                    press: () {
                      if (navBar.rive.status != null) {
                        RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                      }
                      updateSelectedBtmNav(navBar);
                    },
                    riveOnInit: (artboard) {
                      navBar.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: navBar.rive.stateMachineName);
                    },
                    selectedNav: selectedBottonNav,
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
