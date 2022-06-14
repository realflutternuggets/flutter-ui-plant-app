
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';
import 'package:flutter_onboarding/ui/detail_page.dart';
import 'package:page_transition/page_transition.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    //Fetch the plant list data from the model
    final List<Plant> _plantList = Plant.plantList;

    //Filter the list to contain only favorated items
    final List<Plant> _favoratedPlants = _plantList
        .where((element) => element.isFavorated == true)
        .toList();

    return Scaffold(
      body: _favoratedPlants.length == 0 ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/favorited.png'),
            ),
            const SizedBox(height: 10,),
            Text('Your favorited plants', style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
            const SizedBox(height: 10,),
            Text('will appear here.', style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
          ],
        ),
      ) :
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        height: size.height * .5,
        child: ListView.builder(
          itemCount: _favoratedPlants.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: DetailPage(plantId: _favoratedPlants[index].plantId,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 80,
                padding: const EdgeInsets.only(left: 10),
                margin: const EdgeInsets.only(bottom: 20),
                width: size.width,
                //height: 30.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.8),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 80,
                            child: Image.asset(_favoratedPlants[index].imageURL),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_favoratedPlants[index].category),
                              Text(
                                _favoratedPlants[index].plantName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Constants.blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        r'$' + _favoratedPlants[index].price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
