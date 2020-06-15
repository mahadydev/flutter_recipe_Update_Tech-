import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_updatetechltd/provider/authentication.dart';
import 'package:recipe_app_updatetechltd/screens/detailspage.dart';
import 'package:recipe_app_updatetechltd/util/constants.dart';
import 'package:recipe_app_updatetechltd/widget/recipe_card.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.backGroundColor,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
                child: Container(
                  color: Constants.fadeWhiteColor,
                  height: _size.height / 7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                          child: Container(
                            width: _size.width - 80,
                            child: Card(
                              color: Constants.fadeWhiteColor,
                              child: ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.search,
                                      color: Colors.blueGrey,
                                    ),
                                    Expanded(
                                      child: Text(
                                        ' Type in what you are looking for',
                                        overflow: TextOverflow.clip,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          color: Colors.blueGrey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Image.asset(
                            'assets/avatar.jpg',
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 10),
                      child: Text(
                        'ALL RECIPE',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.textTitleColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        'TODAY',
                        style: TextStyle(
                          fontSize: 18,
                          color: Constants.textSubTitleColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        'CATEGORIES',
                        style: TextStyle(
                          fontSize: 18,
                          color: Constants.textSubTitleColor,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Text(
                        'FAVORITES',
                        style: TextStyle(
                          fontSize: 18,
                          color: Constants.textSubTitleColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (context, Authentication _auth, _) =>
                      ListView.builder(
                    itemCount: _auth.recipeData.data.length ?? 0,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              data: _auth.recipeData.data[index],
                            ),
                          ),
                        );
                      },
                      child: RecipeCard(
                        imgUrl: _auth.recipeData.data[index].imageUrl,
                        title: _auth.recipeData.data[index].title,
                        servings: _auth.recipeData.data[index].servings,
                        totalTime: _auth.recipeData.data[index].totalTime,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
