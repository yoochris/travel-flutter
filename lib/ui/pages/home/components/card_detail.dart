import 'package:first_app/models/travel_card.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  final TravelCard card;
  const CardDetail({super.key, required this.card});

  void _onVerticalDrag(
    DragUpdateDetails details,
    BuildContext context,
  ) {
    if (details.primaryDelta! > 3.0) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) =>
                  _onVerticalDrag(details, context),
              child: Hero(
                tag: card.title,
                child: Image.asset(
                  height: 300,
                  card.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ...List.generate((20), (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(card.image),
                          radius: 15,
                        ),
                        title: Text(card.title),
                        subtitle: Text(
                            'Come to the Dart Side :) ..... $index\nline 22222 \nline 33'),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              padding: EdgeInsets.all(8),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                  )),
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
