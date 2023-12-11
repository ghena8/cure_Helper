//import 'package:flutter/foundation.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/home.dart';

class searchPage extends StatefulWidget {
  static const String routename = 'search';
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  List<String> cities = ['Makkah', 'Jeddah', 'Madina ElMonawara', 'Riyadh'];
  List<String> selectedCity = [];
  Map<String, List<String>> neighborhoods = {
    'Makkah': ['Azizia', 'alsharayie', 'Al Shawqiyya'],
    'Jeddah': ['alsafa', 'alhamra', 'Al Rabwa', 'alsalama', 'quayza'],
    'Madina ElMonawara': ['AL Azizia', 'alsikat alhadid', 'Prince chart'],
    'Riyadh': ['Malaz', 'aleaqiq', 'Tuwaiq'],
  };
  List<String> selectedNeighborhood = [];
  List<String> pharmacies = [];

  void searchPharmacies() {
    Map<String, List<String>> pharmaciesByNeighborhood = {
      'Azizia': [
        'Al-Ruwaida Pharmacy : Main Street ',
        'United Pharmacy : Abdullah Al Khayyat Street',
        'Nahdi Pharmacy : Al-Azizia Main Street'
      ],
      'alsharayie': [
        'Al-Ruwaida Pharmacy : alsharayie',
        'United Pharmacy : alsharayie',
        ' United Pharmacy : alsharayie- yellow line',
      ],
      'Al Shawqiyya': [
        'Al-Ruwaida Pharmacy : Al Shawqiyya',
        'Al-Ruwaida Pharmacy : Al-Fayhaa ',
        ' United Pharmacy : sharie alaskan',
        'Ammar Pharmacy : Al Shawqiyya '
      ],
      'alsafa': [
        'Al-Dawaa Pharmacy : Umm Al-Qura Street ',
        'Al-Ruwaida Pharmacy : Prince Saud Al Faisal Street',
        ' United Pharmacy : Forty Street',
        ' United Pharmacy : Abdullah Sharbatly Street',
        'Nahdi Pharmacy : Umm Al-Qura Street'
      ],
      'alhamra': [
        'Al-Ruwaida Pharmacy : Tahlia Street - Bugshan Hospital',
        'Al-Ruwaida Pharmacy : Thirty Street ',
        ' Al-Ruwaida Pharmacy : Stalagmite Street (Jack)',
        'United Pharmacy : Palestine Street, opposite Fakeeh Hospital ',
        'United Pharmacy : Abdul Hadi Al-Yami Al-Wazira Street',
        ' Nahdi Pharmacy : 52nd Street',
      ],
      'Al Rabwa': [
        ' Nahdi Pharmacy : Main Street',
        'Nahdi Pharmacy : Intersection of Hera Street and King Road',
        ' Al-Ruwaida Pharmacy : Umm Al Habiba Street',
        ' Al-Dawaa Pharmacy : Quraish Street'
      ],
      'alsalama': [
        'United Pharmacy : Tahlia Street ',
        'United Pharmacy : Al-Ansar Street',
        ' Nahdi Pharmacy : sharie eabir alqaraat',
        ' Al-Ruwaida Pharmacy : Al Naseem Street',
        ' Lemon Pharmacy : Tahlia Street'
      ],
      'quayza': [
        'Ammar Pharmacy : Al-Rahili General Street',
        'Ammar Pharmacy : Al Murjan Street',
        ' Nahdi Pharmacy : East Highway Street'
      ],
      'AL Azizia': [
        'Al-Ruwaida Pharmacy : Saleh Al-Din',
        'United Pharmacy : Imam Bukhari',
        'United Pharmacy : Prince Muqrin',
        'Nahdi Pharmacy : Alm Street Mohamed',
        'Al-Dawaa Pharmacy : Imam Bukhari'
      ],
      'alsikat alhadid': [
        'alsikat alhadid : alsikat alhadid',
        'Ammar Pharmacy : alsitiyn',
        ' Nahdi Pharmacy : University Road'
      ],
      'Malaz': [
        'Al-Ruwaida Pharmacy : Tahlia Street - Bugshan Hospital',
        'Al-Ruwaida Pharmacy : Thirty Street ',
        ' Al-Ruwaida Pharmacy : Stalagmite Street (Jack)',
        'United Pharmacy : Palestine Street, opposite Fakeeh Hospital ',
        'United Pharmacy : Abdul Hadi Al-Yami Al-Wazira Street',
        ' Nahdi Pharmacy : 52nd Street',
      ],
      'aleaqiq': [
        'Al-Dawaa Pharmacy : Umm Al-Qura Street ',
        'Al-Ruwaida Pharmacy : Prince Saud Al Faisal Street',
        ' United Pharmacy : Forty Street',
        ' United Pharmacy : Abdullah Sharbatly Street',
      ],
      'Tuwaiq': [
        'Al-Ruwaida Pharmacy : Main Street ',
        'United Pharmacy : Abdullah Al Khayyat Street',
        'Nahdi Pharmacy : Al-Azizia Main Street'
      ],
      'Prince chart': [
        'Al-Ruwaida Pharmacy : Main Street ',
        'United Pharmacy : Abdullah Al Khayyat Street',
        'Nahdi Pharmacy : Al-Azizia Main Street',
        ' Nahdi Pharmacy : sharie eabir alqaraat',
        ' Al-Ruwaida Pharmacy : Al Naseem Street',
      ],
    };

    String selectedNeighborhoodKey =
        selectedNeighborhood.isNotEmpty ? selectedNeighborhood[0] : '';

    if (pharmaciesByNeighborhood.containsKey(selectedNeighborhoodKey)) {
      setState(() {
        pharmacies = pharmaciesByNeighborhood[selectedNeighborhoodKey]!;
      });
    } else {
      setState(() {
        pharmacies = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myNavigationBar(),
      //appBar: _appBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        //  const Text("",  // title to the page
                        //     textAlign: TextAlign.left ,
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize:22,
                        //         fontWeight: FontWeight.w700
                        //     ),
                        //   ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.75, // 70% of screen height
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(25)),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                // start from here BODY
                child: Column(
                  children: <Widget>[
                    DropdownButton<String?>(
                      hint: const Text('Select a city'),
                      value: selectedCity.isNotEmpty ? selectedCity[0] : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCity = [newValue ?? ''];
                          selectedNeighborhood = [];
                        });
                      },
                      items: cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String?>(
                      hint: const Text('Select a neighborhood'),
                      value: selectedNeighborhood.isNotEmpty
                          ? selectedNeighborhood[0]
                          : null,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedNeighborhood = [newValue ?? ''];
                        });
                      },
                      items: neighborhoods[selectedCity.isNotEmpty
                                  ? selectedCity[0]
                                  : '']
                              ?.map((String neighborhood) {
                            return DropdownMenuItem<String>(
                              value: neighborhood,
                              child: Text(neighborhood),
                            );
                          }).toList() ??
                          [],
                    ),
                    ElevatedButton(
                      onPressed: searchPharmacies,
                      child: const Text('Search'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: pharmacies.length,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> values = pharmacies[index].split(' : ');
                          String firstPart = values[0];
                          String secondPart = values[1];

                          return ListTile(
                            title: Text(firstPart),
                            subtitle: Text(secondPart),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  myNavigationBar() {
    int _selectedIndex = 1;
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.background,
          color: Theme.of(context).colorScheme.onBackground, // of text
          activeColor: Theme.of(context).colorScheme.onBackground,
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
          gap: 8, //Space between the icon and the name
          padding: const EdgeInsets.all(16),
          onTabChange: _navigateBottomBar, // Change under pressure
          selectedIndex: _selectedIndex,
          tabs: [
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(homePage.routename);
              },
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(searchPage.routename);
              },
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HistoryPage.routename);
              },
              icon: Icons.auto_stories, // or collections_bookmark or menu_book
              text: 'History',
            ),
            GButton(
              onPressed: () {
                Navigator.of(context).pushNamed(morePage.routename);
              },
              icon: Icons.more_horiz_outlined,
              text: 'more',
            ),
          ],
        ),
      ),
    );
  }
}
