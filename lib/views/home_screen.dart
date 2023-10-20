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
  List<String> countries = [
    'Kabul-Afghanistan',
    'Tirana-Albania',
    'Algiers-Algeria',
    'Andorra la Vella-Andorra',
    'Luanda-Angola',
    'St. John\'s-Antigua and Barbuda',
    'Buenos Aires-Argentina',
    'Yerevan-Armenia',
    'Canberra-Australia',
    'Baku-Azerbaijan',
    'Nassau-Bahamas',
    'Manama-Bahrain',
    'Dhaka-Bangladesh',
    'Bridgetown-Barbados',
    'Minsk-Belarus',
    'Brussels-Belgium',
    'Belmopan-Belize',
    'Porto-Novo-Benin',
    'Thimphu-Bhutan',
    'La Paz-Bolivia',
    'Sarajevo-Bosnia and Herzegovina',
    'Gaborone-Botswana',
    'Brasília-Brazil',
    'Bandar Seri Begawan-Brunei',
    'Sofia-Bulgaria',
    'Ouagadougou-Burkina Faso',
    'Bujumbura-Burundi',
    'Praia-Cabo Verde',
    'Phnom Penh-Cambodia',
    'Yaoundé-Cameroon',
    'Ottawa-Canada',
    'Bangui-Central African Republic',
    'NDjamena-Chad',
    'Santiago-Chile',
    'Beijing-China',
    'Bogotá-Colombia',
    'Moroni-Comoros',
    'Brazzaville-Congo',
    'San José-Costa Rica',
    'Zagreb-Croatia',
    'Havana-Cuba',
    'Nicosia-Cyprus',
    'Prague-Czech Republic',
    'Copenhagen-Denmark',
    'Djibouti-Djibouti',
    'Roseau-Dominica',
    'Santo Domingo-Dominican Republic',
    'Quito-Ecuador',
    'Cairo-Egypt',
    'San Salvador-El Salvador',
    'Malabo-Equatorial Guinea',
    'Asmara-Eritrea',
    'Tallinn-Estonia',
    'Addis Ababa-Ethiopia',
    'Suva-Fiji',
];
  final searchController = TextEditingController();
  List<String> searchResults = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingValue = screenWidth < 600 ? 16.0 : 320.0;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Location Widget'),
        ),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, value, child) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: paddingValue, right: paddingValue, top: 100),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
