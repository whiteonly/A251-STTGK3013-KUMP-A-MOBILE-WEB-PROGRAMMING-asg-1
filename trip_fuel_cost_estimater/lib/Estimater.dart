import 'package:flutter/material.dart';

class FuelEstimator extends StatefulWidget {// stateful widget to manage state
  const FuelEstimator({super.key});

  @override
  State<FuelEstimator> createState() => _FuelEstimatorState();
}

class _FuelEstimatorState extends State<FuelEstimator> {
  String fuel_category = 'RON 95'; // initial for drop down button selection
  TextEditingController distanceController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  double FuelCost = 0.0;// initial fuel cost value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//top of the screen app
        title:  Text('Fuel Cost Estimator',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 30),),
        
      ),
      body: Padding(padding: EdgeInsets.all(16.0),//padding is use to make space for textfield where it does not reach the end of the windows
        child: Column(
          mainAxisSize: MainAxisSize.min,// make the item start at the top and not center
          mainAxisAlignment: MainAxisAlignment.center,// conter centerized
          children: [
            Row(children: [//make the item line in a row
              SizedBox(width: 200, child: Text("Distance (KM):")),
              Expanded(//expanded the row to add more widgets
                child: TextField(
                  controller: distanceController,
                  keyboardType: TextInputType.number,//only number can be enter
                  decoration: InputDecoration(// make the textfield more colorful
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: 'Enter distance',
                  ),
                ),
              )
              
              
            ]
            ),
            SizedBox(height: 16),// make a gap between two widgets
            Row(children:[//make the item line in a row
              SizedBox(width: 200, child:Text("Car Fuel Efficiently (KM/L):")),
              Expanded(
                child: TextField(//expanded the row to add more widgets
                  controller: efficiencyController,
                  keyboardType: TextInputType.number,//only number can be enter
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(// make the textfield more colorful
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: 'Enter fuel efficiency',
                  ),
                ),
              )
              
              ]
            ),
            SizedBox(height: 16),// make a gap between two widgets
            Row(children:[
              SizedBox(width: 200, child:Text("Fuel Price (RM/L):")),
              DropdownButton<String>(// make a drop down button to select fuel type whether RON95, RON97 or Diesel
                value: fuel_category, items: <String> ["RON 95", "RON 97", "Diesel"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  fuel_category = newValue!;// update value of fuel category
                  setState(() {});// make the interface change when select another value
                },
              )
            ]
            ),
            SizedBox(height: 24),// make a gap between two widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.center,//make the button locate in center of row
              children: [
              ElevatedButton(//add elevated button for calculate fuel cost
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () => calculateFuelCost(),//call method for calculate fuel cost
                child: Text('Calculate',
                style: TextStyle(color: Colors.black),),
              ),
              SizedBox(width: 16),// make a gap between two widgets
              ElevatedButton(//add elevated button for reset all value
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: (){
                distanceController.clear();// clear all textfield value
                efficiencyController.clear();
                fuel_category = 'RON 95';
                FuelCost = 0.0;// reset fuel cost value
                setState(() {});
              }, child: Text('Reset',style: TextStyle(color: Colors.black),)),
            
            ]
            ),
            SizedBox(height: 24),// make a gap between two widgets
            Container(//make a container to show attention to fuel cost result
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),// make the edge border round
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Text(
                    'Fuel Cost:',
                  ),
                  SizedBox(height: 8),// make a gap between two widgets
                  Text(
                    'RM $FuelCost',// show fuel cost result
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
                ),
            )
            ],  
        ),
        
      ),
      

    );
  }
  void calculateFuelCost() {
  // Implementation of fuel cost calculation based on current malaysia fuel price after subsidies
  double distance = double.parse(distanceController.text);//collect distance value from textfield
  double efficiency = double.parse(efficiencyController.text);//collect efficiency value from textfield
  double price;
  double Cost;
    if (fuel_category == 'RON 95') {
      price = 2.60;
      Cost = (distance / efficiency) * price;
    } else if (fuel_category == 'RON 97') {
      price = 3.14;
      Cost = (distance / efficiency) * price;
    } else if (fuel_category == 'Diesel') {
      price = 2.89;
      Cost = (distance / efficiency) * price;
    } else {
      Cost = 0.0;
    }
  setState(() {
    FuelCost = double.parse(Cost.toStringAsFixed(2));// make the fuel cost only have two decimal places since it only accept money format
  });
  }
}