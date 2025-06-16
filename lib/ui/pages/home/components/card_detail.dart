import 'package:first_app/models/travel_card.dart';
import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

class CardDetail extends StatefulWidget {
  final TravelCard card;
  const CardDetail({super.key, required this.card});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  void initState() {
    super.initState();
  }

  SheetController sheetController = SheetController();

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
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                GestureDetector(
                  onVerticalDragUpdate: (details) =>
                      _onVerticalDrag(details, context),
                  child: Hero(
                    tag: widget.card.title,
                    child: Image.asset(
                      width: double.infinity,
                      height: 300,
                      widget.card.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    child: Container(
                  height: 40,
                  color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                        ),
                      ),
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
                )),
                Sheet(
                  controller: sheetController,
                  initialExtent: MediaQuery.of(context).size.height - 300,
                  minExtent: MediaQuery.of(context).size.height - 600,
                  maxExtent: MediaQuery.of(context).size.height - 100,
                  child: Container(color: Colors.blue[100]),
                ),
              ],
            )));
  }
}
