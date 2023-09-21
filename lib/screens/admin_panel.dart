import 'package:flutter/material.dart';
import 'admin_login_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: AdminPanelScreen(
        adminId: 'ABX1299',
        patients: [
          Patient(name: 'Sachin', healthPercentage: 95),
          Patient(name: 'Mitali', healthPercentage: 90),
          Patient(name: 'Niha', healthPercentage: 97),
          Patient(name: 'Vedika', healthPercentage: 91),
          Patient(name: 'Aditya', healthPercentage: 92),
          Patient(name: 'Alex', healthPercentage: 100),
          // Add more patients here
        ],
      ),
    );
  }
}

class AdminPanelScreen extends StatefulWidget {
  final String adminId;
  final List<Patient> patients;

  AdminPanelScreen({required this.adminId, required this.patients});

  @override
  _AdminPanelScreenState createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  // Function to delete a patient
  void _deletePatient(int index) {
    setState(() {
      widget.patients.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin ID: ${widget.adminId}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Text(
              "Patient Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.patients.length,
                itemBuilder: (context, index) {
                  final patient = widget.patients[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Name: ${patient.name}"),
                      subtitle: Text(
                        "Health Percentage: ${patient.healthPercentage.toStringAsFixed(2)}%",
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deletePatient(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Patient {
  final String name;
  final double healthPercentage;

  Patient({required this.name, required this.healthPercentage});
}
