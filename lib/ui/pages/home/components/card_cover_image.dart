import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:first_app/models/travel_card.dart';
import 'package:first_app/ui/pages/home/components/card_detail.dart';
import 'package:flutter/material.dart';

class CardCoverImage extends StatefulWidget {
  final TravelCard card;
  final bool isFrontCard;
  final double? height;
  // ... other fields

  const CardCoverImage(
      {super.key, required this.card, required this.isFrontCard, this.height});

  @override
  State<CardCoverImage> createState() => _CardCoverImageState();
}

class _CardCoverImageState extends State<CardCoverImage>
    with SingleTickerProviderStateMixin {
  void _onTap() {
    if (widget.isFrontCard) {
      final page = CardDetail(
        card: widget.card,
      );
      Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (_, animation1, __) => page,
            transitionsBuilder: (_, animation1, animation2, child) {
              return FadeTransition(
                opacity: animation1,
                child: child,
              );
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: widget.height,
      child: AspectRatio(
          aspectRatio: .80,
          child: GestureDetector(
              onTap: _onTap,
              child: Hero(
                  tag: widget.card.title,
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(widget.card.image),
                            fit: BoxFit.cover),
                        boxShadow: [
                          // BoxShadow(
                          //   color: Colors.black.withAlpha(20),
                          //   blurRadius: 30,
                          //   offset: Offset(-10, 10),
                          // )
                        ],
                      ),
                      child: widget.isFrontCard
                          ? Stack(
                              children: [
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: FadeIn(
                                        duration: Duration(milliseconds: 500),
                                        delay: Duration(milliseconds: 200),
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors: [
                                                Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                Colors.transparent
                                              ])),
                                        ))),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: 116,
                                          child: FadeInUp(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              delay:
                                                  Duration(milliseconds: 200),
                                              child: Text(widget.card.contry,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .surface
                                                          .withAlpha(180))))),
                                      Positioned(
                                          bottom: 90,
                                          child: FadeInUp(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              delay:
                                                  Duration(milliseconds: 400),
                                              child: Text(widget.card.title,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .surface)))),
                                      Positioned(
                                          bottom: 64,
                                          child: FadeInUp(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              delay:
                                                  Duration(milliseconds: 600),
                                              child: Row(
                                                spacing: 10,
                                                children: [
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .surface
                                                                  .withAlpha(
                                                                      120)),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                      child: Row(
                                                        spacing: 4,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .star_border_outlined,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .surface,
                                                            size: 14,
                                                          ),
                                                          Text(
                                                              widget
                                                                  .card.rating,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .surface))
                                                        ],
                                                      )),
                                                  Text(
                                                      "${widget.card.reviews} reviews",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .surface))
                                                ],
                                              ))),
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: FadeInUp(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              delay:
                                                  Duration(milliseconds: 800),
                                              child: Container(
                                                height: 50,
                                                margin:
                                                    EdgeInsets.only(top: 16),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4, vertical: 4),
                                                decoration: BoxDecoration(
                                                    color: Colors.black87
                                                        .withAlpha(50),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    border: Border.all(
                                                      width: 0,
                                                      color: Colors.white
                                                          .withAlpha(255),
                                                    )),
                                                clipBehavior: Clip.hardEdge,
                                                child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                      sigmaX: 5,
                                                      sigmaY: 5,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "See more",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .surface),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            right: 0,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .surface,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                              ),
                                                            ))
                                                      ],
                                                    )),
                                              )))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Container())))),
    );
  }
}
