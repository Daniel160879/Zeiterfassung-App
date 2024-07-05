import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/provider/timerec_provider.dart';
import 'package:provider/provider.dart';

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return Consumer<TimerecordingProvider>(builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 80, 73, 72),
              title: const Text('Arbeitszeiten', style: myAppBarTextStyle)),
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 80, 73, 72),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.workingTimesList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          height: 128,
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    DateFormat.yMEd('de').format(model.workingTimesList[index].workday),
                                    style:
                                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    '${DateFormat.Hm().format(model.workingTimesList[index].workday)} Uhr',
                                    style:
                                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
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
                                  ),
                                  Expanded(
                                    child: SizedBox(
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
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 93,
                                      height: 70,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text('Std | Min | Sec'),
                                          Text(
                                            '${twoDigits(model.workingTimesList[index].hours)} : ${twoDigits(model.workingTimesList[index].minutes)} : ${twoDigits(model.workingTimesList[index].seconds)}',
                                            style: const TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )),
                    );
                  }),
            ),
          ));
    });
  }
}
