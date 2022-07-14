import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Material(color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          // margin: EdgeInsets.only(right: width(30)),
          // height: 70,
          width: 300,
          child: TextField(
            decoration: const InputDecoration(fillColor: Colors.transparent,
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(backgroundColor: Color(0xFFF5CECE),child: Icon(Icons.close,color: Colors.white,)),
              ),
                hintText: 'Search by title',
                contentPadding: EdgeInsets.all(15),
            ),
            onChanged: (value) {
              // do something
            },
          ),
        ),
      ),
    );
  }
}
