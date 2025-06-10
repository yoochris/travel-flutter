import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/appstate.dart';
import 'package:first_app/models/locstate.dart';
import 'package:first_app/ui/pages/login/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppStateModel>(context);
    if (!appState.authenticated) {
      return const Scaffold(
        body: LoginPage(),
      );
    }

    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: ChangeNotifierProvider(
                create: (_) => new LocStateModel(appState.mocks.getGeo()),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  appState.logOut();
                                },
                                child: Text("退出")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
