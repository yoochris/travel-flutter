import 'package:first_app/models/travel_card.dart';
import 'package:flutter/material.dart';

class TravelDetails extends StatefulWidget {
  final int index;
  final List<TravelCard> travelCards;
  const TravelDetails({
    super.key,
    required this.index,
    required this.travelCards,
  });

  static void push(
    BuildContext context, {
    required int index,
    required List<TravelCard> travelCards,
  }) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                TravelDetails(index: index, travelCards: travelCards)));
  }

  @override
  State<TravelDetails> createState() => _TravelDetailsState();
}

class _TravelDetailsState extends State<TravelDetails> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
