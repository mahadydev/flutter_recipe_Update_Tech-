import 'package:flutter/material.dart';
import 'package:recipe_app_updatetechltd/util/constants.dart';

class RecipeCard extends StatelessWidget {
  final String imgUrl;
  final String title;

  final int servings;
  final int totalTime;

  const RecipeCard({
    @required this.imgUrl,
    @required this.title,
    @required this.servings,
    @required this.totalTime,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: imgUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
                height: 220,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Raleway',
              color: Constants.textTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Constants.textSubTitleColor,
                  ),
                  Text(
                    'Total Time : ${totalTime.toString()}' ?? ' -',
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
                    ' Servings :',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Constants.textSubTitleColor,
                    ),
                  ),
                  Text(
                    servings.toString() ?? ' -',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Constants.textSubTitleColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
