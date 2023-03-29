import 'dart:convert';

import 'package:fitnessapps/details_page.dart';
import 'package:fitnessapps/model/model_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FitnessModel> homeList=[];
  FitnessModel? fitnessModel;
  var url="https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR2kxIqlZhw8IjYfopzkdBrj9LiG--jr0unTuvLbXNEIMBcNaypTTXwilow";

  facheHomeData()async{
    var responcData= await http.get(Uri.parse(url));
    var data=jsonDecode(responcData.body);
    for( var i in data["exercises"]){
      fitnessModel = FitnessModel(
        id: i["id"],
            image: i["thumbnail"],
          title: i["title"],
          gif: i["gif"]

      );
      homeList.add(fitnessModel!);
      setState(() {

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    facheHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Fitness apps")),),
      body: ListView.builder(
          itemCount: homeList.length,
          itemBuilder: (context, index) =>

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(fitnessModel: homeList[index]),));
                    },

                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      // color: Colors.redAccent,
                      height: 160,

                      child: Row(children: [
                        Expanded(flex: 2,child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("${homeList[index].id}",style: TextStyle(fontSize: 25,color: Colors.black.withOpacity(.8),fontWeight: FontWeight.w700),),
                          SizedBox(height: 11,),
                            Text("${homeList[index].title}",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5),fontWeight: FontWeight.w400),),
                          // Text("title",style: TextStyle(fontSize: 18,color: Colors.black.withOpacity(.5),fontWeight: FontWeight.w400),),
                        ],)),
                        Expanded(flex: 1, child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(height: double.infinity,width: 2,color: Colors.redAccent,),
                            SizedBox(width: 2,),
                            Container(height: double.infinity,width: 2,color: Color(0xff1B192E),),],),
                        ) ),
                        Expanded(flex: 3,child: Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child:Card(child: ClipRRect(borderRadius: BorderRadius.circular(12),
                            child: Image.network("${homeList[index].image}",fit: BoxFit.cover,),))),
                        )
                      ],),
                    ),
                  ),
                ),
              )
        ,),
    );
  }
}
