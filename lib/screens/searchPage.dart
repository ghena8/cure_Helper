//import 'package:flutter/foundation.dart';
import 'package:CureHelper/screens/historyPage.dart';
import 'package:CureHelper/screens/morePage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CureHelper/screens/home.dart';
import 'package:CureHelper/component/my_button.dart';

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
        'Community pharmacy : Forty Street ',
        'Nahdi Pharmacy : Al-Azizia Main Street',
        'Lemon Pharmacy : Tahlia Street',
      ],
      'alsharayie': [
        'Community pharmacy : Forty Street ',
        'Al-Ruwaida Pharmacy : alsharayie',
        'Lemon Pharmacy : Tahlia Street',
        'Nahdi Pharmacy : Al-Azizia Main Street',
        'United Pharmacy : alsharayie',
        'United Pharmacy : alsharayie- yellow line',
      ],
      'Al Shawqiyya': [
        'Al-Ruwaida Pharmacy : Al Shawqiyya',
        'Al-Ruwaida Pharmacy : Al-Fayhaa ',
        'United Pharmacy : sharie alaskan',
        'Lemon Pharmacy : Al Shawqiyya ',
        'Community pharmacy : Forty Street '
      ],
      'alsafa': [
        'Nahdi Pharmacy : Umm Al-Qura Street',
        'Al-Dawaa Pharmacy : Umm Al-Qura Street ',
        'Al-Ruwaida Pharmacy : Prince Saud Al Faisal Street',
        'United Pharmacy : Forty Street',
        'Community pharmacy : Stalagmite Street (Jack) ',
        'United Pharmacy : Abdullah Sharbatly Street',
        'Lemon Pharmacy : Tahlia Street',
      ],
      'alhamra': [
        'Al-Dawaa Pharmacy : Tahlia Street - Bugshan Hospital',
        'Al-Ruwaida Pharmacy : Thirty Street ',
        'United Pharmacy : Palestine Street, opposite Fakeeh Hospital ',
        'Community pharmacy : Forty Street ',
        'United Pharmacy : Abdul Hadi Al-Yami Al-Wazira Street',
        'Al-Ruwaida Pharmacy : Stalagmite Street (Jack)',
        'Nahdi Pharmacy : 52nd Street',
        'Lemon Pharmacy : Tahlia Street'
      ],
      'Al Rabwa': [
        'Al-Dawaa Pharmacy : Quraish Street',
        'Nahdi Pharmacy : Main Street',
        'Nahdi Pharmacy : Intersection of Hera Street and King Road',
        'Community pharmacy : Imam Bukhari ',
        'Lemon Pharmacy : Tahlia Street',
        'Lemon Pharmacy : Tahlia Street',
        'Al-Ruwaida Pharmacy : Umm Al Habiba Street',
      ],
      'alsalama': [
        'United Pharmacy : Tahlia Street ',
        'United Pharmacy : Al-Ansar Street',
        'Community pharmacy : Forty Street ',
        'Nahdi Pharmacy : sharie eabir alqaraat',
        'Al-Ruwaida Pharmacy : Al Naseem Street',
        'Lemon Pharmacy : Tahlia Street'
      ],
      'quayza': [
        'United Pharmacy  : Al-Rahili General Street',
        'Community pharmacy : Imam Bukhari ',
        'Lemon Pharmacy : Tahlia Street',
        'Nahdi Pharmacy  : Al Murjan Street',
        'Nahdi Pharmacy : East Highway Street'
      ],
      'AL Azizia': [
        'Al-Ruwaida Pharmacy : Saleh Al-Din',
        'Community pharmacy : Forty Street ',
        'United Pharmacy : Imam Bukhari',
        'Lemon Pharmacy : Tahlia Street',
        'United Pharmacy : Prince Muqrin',
        'Nahdi Pharmacy : Alm Street Mohamed',
        'Al-Dawaa Pharmacy : Imam Bukhari'
      ],
      'alsikat alhadid': [
        'alsikat alhadid : alsikat alhadid',
        'Nahdi Pharmacy  : alsitiyn',
        'Lemon Pharmacy : Tahlia Street',
        'Community pharmacy : Forty Street ',
        'Nahdi Pharmacy : University Road'
      ],
      'Malaz': [
        'Al-Ruwaida Pharmacy : Tahlia Street - Bugshan Hospital',
        'Community pharmacy :Al Naseem Street ',
        'Al-Ruwaida Pharmacy : Thirty Street ',
        'Al-Ruwaida Pharmacy : Stalagmite Street (Jack)',
        'United Pharmacy : Palestine Street, opposite Fakeeh Hospital ',
        'Lemon Pharmacy : Tahlia Street',
        'United Pharmacy : Abdul Hadi Al-Yami Al-Wazira Street',
        'Nahdi Pharmacy : 52nd Street',
      ],
      'aleaqiq': [
        'Al-Dawaa Pharmacy : Umm Al-Qura Street ',
        'Community pharmacy : Forty Street ',
        'Al-Ruwaida Pharmacy : Prince Saud Al Faisal Street',
        'Lemon Pharmacy : Tahlia Street',
        'United Pharmacy : Forty Street',
        'United Pharmacy : Abdullah Sharbatly Street',
      ],
      'Tuwaiq': [
        'Al-Ruwaida Pharmacy : Main Street ',
        'Community pharmacy :Al Naseem Street ',
        'United Pharmacy : Abdullah Al Khayyat Street',
        'Nahdi Pharmacy : Al-Azizia Main Street'
      ],
      'Prince chart': [
        'Al-Ruwaida Pharmacy : Main Street ',
        'United Pharmacy : Abdullah Al Khayyat Street',
        'Nahdi Pharmacy : Al-Azizia Main Street',
        'Nahdi Pharmacy : sharie eabir alqaraat',
        'Community pharmacy : Forty Street ',
        'Al-Ruwaida Pharmacy : Al Naseem Street',
        'Lemon Pharmacy : Tahlia Street',
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
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.5, horizontal: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  homePage.routename); // go to home page
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 32,
                              color: Colors.grey[300],
                            ),
                          ),
                          const SizedBox(
                            width: 28,
                          ),
                          const Text(
                            "Search pharmacies",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.72, // 80% of screen height
              width: double.infinity,
              alignment: Alignment.center,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 40),
                      DropdownButton<String?>(
                        isExpanded: true,
                        iconSize: 40,
                        iconDisabledColor: Colors.grey[700],
                        hint: const Text(
                          'Select a city',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
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
                            child: Text(city,
                                style: TextStyle(
                                    color: Colors.indigo[800],
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      DropdownButton<String?>(
                        isExpanded: true,
                        iconSize: 40,
                        iconDisabledColor: Colors.grey[700],
                        hint: const Text(
                          'Select a neighborhood',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
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
                                child: Text(neighborhood,
                                    style: TextStyle(
                                        color: Colors.indigo[800],
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600)),
                              );
                            }).toList() ??
                            [],
                      ),
                      const SizedBox(height:35),
                      button(
                        onTab: searchPharmacies,
                        text: 'Search',
                      ),
                         const SizedBox(height: 22),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pharmacies.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<String> values =
                                pharmacies[index].split(' : ');
                            String firstPart = values[0];
                            String secondPart = values[1];

                            return Card(
                              color: Colors.indigo.withOpacity(0.9),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.only(
                                    left: 15,
                                    top: 12,
                                    right: 15,
                                    bottom:
                                        10), // هنا يتم تعيين الهوامش الداخلية
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30, // تحديد نصف قطر الدائرة
                                  child: ClipOval(
                                    child: firstPart == 'Al-Dawaa Pharmacy'
                                        ? Image.asset(
                                            'assets/Al-Dawaa Pharmacy.jpeg',
                                            fit: BoxFit
                                                .cover, // تحديد كيفية توسيط الصورة داخل الدائرة
                                          )
                                        : Image.asset(
                                            'assets/$firstPart.jpeg',
                                            fit: BoxFit
                                                .cover, // تحديد كيفية توسيط الصورة داخل الدائرة
                                          ),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom:
                                          10.0), // إضافة هامش سفلي بين title و subtitle
                                  child: Text(
                                    firstPart,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  secondPart,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ]),
              ),
            )
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
