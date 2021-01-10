import 'package:flutter/material.dart';

class AddCoin extends StatefulWidget {
  AddCoin({Key key}) : super(key: key);

  @override
  _AddCoinState createState() => _AddCoinState();
}

class _AddCoinState extends State<AddCoin> {
  List<String> coins = ['Bitcoin', 'Tether', 'Ethereum'];
  String selectedValue = "Bitcoin";
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: selectedValue,
                    onChanged: (String value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    // Mapping the dropdown values and selection
                    items: coins.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(labelText: "Coin Amount: "),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    // Setting up butto width depending on device screen size
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xFF723ceb),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // APi METHOD
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Add Coin',
                        style: TextStyle(color: Color(0xFFeeeef3)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
