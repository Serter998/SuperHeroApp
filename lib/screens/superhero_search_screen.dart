import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/superhero_detail_response.dart';
import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:superhero_app/data/repository.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {
  Future<SuperheroResponse?>? _superHeroInfo;
  Repository _repository = Repository();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SuperHero search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Busca un superheroe",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superHeroInfo = _repository.fetchSuperHeroInfo(text);
                });
              },
            ),
          ),
          bodyList(_isTextEmpty),
        ],
      ),
    );
  }

  FutureBuilder<SuperheroResponse?> bodyList(bool _isTextEmpty) {
    return FutureBuilder(
      future: _superHeroInfo,
      builder: (contexto, snapshot) {
        if(_isTextEmpty) return Center(child: Text("No hay resultados"));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          var superHeroList = snapshot.data?.result;
          return Expanded(
            child: ListView.builder(
              itemCount: superHeroList?.length ?? 0,
              itemBuilder: (context, index) {
                if (superHeroList != null) {
                  return itemSuperhero(superHeroList[index]);
                } else {
                  Text("Error");
                }
              },
            ),
          );
        } else {
          return Text("No hay resultados");
        }
      },
    );
  }

  Padding itemSuperhero(SuperHeroDetailResponse item) => Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.red,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.url,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment(0, -0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
