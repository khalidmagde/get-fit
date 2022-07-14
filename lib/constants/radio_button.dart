import 'package:flutter/material.dart';

class HumanType extends StatefulWidget {
  const HumanType({Key? key}) : super(key: key);

  @override
  State<HumanType> createState() => _HumanTypeState();
}

class _HumanTypeState extends State<HumanType> {
  String gender = "male";
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white,border: Border.all(color: const Color(0xFFD5E8EB)),borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: const Text("ذكر",
                // style: label,
              ),
              leading: Radio(
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  }),
            ),
          ),

          Expanded(
            child: ListTile(
              title: const Text("أنثي",
                // style: label,
              ),
              leading: Radio(
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
