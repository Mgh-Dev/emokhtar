import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileInformationScreen extends StatefulWidget {
  const ProfileInformationScreen({super.key});

  @override
  State<ProfileInformationScreen> createState() => _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;
  DateTime? _selectedDate;
  final TextEditingController _firstNameEnController = TextEditingController();
  final TextEditingController _secondNameEnController = TextEditingController();
  final TextEditingController _thirdNameEnController = TextEditingController();
  final TextEditingController _familyNameEnController = TextEditingController();
  final TextEditingController _firstNameArController = TextEditingController();
  final TextEditingController _secondNameArController = TextEditingController();
  final TextEditingController _thirdNameArController = TextEditingController();
  final TextEditingController _familyNameArController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController(text: '+961');
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color(0xFF075E54),
        centerTitle: true,
        title: const Text(
          'Profile Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // English Names
              const Text(
                'English Names',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _firstNameEnController,
                decoration: const InputDecoration(
                  labelText: 'First Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _secondNameEnController,
                decoration: const InputDecoration(
                  labelText: 'Second Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _thirdNameEnController,
                decoration: const InputDecoration(
                  labelText: 'Third Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _familyNameEnController,
                decoration: const InputDecoration(
                  labelText: 'Family Name *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required field';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Arabic Names
              const Text(
                'Arabic Names',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _firstNameArController,
                decoration: const InputDecoration(
                  labelText: 'الاسم الأول *',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'حقل مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _secondNameArController,
                decoration: const InputDecoration(
                  labelText: 'الاسم الثاني',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _thirdNameArController,
                decoration: const InputDecoration(
                  labelText: 'الاسم الثالث',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _familyNameArController,
                decoration: const InputDecoration(
                  labelText: 'اسم العائلة *',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.right,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'حقل مطلوب';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Date of Birth
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: _selectedDate != null
                          ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                          : '',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Gender
              const Text(
                'Gender *',
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    activeColor: const Color(0xFF075E54),
                  ),
                  const Text('Male'),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    activeColor: const Color(0xFF075E54),
                  ),
                  const Text('Female'),
                ],
              ),
              if (_gender == null)
                const Text(
                  'Please select gender',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              const SizedBox(height: 20),

              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Phone Number
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      controller: _countryCodeController,
                      decoration: const InputDecoration(
                        labelText: 'Code',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 5,
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF075E54),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _gender != null) {
                      // Save logic here
                      Navigator.pop(context);
                    } else if (_gender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select gender')),
                      );
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameEnController.dispose();
    _secondNameEnController.dispose();
    _thirdNameEnController.dispose();
    _familyNameEnController.dispose();
    _firstNameArController.dispose();
    _secondNameArController.dispose();
    _thirdNameArController.dispose();
    _familyNameArController.dispose();
    _emailController.dispose();
    _countryCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}