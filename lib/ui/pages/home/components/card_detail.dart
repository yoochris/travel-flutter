import 'package:animate_do/animate_do.dart';
import 'package:first_app/models/travel_card.dart';
import 'package:first_app/ui/pages/home/components/course_card.dart';
import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

class CardDetail extends StatefulWidget {
  final TravelCard card;
  const CardDetail({super.key, required this.card});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  SheetController sheetController = SheetController();
  bool _showFullDescription = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        sheetController.animateTo(
          MediaQuery.of(context).size.height - 200,
          duration: Duration(milliseconds: 800),
          curve: Curves.linear,
        );
      });
    });
  }

  void _onVerticalDrag(
    DragUpdateDetails details,
    BuildContext context,
  ) {
    if (details.primaryDelta! > 3.0) {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    sheetController.dispose();
    super.dispose();
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
                    child: AnimatedBuilder(
                        animation: sheetController.animation,
                        builder: (context, child) {
                          return Image.asset(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height *
                                (1.3 - sheetController.animation.value),
                            alignment: Alignment.bottomCenter,
                            widget.card.image,
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: FadeInDown(
                      duration: Duration(milliseconds: 500),
                      delay: Duration(milliseconds: 500),
                      child: AppBar(
                        centerTitle: true,
                        title: AnimatedBuilder(
                            animation: sheetController.animation,
                            builder: (context, child) {
                              return Text(
                                widget.card.contry,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withAlpha((255 *
                                              (sheetController.animation.value <
                                                      0.5
                                                  ? 0
                                                  : sheetController
                                                      .animation.value))
                                          .toInt()),
                                ),
                              );
                            }),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        scrolledUnderElevation: 0,
                        surfaceTintColor: Colors.transparent,
                        leading: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios_new,
                                color: Theme.of(context).colorScheme.primary),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        actions: [
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    )),
                Sheet(
                  controller: sheetController,
                  initialExtent: 0,
                  minExtent: MediaQuery.of(context).size.height - 500,
                  maxExtent: MediaQuery.of(context).size.height - 200,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha(50),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(widget.card.title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary)),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                      .withAlpha(50)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Row(
                                            spacing: 4,
                                            children: [
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                size: 14,
                                              ),
                                              Text(widget.card.rating,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary))
                                            ],
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(widget.card.contry,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary)),
                                      Spacer(),
                                      Text('${widget.card.reviews} reviews',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary))
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    widget.card.description,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    maxLines: _showFullDescription ? null : 3,
                                    overflow: _showFullDescription
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  if (!_showFullDescription)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showFullDescription = true;
                                        });
                                      },
                                      child: Text(
                                        "Read more",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("Upcoming tours",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary)),
                                      Text(
                                        "See all",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  SingleChildScrollView(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: TravelCard.fakeTravelCardList
                                          .map(
                                            (card) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: CourseCard(card: card),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  // Add your sheet content here
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
