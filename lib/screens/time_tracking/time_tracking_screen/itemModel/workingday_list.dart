import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:provider/provider.dart';

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerecordingProvider>(builder: (context, model, child) {
      return Container(
        height: 300,
        width: 350,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color.fromARGB(255, 80, 73, 72)),
        child: ListView.builder(
            itemCount: model.workingTimesList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(model.workingTimesList[index]),
                onDismissed: (direction) {
                  model.timeRepository.deleteWorkPlace(model.workingTimesList[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 120,
                      width: 300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Arbeitstag : ${model.workingTimesList[index].workday}',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 125,
                                height: 78,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Projekt :'),
                                    Text(
                                      model.workingTimesList[index].projectTitle,
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 115,
                                height: 78,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Arbeitsplatz :'),
                                    Text(
                                      model.workingTimesList[index].workplaceTitle,
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 93,
                                height: 78,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Std | Min | Sec'),
                                    Text(
                                      '${model.workingTimesList[index].hours} : ${model.workingTimesList[index].minutes} : ${model.workingTimesList[index].seconds}',
                                      style: const TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                          )
                        ],
                      )),
                ),
              );
            }),
      );
    });
  }
}
