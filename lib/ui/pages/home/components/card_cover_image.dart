import 'dart:ui';

import 'package:first_app/models/travel_card.dart';
import 'package:flutter/material.dart';

class CardCoverImage extends StatelessWidget {
  final TravelCard card;
  final bool isFrontCard;
  final double? height;
  const CardCoverImage(
      {super.key, required this.card, required this.isFrontCard, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: height,
      child: AspectRatio(
          aspectRatio: .80,
          child: Container(
              clipBehavior: Clip.hardEdge,
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
              ),
              child: isFrontCard
                  ? Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Colors.transparent
                                  ])),
                            )),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 116,
                                  child: Text(card.contry,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withAlpha(180)))),
                              Positioned(
                                  bottom: 90,
                                  child: Text(card.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface))),
                              Positioned(
                                  bottom: 64,
                                  child: Row(
                                    spacing: 10,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface
                                                      .withAlpha(120)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Row(
                                            spacing: 4,
                                            children: [
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                size: 14,
                                              ),
                                              Text(card.rating,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .surface))
                                            ],
                                          )),
                                      Text("${card.reviews} reviews",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surface))
                                    ],
                                  )),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 16),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 4),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 50,
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: double.infinity,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "See more",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface),
                                              ),
                                            ),
                                            Positioned(
                                                right: 0,
                                                child: Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  ),
                                                ))
                                          ],
                                        )),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container())),
    );
  }
}
