import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperHeroStat extends StatefulWidget {
  final String tipoStat;
  final String statNum;
  final Color color;
  const SuperHeroStat({super.key, required this.tipoStat, required this.statNum, required this.color});

  @override
  State<SuperHeroStat> createState() => _SuperHeroStatState();
}

class _SuperHeroStatState extends State<SuperHeroStat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: double.tryParse(
            widget.statNum,
          ) ?? 0.0,
          width: 20,
          color: widget.color,
        ),
        Text(widget.tipoStat, style: TextStyle(fontSize: 12),),
      ],
    );
  }
}
