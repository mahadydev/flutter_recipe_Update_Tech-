import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_updatetechltd/models/datum.dart';
import 'package:recipe_app_updatetechltd/util/constants.dart';

class DetailsPage extends StatelessWidget {
  final Datum data;
  DetailsPage({
    @required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromRGBO(247, 251, 254, 1),
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: data.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(25),
                    bottomRight: const Radius.circular(25),
                  ),
                  child: Image.network(
                    data.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Constants.textSubTitleColor,
                  ),
                  onPressed: () {}),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Constants.backGroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.title,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(62, 67, 94, 1),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  color: Constants.textSubTitleColor,
                                ),
                                Text(
                                  'Total Time : ${data.totalTime.toString()}',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Constants.textSubTitleColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Servings: ',
                                  style: TextStyle(
                                    color: Constants.textSubTitleColor,
                                  ),
                                ),
                                Text(
                                  data.servings.toString(),
                                  style: TextStyle(
                                    color: Constants.textSubTitleColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 30,
                            color: Constants.textSubTitleColor,
                          ),
                          Icon(
                            Icons.person_outline,
                            size: 30,
                            color: Constants.textSubTitleColor,
                          ),
                          Icon(
                            Icons.delete,
                            size: 30,
                            color: Constants.textSubTitleColor,
                          ),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Constants.textTitleColor,
                          ),
                          Text(
                            ' Ingredients',
                            style: Constants.kTitleTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlayCurve: Curves.fastOutSlowIn,
                          height: 150,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(milliseconds: 3000),
                          pauseAutoPlayOnTouch: true,
                        ),
                        itemCount: data.ingredients.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Card(
                          color: Colors.deepOrangeAccent,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('${data.ingredients[itemIndex].name}',
                                      style: Constants.kIngredientTextStyle),
                                  data.ingredients[itemIndex].preparation !=
                                          null
                                      ? Text(
                                          'Preparation: ${data.ingredients[itemIndex].preparation}',
                                          style: Constants.kIngredientTextStyle)
                                      : SizedBox(),
                                  Text(
                                      'Quantity:  ${data.ingredients[itemIndex].displayQuantity}  ${data.ingredients[itemIndex].unit.abbreviation}',
                                      style: Constants.kIngredientTextStyle),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.directions,
                            color: Constants.textTitleColor,
                          ),
                          Text(
                            ' Directions',
                            style: Constants.kTitleTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                          height: 500,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(milliseconds: 5000),
                          pauseAutoPlayOnTouch: true,
                        ),
                        itemCount: data.directions.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Card(
                          color: Colors.deepOrangeAccent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Center(
                              child: Text(
                                  '${data.directions[itemIndex].step}: ${data.directions[itemIndex].text}',
                                  style: Constants.kStepsTextStyle),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
