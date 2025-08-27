import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int heightSlider = 120;
  int weight = 60;
  int age = 45;
  int bmiResult = 0;

  Color maleColor = Colors.blue;
  Color femaleColor = Colors.blue;
  Color selectedColor = Colors.teal;

  void calculateBmi() {
    var heightInMeters = heightSlider / 100;
    var bmiResult = weight / (heightInMeters * heightInMeters);
    print(bmiResult.round());
    setState(() {
      this.bmiResult = bmiResult.round();
    });
  }

  void selectGender(bool gender) {
    if (gender) {
      setState(() {
        maleColor = Colors.blue;
        femaleColor = selectedColor;
      });
    } else {
      setState(() {
        femaleColor = Colors.blue;
        maleColor = selectedColor;
      });
    }
  }

  addWeight(bool Weightadd) {
    if (Weightadd) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  addAge(bool Ageadd) {
    if (Ageadd) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }

  String getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectGender(true);
                    });
                    // print('male');
                  },
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: maleColor,
                      borderRadius: BorderRadius.circular(10),
                      border: BoxBorder.all(color: Colors.black, width: 2),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'Male',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Icon(Icons.male, color: Colors.white, size: 50),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectGender(false);
                    });
                    // print('female');
                  },
                  child: Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: femaleColor,
                      borderRadius: BorderRadius.circular(10),
                      border: BoxBorder.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Female',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Icon(
                          Icons.female_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 150,

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: BoxBorder.all(color: Colors.black, width: 2),
              ),

              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Height',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${heightSlider}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'cm',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    value: heightSlider.toDouble(),
                    activeColor: Colors.pink,
                    thumbColor: Colors.amber,
                    min: 100,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        heightSlider = newValue.toInt();
                        // Update the height value here
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 160,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: BoxBorder.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Weight',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${weight}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addWeight(false);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white, // Button color
                            ),
                            child: Icon(Icons.remove),
                          ),

                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              addWeight(true);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white, // Button color
                            ),
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 160,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: BoxBorder.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Age',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${age}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addAge(false);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white, // Button color
                            ),
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(width: 10),

                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              addAge(true);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(10),
                              backgroundColor: Colors.white, // Button color
                            ),
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Example values for height and weight
                calculateBmi();
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Card.filled(
              color: Colors.amber,
              child: ListTile(
                title: Text('Your BMI is: ${bmiResult}'),
                subtitle: Text(
                  'Category: ${getBmiCategory(bmiResult.toDouble())}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
