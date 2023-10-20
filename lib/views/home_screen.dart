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
  final List<String> countries = [
    'India',
    'Canada',
    'America',
    'England',
    'Australia'
  ];
  final searchController = TextEditingController();
  List<String> searchResults = [];

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
            padding: const EdgeInsets.only(left: 400, right: 400, top: 100),
            child: Transform.rotate(
              angle: value.angle,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: value.maxHeight,
                  maxWidth: value.maxWidth,
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
                              onPressed: () {
                                value.minimizeMaximize();
                                value.rotate();
                              },
                              icon: value.isRotated
                                  ? const Icon(Icons.arrow_downward)
                                  : const Icon(Icons.arrow_left),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                      visible: value.isVisible,
                      replacement: const SizedBox(),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          right: 12.0,
                        ),
                        child: TextField(
                          controller: searchController,
                          onChanged: (query) {
                            value.searchQuery(
                                countries: countries, query: query);
                            if (value.searchResults != []) {
                              value.isClearVisibleCheck(query);
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search countries',
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: value.isClearVisible,
                      replacement: const SizedBox(),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              value.clearList();
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          const Text('Clear All'),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: value.isVisible,
                      replacement: const SizedBox(),
                      child: Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CountryWidget(
                                isChecked: value.isChecked,
                                country: value.searchResults[index],
                              );
                            },
                            itemCount: value.searchResults.length),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
