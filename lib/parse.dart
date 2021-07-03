import 'package:flutter/material.dart';
import 'Employee.dart';
import 'Services.dart';

class Parser extends StatefulWidget {
  //
  Parser() : super();

  final String title = 'Flutter Data Table';

  @override
  ParserState createState() => ParserState();
}

class ParserState extends State<Parser> {
  List<Employee> _employees;
  GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the First Name TextField we are going to create.
  TextEditingController _nameController;
  // controller for the Last Name TextField we are going to create.
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _addressController;
  Employee _selectedEmployee;
  bool _isUpdating;
  String _titleProgress;

  @override
  void initState() {
    super.initState();
    _employees = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _getEmployees();
  }

  // Method to update title in the AppBar Title
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _createTable() {
    _showProgress('Creating Table...');
    Services.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }

  // Now lets add an Employee
  _addEmployee() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding Employee...');
    Services.addEmployee(_nameController.text, _phoneController.text,
            _emailController.text, _addressController.text)
        .then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh the List after adding each employee...
        _clearValues();
      }
    });
  }

  _getEmployees() {
    _showProgress('Loading Employees...');
    Services.getEmployees().then((employees) {
      setState(() {
        _employees = employees;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${employees.length}");
    });
  }

  _updateEmployee(Employee employee) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Updating Employee...');
    Services.updateEmployee(
            employee.id,
            _nameController.text,
            _phoneController.text,
            _emailController.text,
            _addressController.text)
        .then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }

  _deleteEmployee(Employee employee) {
    _showProgress('Deleting Employee...');
    Services.deleteEmployee(employee.id).then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh after delete...
      }
    });
  }

  // Method to clear TextField values
  _clearValues() {
    _nameController.text = '';
    _emailController.text = '';
    _phoneController.text = '';
    _addressController.text = '';
  }

  _showValues(Employee employee) {
    _nameController.text = employee.name;
    _phoneController.text = employee.phone;
    _emailController.text = employee.email;
    _addressController.text = employee.address;
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              label: Text('NAME'),
            ),
            DataColumn(
              label: Text('EMAIL'),
            ),
            DataColumn(
              label: Text('PHONE'),
            ),
            DataColumn(
              label: Text('ADDRESS'),
            ),
            DataColumn(
              label: Text('DELETE'),
            )
          ],
          rows: _employees
              .map(
                (employee) => DataRow(cells: [
                  DataCell(
                    Text(employee.id),
                    onTap: () {
                      _showValues(employee);
                      _selectedEmployee = employee;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      employee.name.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      // Set flag updating to true to indicate in Update Mode
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      employee.email.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      // Set flag updating to true to indicate in Update Mode
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      employee.phone.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      // Set flag updating to true to indicate in Update Mode
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      employee.address.toUpperCase(),
                    ),
                    onTap: () {
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteEmployee(employee);
                    },
                  ))
                ]),
              )
              .toList(),
        ),
      ),
    );
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress), // we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _createTable();
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getEmployees();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _phoneController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Address',
                ),
              ),
            ),
            _isUpdating
                ? Row(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('UPDATE'),
                        onPressed: () {
                          _updateEmployee(_selectedEmployee);
                        },
                      ),
                      OutlineButton(
                        child: Text('CANCEL'),
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                          });
                          _clearValues();
                        },
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: _dataBody(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addEmployee();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
