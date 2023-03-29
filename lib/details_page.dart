import 'package:fitnessapps/model/model_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  // const DetailsPage({Key? key}) : super(key: key);

  FitnessModel fitnessModel;
  DetailsPage({required this.fitnessModel});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Image.network("${widget.fitnessModel.image}",fit: BoxFit.cover,height: double.infinity,),),

    );
  }
}
