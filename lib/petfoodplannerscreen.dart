import 'package:flutter/material.dart';

class Petfoodplannerscreen extends StatefulWidget {
  const Petfoodplannerscreen({super.key});

  @override
  State<Petfoodplannerscreen> createState() => _PetfoodplannerscreenState();
}

class _PetfoodplannerscreenState extends State<Petfoodplannerscreen> {
  // Controller for pet weight input
  final TextEditingController weightInput = TextEditingController();

  // Dropdown values
  String typePet = 'Cat';
  String levelSelected = 'Low';

  // Output result
  double totalFood = 0.0;

  // Function to calculate food amount based on pet type and activity
  void calculateFood() {
    double weight = double.tryParse(weightInput.text) ?? 0;

    if (weight <= 0) {
      setState(() {
        totalFood = 0;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid pet weight')),
      );
      return;
    }

    // Base food per kg depending on pet type
    double baseFood = typePet == 'Cat' ? 30 : 40;
    double multiplier = 1.0;

    // Adjust based on activity level
    if (levelSelected == 'Mid') {
      multiplier = 1.2;
    } else if (levelSelected == 'High') {
      multiplier = 1.4;
    }

    double result = weight * baseFood * multiplier;

    setState(() {
      totalFood = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Food Planner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 237, 216, 255),
            ),
            child: Column(
              children: [
                // Pet Type dropdown
                Row(
                  children: [
                    const SizedBox(width: 100, child: Text('Pet Type')),
                    SizedBox(
                      width: 120,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: DropdownButton<String>(
                          value: typePet,
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: ['Cat', 'Dog']
                              .map(
                                (type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              typePet = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Weight input
                Row(
                  children: [
                    const SizedBox(width: 100, child: Text('Weight (kg):')),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: weightInput,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter weight',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Activity level dropdown
                Row(
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Activity Level'),
                    ),
                    SizedBox(
                      width: 120,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: DropdownButton<String>(
                          value: levelSelected,
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: ['Low', 'Mid', 'High']
                              .map(
                                (level) => DropdownMenuItem(
                                  value: level,
                                  child: Text(level),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              levelSelected = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Calculate button
                ElevatedButton(
                  onPressed: calculateFood,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),

                // Output text
                Text(
                  totalFood > 0
                      ? 'Daily Food Needed: ${totalFood.toStringAsFixed(0)} g'
                      : 'Enter details to calculate',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
