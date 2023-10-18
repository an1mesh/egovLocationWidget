import 'package:flutter/material.dart';
import 'package:location_widget/state/user_view_mode.dart';
import 'package:location_widget/widgets/country_widger.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Location Widget'),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 400, right: 400),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: value.maxHeight,
              ),
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Location'),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              value.minimizeMaximize();
                            },
                            icon: Icon(value.isVisible
                                ? Icons.minimize
                                : Icons.laptop_windows_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_left),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: value.isVisible,
                    replacement: const SizedBox(),
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CountryWidget(isChecked: false);
                        },
                        itemCount: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
