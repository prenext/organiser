import 'package:flutter/material.dart';

class progress_card extends StatelessWidget {
  const progress_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: Color.fromARGB(17, 134, 134, 134),
        elevation: 5,
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Days 365",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 8, 92, 141),
                            fontWeight: FontWeight.bold)),
                    Text("Tasks 900",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 11, 129, 158),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Done 200",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        LinearProgressIndicator(
                          value: 0.7, // Replace with your actual percentage
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ignored 23",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        LinearProgressIndicator(
                          value: 0.3, // Replace with your actual percentage
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Waiting 677",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        LinearProgressIndicator(
                          value: 0.5, // Replace with your actual percentage
                          backgroundColor: Colors.grey,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
