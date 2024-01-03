import 'package:countries/models/best_places_to_visit.dart';
import 'package:countries/models/countries_list_model.dart';

List<CountryListModel> favoritesList = [];

const List<CountryListModel> myFinalcountriesList = [
  //Asian countries

  CountryListModel(
    continentInWhichIn: 'Asia',
    countryName: 'India',
    countryImageLink:
        'https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Delhi', 'Mumbai', 'Jaipur', 'Varanasi']),
    ],
    popularFor: 'Taj Mahal',
    isVisaFree: true,
    overallCountryTravelCost: 275,
    countryPopulation: 14000000,
    countrySize: 36000,
  ),
  CountryListModel(
    continentInWhichIn: 'Asia',
    countryName: 'Japan',
    countryImageLink:
        'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGNoZXJyeSUyMGJsb3Nzb218ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Tokyo', 'Kyoto', 'Osaka', 'Hiroshima']),
    ],
    popularFor: 'Cherry Blossoms',
     isVisaFree: false,
    overallCountryTravelCost: 144,
    countryPopulation: 1600000,
    countrySize: 8248,
  ),
  CountryListModel(
    continentInWhichIn: 'Asia',
    countryName: 'South Korea',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1661963468634-71b9482a3efe?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Seoul', 'Busan', 'Incheon', 'Jeju Island']),
    ],
    popularFor: 'Korean Cuisine',
     isVisaFree: false,
    overallCountryTravelCost: 200,
    countryPopulation: 9300000,
    countrySize: 5239,
  ),
  CountryListModel(
    continentInWhichIn: 'Asia',
    countryName: 'China',
    countryImageLink:
        'https://images.unsplash.com/photo-1608037521244-f1c6c7635194?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Z3JlYXQlMjB3YWxsJTIwb2YlMjBjaGluYXxlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Beijing', 'Shanghai', 'Xi\'an', 'Guilin']),
    ],
    popularFor: 'Great Wall of China',
     isVisaFree: false,
    overallCountryTravelCost: 395,
    countryPopulation: 13000000,
    countrySize: 42235,
  ),

  // North American Countries

  CountryListModel(
    continentInWhichIn: 'North America',
    countryName: 'United States',
    countryImageLink:
        'https://images.unsplash.com/photo-1541535650810-10d26f5c2ab3?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['New York', 'Los Angeles', 'Chicago', 'San Francisco']),
    ],
    popularFor: 'Diverse Culture',
     isVisaFree: false,
    overallCountryTravelCost: 500,
    countryPopulation: 5300000,
    countrySize: 41000,
  ),
  CountryListModel(
    continentInWhichIn: 'North America',
    countryName: 'Canada',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1673264933048-3bd3f5b86f9d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Toronto', 'Vancouver', 'Montreal', 'Calgary']),
    ],
    popularFor: 'Natural Beauty',
     isVisaFree: false,
    overallCountryTravelCost: 135,
    countryPopulation: 9900000,
    countrySize: 36000,
  ),
  CountryListModel(
    continentInWhichIn: 'North America',
    countryName: 'Mexico',
    countryImageLink:
        'https://images.unsplash.com/photo-1626130097370-6111320a1965?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fE1leGljbyUyMHJ1aW5zfGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Mexico City', 'Cancun', 'Guadalajara', 'Tulum']),
    ],
    popularFor: 'Ancient Ruins',
     isVisaFree: true,
    overallCountryTravelCost: 94,
    countryPopulation: 7600000,
    countrySize: 26000,
  ),
  CountryListModel(
    continentInWhichIn: 'North America',
    countryName: 'Costa Rica',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1687428554454-27aa5358b78b?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y29zdGElMjByaWNhJTIwcmFpbmZvcmVzdHxlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: [
        'San Jose',
        'La Fortuna',
        'Manuel Antonio',
        'Monteverde'
      ]),
    ],
    popularFor: 'Rainforests and Wildlife',
     isVisaFree: true,
    overallCountryTravelCost: 78,
    countryPopulation: 3500000,
    countrySize: 8000,
  ),

  // South American countries

  CountryListModel(
    continentInWhichIn: 'South America',
    countryName: 'Brazil',
    countryImageLink:
        'https://images.unsplash.com/photo-1669318025123-1508f448988e?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGJyYXppbCUyMGNhcm5pdmFsc3xlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Rio de Janeiro', 'Sao Paulo', 'Brasilia', 'Salvador']),
    ],
    popularFor: 'Carnivals and Festivals',
     isVisaFree: false,
    overallCountryTravelCost: 124,
    countryPopulation: 1900000,
    countrySize: 4500,
  ),
  CountryListModel(
    continentInWhichIn: 'South America',
    countryName: 'Argentina',
    countryImageLink:
        'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YXJnZW50aW5hJTIwd2luZXxlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Buenos Aires', 'Mendoza', 'Cordoba', 'Ushuaia']),
    ],
    popularFor: 'Tango and Wine',
     isVisaFree: false,
    overallCountryTravelCost: 93,
    countryPopulation: 2500000,
    countrySize: 35000,
  ),
  CountryListModel(
    continentInWhichIn: 'South America',
    countryName: 'Peru',
    countryImageLink:
        'https://images.unsplash.com/photo-1525987112488-57890dee55a8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVydSUyMGluY2ElMjBydWluc3xlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Lima', 'Cusco', 'Machu Picchu', 'Arequipa']),
    ],
    popularFor: 'Inca Ruins',
     isVisaFree: true,
    overallCountryTravelCost: 55,
    countryPopulation: 3500000,
    countrySize: 2000,
  ),
  CountryListModel(
    continentInWhichIn: 'South America',
    countryName: 'Chile',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1675348351326-4241ecc6fb2f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpbGV8ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: [
        'Santiago',
        'Valparaiso',
        'Torres del Paine',
        'Easter Island'
      ]),
    ],
    popularFor: 'Natural Landscapes',
     isVisaFree: true,
    overallCountryTravelCost: 35,
    countryPopulation: 150000,
    countrySize: 1500,
  ),

  //European Countries

  CountryListModel(
    continentInWhichIn: 'Europe',
    countryName: 'France',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1661962328623-2c44dcac8353?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWlmZmVsJTIwdG93ZXIlMjBhdCUyMG5pZ2h0fGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Paris', 'Nice', 'Lyon', 'Marseille']),
    ],
    popularFor: 'Eiffel Tower and Cuisine',
     isVisaFree: true,
    overallCountryTravelCost: 250,
    countryPopulation: 6700000,
    countrySize: 12000,
  ),
  CountryListModel(
    continentInWhichIn: 'Europe',
    countryName: 'Italy',
    countryImageLink:
        'https://images.unsplash.com/photo-1604580864964-0462f5d5b1a8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y29sb3NzZXVtfGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Rome', 'Florence', 'Venice', 'Milan']),
    ],
    popularFor: 'Colosseum and Art',
     isVisaFree: true,
    overallCountryTravelCost: 200,
    countryPopulation: 5500000,
    countrySize: 11000,
  ),
  CountryListModel(
    continentInWhichIn: 'Europe',
    countryName: 'Germany',
    countryImageLink:
        'https://images.unsplash.com/photo-1449452198679-05c7fd30f416?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2VybWFueSUyMGNhc3RsZXN8ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Berlin', 'Munich', 'Hamburg', 'Cologne']),
    ],
    popularFor: 'Historic Castles',
     isVisaFree: false,
    overallCountryTravelCost: 410,
    countryPopulation: 9900000,
    countrySize: 13000,
  ),
  CountryListModel(
    continentInWhichIn: 'Europe',
    countryName: 'Spain',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1702598969295-71b202296f7d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c3BhaW4lMjBzYWdyYWRhJTIwZmFtaWxpYXxlbnwwfHwwfHx8MA%3D%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Barcelona', 'Madrid', 'Seville', 'Valencia']),
    ],
    popularFor: 'Sagrada Familia and Flamenco',
     isVisaFree: false,
    overallCountryTravelCost: 390,
    countryPopulation: 5200000,
    countrySize: 9000,
  ),

  //African Countries

  CountryListModel(
    continentInWhichIn: 'Africa',
    countryName: 'South Africa',
    countryImageLink:
        'https://plus.unsplash.com/premium_photo-1661837277372-1cd072f18ae1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fHNvdXRoJTIwYWZyaWNhJTIwc2FmYXJpfGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: [
        'Cape Town',
        'Johannesburg',
        'Durban',
        'Kruger National Park'
      ]),
    ],
    popularFor: 'Safari and Table Mountain',
     isVisaFree: true,
    overallCountryTravelCost: 85,
    countryPopulation: 900000,
    countrySize: 21000,
  ),
  CountryListModel(
    continentInWhichIn: 'Africa',
    countryName: 'Egypt',
    countryImageLink:
        'https://images.unsplash.com/photo-1600520611035-84157ad4084d?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHlyYW1pZHN8ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: ['Cairo', 'Luxor', 'Aswan', 'Hurghada']),
    ],
    popularFor: 'Pyramids of Giza',
     isVisaFree: true,
    overallCountryTravelCost: 90,
    countryPopulation: 700000,
    countrySize: 18000,
  ),
  CountryListModel(
    continentInWhichIn: 'Africa',
    countryName: 'Kenya',
    countryImageLink:
        'https://images.unsplash.com/photo-1518459384564-ecfd8e80721f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2VueWElMjBzYWZhcml8ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(citiesName: [
        'Nairobi',
        'Mombasa',
        'Maasai Mara',
        'Amboseli National Park'
      ]),
    ],
    popularFor: 'Wildlife Safari',
     isVisaFree: true,
    overallCountryTravelCost: 29,
    countryPopulation: 90000,
    countrySize: 5000,
  ),
  CountryListModel(
    continentInWhichIn: 'Africa',
    countryName: 'Morocco',
    countryImageLink:
        'https://images.unsplash.com/photo-1530021217077-d6060dadeacc?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fG1vcm9jY28lMjBtZWRpbmFzJTIwYW5kJTIwc291a3N8ZW58MHx8MHx8fDA%3D',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Marrakech', 'Casablanca', 'Fez', 'Chefchaouen']),
    ],
    popularFor: 'Medinas and Souks',
     isVisaFree: true,
    overallCountryTravelCost: 100,
    countryPopulation: 50000,
    countrySize: 7000,
  ),

  // Australia's countries

  CountryListModel(
    continentInWhichIn: 'Australia',
    countryName: 'Australia',
    countryImageLink:
        'https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXVzdHJhbGlhfGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Sydney', 'Melbourne', 'Brisbane', 'Perth']),
    ],
    popularFor: 'Great Barrier Reef and Opera House',
     isVisaFree: false,
    overallCountryTravelCost: 350,
    countryPopulation: 110000,
    countrySize: 26000,
  ),
  CountryListModel(
    continentInWhichIn: 'Australia',
    countryName: 'New Zealand',
    countryImageLink:
        'https://images.unsplash.com/photo-1536972781967-a8aedfb21059?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmV3JTIwemVhbGFuZCUyMGxvcmQlMjBvZiUyMHRoZSUyMHJpbmdzfGVufDB8fDB8fHww',
    bestPlacesToVisit: [
      BestPlacesToVisit(
          citiesName: ['Auckland', 'Wellington', 'Queenstown', 'Rotorua']),
    ],
    popularFor: 'Lord of the Rings Filming Locations',
     isVisaFree: false,
    overallCountryTravelCost: 110,
    countryPopulation: 40000,
    countrySize: 8000,
  ),
];
