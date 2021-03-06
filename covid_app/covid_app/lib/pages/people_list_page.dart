import 'package:covid_app/algo_result.dart';
import 'package:flutter/material.dart';

class PeopleListPage extends StatelessWidget {
  final List<AlgoResult> people;
  final String title;
  final Color accentColor;
  final Color textColor;

  PeopleListPage(this.people, this.title, this.accentColor, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: textColor,
        ),
        brightness:
            (textColor == Colors.white) ? Brightness.dark : Brightness.light,
        title: Text(title, style: TextStyle(color: textColor)),
        backgroundColor: accentColor,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) =>
                    PersonDisplayWidget(people[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PersonDisplayWidget extends StatelessWidget {
  final AlgoResult person;

  PersonDisplayWidget(this.person);

  @override
  Widget build(BuildContext context) {
    //temp
    return Container(
        height: 100,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(person.getDisplayName()),
              Text(
                person.score.toStringAsFixed(2),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
