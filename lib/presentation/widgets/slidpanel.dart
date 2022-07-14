import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'nutrion_image.dart';

class PanelDetails extends StatelessWidget {
  const PanelDetails({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 400.0,
      body: Center(child: RecipeScreen(image: image,)),
      panel: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Peanut Butter & Bannana in a Tortilla'),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_outlined),
                color: Colors.red,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellowAccent),
                child: Center(child: Text('419 cal')),
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(child: Text('6 min')),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 55,
            color: Color.fromARGB(122, 158, 158, 158),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Ingredients'),
            ),
          ),
          Ingredients('1 whole wheat tortilla'),
          Ingredients('2 TBSP natural peanut butter'),
          Ingredients(' 1 banana , peeled and sliced'),
          Container(
            width: double.infinity,
            height: 55,
            color: Color.fromARGB(122, 158, 158, 158),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Direction'),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Spread peanut butter onto tortilla '),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'Layer banana slice on peanut butter,   wrap \n and roll'),
            ),
          )
        ],
      ),
    );
  }

  Padding Ingredients(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
    );
  }
}
