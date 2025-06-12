import 'package:first_app/models/travel_card.dart';
import 'package:flutter/material.dart';

class CardCoverImage extends StatelessWidget {
  final TravelCard card;
  final double? height;
  const CardCoverImage({super.key, required this.card, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: height,
      child: AspectRatio(
          aspectRatio: .80,
          child: DecoratedBox(
              decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage(card.image), fit: BoxFit.cover),
            boxShadow: [
              // BoxShadow(
              //   color: Colors.black.withAlpha(20),
              //   blurRadius: 30,
              //   offset: Offset(-10, 10),
              // )
            ],
          ))),
    );
  }
}
