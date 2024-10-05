import 'package:bogsandmila/logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TenantPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final uid;
  // ignore: prefer_typing_uninitialized_variables
  final type;
  // ignore: prefer_typing_uninitialized_variables
  final buildingnumber;
  const TenantPage(
      {super.key,
      required this.uid,
      required this.type,
      required this.buildingnumber});

  @override
  // ignore: library_private_types_in_public_api
  _TenantPageState createState() => _TenantPageState();
}

class _TenantPageState extends State<TenantPage> {
  final int _rowsPerPage = 10;
  int _currentPage = 0;
  String? selectedValue;
  String? selectedValue2;
  String vacantValue = 'Yes';
  @override
  Widget build(BuildContext context) {
    List<String> dropdownItems = [
      'Vacancy',
      'Vie Sub-Account',
      'Reset Password',
      'Archive'
    ];
    List<String> dropdownItems2 = ['Reset Password', 'Delete Account'];
    List<String> dropdownVacant = [
      'Yes',
      'No',
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dataTableTheme: DataTableThemeData(
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => const Color.fromARGB(224, 17, 17, 17),
          ),
          dataRowColor: WidgetStateColor.resolveWith(
            (states) => Colors.white,
          ),
          headingTextStyle: const TextStyle(color: Colors.white),
          dataTextStyle: const TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LogoPage(uid: widget.uid, type: widget.type),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: const Color.fromARGB(240, 17, 17, 17),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/manageuser.png'),
                            width: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Tenant',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: widget.buildingnumber == '0'
                            ? FirebaseFirestore.instance
                                .collection('tenant')
                                .where('archive', isEqualTo: '0')
                                .snapshots()
                            : FirebaseFirestore.instance
                                .collection('tenant')
                                .where('buildingnumber',
                                    isEqualTo: widget.buildingnumber.toString())
                                .where('archive', isEqualTo: '0')
                                .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong'));
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final data = snapshot.data!.docs;
                          final startIndex = _currentPage * _rowsPerPage;
                          final endIndex =
                              (startIndex + _rowsPerPage < data.length)
                                  ? startIndex + _rowsPerPage
                                  : data.length;

                          return Column(
                            children: [
                              DataTable(
                                columns: [
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Payer Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Building Number',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Unit Number',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Contact Number',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Username',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Password',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  endIndex - startIndex,
                                  (index) {
                                    final doc = data[startIndex + index];
                                    final firstname = doc['firstname'] ?? '';
                                    final lastname = doc['lastname'] ?? '';
                                    final buildingnumber =
                                        doc['buildingnumber'] ?? '';
                                    final unitnumber = doc['unitnumber'] ?? '';
                                    final contactnumber =
                                        doc['contactnumber'] ?? '';
                                    final username = doc['username'] ?? '';
                                    final password = doc['password'] ?? '';

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('$firstname $lastname',
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(buildingnumber,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(unitnumber,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(contactnumber,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(username,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(password,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          DropdownButtonFormField<String>(
                                            value: selectedValue,

                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            icon: const FaIcon(FontAwesomeIcons
                                                .ellipsisVertical), // Remove the default dropdown icon
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedValue = null;

                                                if (newValue == 'Vacancy') {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Vacancy'),
                                                        content: SizedBox(
                                                          height: 100,
                                                          child: Column(
                                                            children: [
                                                              DropdownButtonFormField<
                                                                  String>(
                                                                value:
                                                                    vacantValue,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  setState(() {
                                                                    vacantValue =
                                                                        newValue!;
                                                                  });
                                                                },
                                                                items: dropdownVacant.map<
                                                                    DropdownMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                        value),
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child: const Text(
                                                                'Close'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              if (vacantValue ==
                                                                  'Yes') {
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'tenant')
                                                                    .doc(doc.id)
                                                                    .update({
                                                                  'vacant':
                                                                      'Yes',
                                                                });
                                                              } else {
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'tenant')
                                                                    .doc(doc.id)
                                                                    .update({
                                                                  'vacant':
                                                                      'No',
                                                                });
                                                              }

                                                              SuccessMessage(
                                                                  'Successfully Set Vacant');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child: const Text(
                                                                'Save'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                } else if (newValue ==
                                                    'Reset Password') {
                                                  FirebaseFirestore.instance
                                                      .collection('tenant')
                                                      .doc(doc.id)
                                                      .update({
                                                    'password': '123456789',
                                                  });

                                                  SuccessMessage(
                                                      'Successfully Reset Password');
                                                } else if (newValue ==
                                                    'Archive') {
                                                  FirebaseFirestore.instance
                                                      .collection('tenant')
                                                      .doc(doc.id)
                                                      .update({
                                                    'archive': '1',
                                                  });

                                                  SuccessMessage(
                                                      'Successfully Archive Account');
                                                }
                                              });
                                            },
                                            items: dropdownItems
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    (data.length / _rowsPerPage).ceil(),
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _currentPage = index;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _currentPage == index
                                              ? const Color(0xdd1E1E1E)
                                              : Colors.white,
                                          foregroundColor: _currentPage == index
                                              ? Colors.white
                                              : const Color(0xdd1E1E1E),
                                        ),
                                        child: Text((index + 1).toString()),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      color: const Color.fromARGB(240, 17, 17, 17),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/manageuser.png'),
                            width: 40,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Admin',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong'));
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final data = snapshot.data!.docs;
                          final startIndex = _currentPage * _rowsPerPage;
                          final endIndex =
                              (startIndex + _rowsPerPage < data.length)
                                  ? startIndex + _rowsPerPage
                                  : data.length;

                          return Column(
                            children: [
                              DataTable(
                                columns: [
                                  DataColumn(
                                    label: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Username',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.40,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Password',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Action',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                  endIndex - startIndex,
                                  (index) {
                                    final doc = data[startIndex + index];
                                    final username = doc['username'] ?? '';
                                    final password = doc['password'] ?? '';

                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(username,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(password,
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        DataCell(
                                          DropdownButtonFormField<String>(
                                            value: selectedValue2,

                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            icon: const FaIcon(FontAwesomeIcons
                                                .ellipsisVertical), // Remove the default dropdown icon
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedValue2 = null;

                                                if (newValue ==
                                                    'Reset Password') {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(doc.id)
                                                      .update({
                                                    'password': '123456789',
                                                  });

                                                  SuccessMessage(
                                                      'Successfully Reset Password');
                                                } else if (newValue ==
                                                    'Delete Account') {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(doc.id)
                                                      .delete();
                                                  SuccessMessage(
                                                      'Successfully Delete Account');
                                                }
                                              });
                                            },
                                            items: dropdownItems2
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    (data.length / _rowsPerPage).ceil(),
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _currentPage = index;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: _currentPage == index
                                              ? const Color(0xdd1E1E1E)
                                              : Colors.white,
                                          foregroundColor: _currentPage == index
                                              ? Colors.white
                                              : const Color(0xdd1E1E1E),
                                        ),
                                        child: Text((index + 1).toString()),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(255, 30, 30, 30),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Center(
                  child: Text(
                    'Copyright © Bogs and Mila Apartment. All Rights Reserved.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SuccessMessage(String label) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(label),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    ));
  }
}
