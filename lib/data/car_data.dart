import 'package:flutter_application_1/models/car.dart';

List<Car> carList = [
  Car(
    name: 'Honda NSX',
    image: "assets/images/nsx.jpg",
    description: "The ferrari of japan~",
    color: 'red',
    attributes: {
      "Top Speed": "270 Hp",
      "engine": "v6 Engine",
      "weight": "970kg",
    },
    level: 10.0,
  ),

  Car(
    name: 'Nissan Silvia S13',
    image: "assets/images/s13.jpg",
    description: "Drift king starter pack~",
    color: 'white',
    attributes: {"Top Speed": "200 Hp", "engine": "SR20DOT Engine"},
    level: 8.0,
  ),

  Car(
    name: 'Trueno AE86',
    image: "assets/images/ae86.jpg",
    description:
        "Toyota AE86 adalah salah satu mobil JDM paling legendaris di dunia — terkenal karena handling-nya, mesin 4A-GE, dan kemunculannya di Initial D. AE86 bukan mobil cepat, tapi ringan dan sangat balance, sehingga jadi ikon drifting.",
    color: 'black',
    attributes: {"Top Speed": "130 Hp", "engine": "4A-GE Engine"},
    level: 7.0,
  ),

  Car(
    name: 'Toyoto Supra MK4',
    image: "assets/images/supra.jpg",
    description:
        "Mobil ini jadi legenda karena mesin 2JZ, performa tinggi, dan popularitas dari film Fast & Furious.",
    color: 'white',
    attributes: {"Top Speed": "276 Hp", "engine": "2jz GTE Engine"},
    level: 15.0,
  ),

  Car(
    name: 'Mazda RX7 FD',
    image: "assets/images/rx7fd.jpg",
    description:
        "Generasi ketiga RX-7, paling terkenal dan paling dicintai — ringan, bertenaga, dan pakai mesin rotary 13B-REW.",
    color: 'blue',
    attributes: {"Top Speed": "255 Hp", "engine": "Rotary Twin Turbo Engine"},
    level: 12.0,
  ),

  Car(
    name: 'Nissan GTR R32',
    image: "assets/images/r32.jpg",
    description:
        "Generasi GT-R yang menghidupkan kembali nama GT-R setelah vakum sejak tahun 1970-an. Mobil ini jadi ikon motorsport Jepang dan memulai era monster AWD turbo Nissan.",
    color: 'blue',
    attributes: {"Top Speed": "276 Hp", "engine": "RB26  Engine"},
    level: 18.0,
  ),
];
