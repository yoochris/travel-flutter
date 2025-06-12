import 'package:first_app/models/appstate.dart';
import 'package:first_app/models/menu.dart';
import 'package:first_app/ui/pages/entryPoint/components/info_card.dart';
import 'package:first_app/ui/pages/entryPoint/components/side_menu.dart';
import 'package:first_app/utils/rive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateModel>(context);
    return SafeArea(
        child: Container(
      width: 288,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(110),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: DefaultTextStyle(
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "Abu Anwar",
                bio: "YouTuber",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color:
                          Theme.of(context).colorScheme.surface.withAlpha(150)),
                ),
              ),
              ...sidebarMenus.map((menu) => SideMenu(
                    menu: menu,
                    selectedMenu: selectedSideMenu,
                    press: () {
                      RiveUtils.chnageSMIBoolState(menu.rive.status!);
                      setState(() {
                        selectedSideMenu = menu;
                      });
                    },
                    riveOnInit: (artboard) {
                      menu.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: menu.rive.stateMachineName);
                    },
                  )),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      appState.logOut();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 56),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.arrow_right,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    label: const Text("Log out"),
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
