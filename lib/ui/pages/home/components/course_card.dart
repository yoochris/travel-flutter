import 'package:first_app/models/travel_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.card});

  final TravelCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 280,
      width: 260,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(10),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage(card.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  size: 16,
                  Icons.favorite_border_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              top: 180,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "8 days · from \$456/person",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha(120)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: Theme.of(context).colorScheme.primary,
                                size: 14,
                              ),
                              Text(card.rating,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${card.reviews} reviews",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withAlpha(120)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      )
                    ]),
              )),
        ],
      ),
    );
  }
}
