import 'package:flutter/material.dart';
import 'package:superhero_app/components/superhero_stat.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroDetailScreen extends StatelessWidget {
  final SuperHeroDetailResponse superhero;

  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Superhero ", style: TextStyle(fontSize: 16),),
            Icon(Icons.arrow_right_alt),
            Text(" ${superhero.name}", style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.network(
            superhero.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
          ),
          Text(superhero.name, style: TextStyle(fontSize: 28)),
          Text(
            superhero.realName,
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          SizedBox(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SuperHeroStat(tipoStat: "Power", statNum: superhero.powerStatsResponse.power ?? "0", color: Colors.red,),
                SuperHeroStat(tipoStat: "Intelligence", statNum: superhero.powerStatsResponse.intelligence ?? "0", color: Colors.lightBlue,),
                SuperHeroStat(tipoStat: "Strength", statNum: superhero.powerStatsResponse.strength ?? "0", color: Colors.blueGrey,),
                SuperHeroStat(tipoStat: "Speed", statNum: superhero.powerStatsResponse.speed ?? "0", color: Colors.greenAccent,),
                SuperHeroStat(tipoStat: "Durability", statNum: superhero.powerStatsResponse.durability ?? "0", color: Colors.orangeAccent,),
                SuperHeroStat(tipoStat: "Combat", statNum: superhero.powerStatsResponse.combat ?? "0", color: Colors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
