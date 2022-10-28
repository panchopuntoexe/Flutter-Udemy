import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100.0;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider"),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            value: _sliderValue,
            min: 0,
            max: 100,
            activeColor: AppTheme.primaryColor,
            divisions: 10,
            label: "10",
            onChanged: _sliderEnable
                ? (value) {
                    _sliderValue = value;
                    setState(() {});
                  }
                : null,
          ),
          /*Checkbox(
            value: _sliderEnable,
            onChanged: (value) {
              _sliderEnable = value ?? true;
              setState(() {});
            },
          ),
          
          Switch(
            value: _sliderEnable,
            onChanged: (value) {
              setState(() {
                _sliderEnable = value ?? true;
              });
            },
          ),
          */
          CheckboxListTile(
            activeColor: AppTheme.primaryColor,
            title: Text("Slider Enable"),
            value: _sliderEnable,
            onChanged: (value) {
              setState(() {
                _sliderEnable = value ?? true;
              });
            },
          ),
          SwitchListTile.adaptive(
            value: _sliderEnable,
            title: const Text("Slider Enable"),
            onChanged: (value) {
              setState(() {
                _sliderEnable = value;
              });
            },
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: NetworkImage("https://picsum.photos/400/900"),
                fit: BoxFit.contain,
                width: _sliderValue * 5,
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
