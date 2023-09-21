import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: DoctorAppointment(),
    );
  }
}

class DoctorAppointment extends StatefulWidget {
  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController spo2Controller = TextEditingController();
  String uploadStatus = '';

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.thingspeak.com/channels/875453/feeds.json?api_key=1DSQ7R1XTT1OK0Z1&results=1',
        ),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }

  Future<void> uploadData() async {
    final heartRate = heartRateController.text;
    final spo2 = spo2Controller.text;

    // Simulate data upload (replace with your actual API logic)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      uploadStatus = 'Data Uploaded!\nHeart Rate: $heartRate, SpO2: $spo2';
    });

    heartRateController.clear();
    spo2Controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.favorite,
                      //   color: Colors.red,
                      //   size: 36.0,
                      // ),
                      SizedBox(width: 10),
                      Text(
                        'Current Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20), // Added more padding
                width: double.infinity, // Make the container wider
                height: 220, // Increase the height
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<Map<String, dynamic>>(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          );
                        } else if (!snapshot.hasData) {
                          return Text(
                            'No data available',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          );
                        } else {
                          final heartRate =
                          snapshot.data?['feeds'][0]['field1'].toString();
                          final spo2 = snapshot.data?['feeds'][0]['field2'].toString();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[

                                  SizedBox(width: 10),
                                  Text(
                                    'Patient Data',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 34.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Heart Rate: $heartRate',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10), // Add spacing
                              Text(
                                'SpO2: $spo2',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
