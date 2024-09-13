import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/decoration/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/src/features/provider/timerec_provider.dart';
import 'package:provider/provider.dart';

class TimelistToPdf extends StatelessWidget {
  const TimelistToPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerecordingProvider>(builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 80, 73, 72),
              title:
                  const Text('Arbeitszeiten to pdf', style: myAppBarTextStyle)),
          body: Center(
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 80, 73, 72),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: model.adminTimeList.length,
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
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 125,
                                  height: 78,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Vorname : ${model.adminTimeList[index].projectTitle}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ));
    });
  }
}
