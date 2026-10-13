<div align="center">

# Flutter FoodPanda Clone

**A FoodPanda UI clone for iOS and Android.**

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

</div>

---

## Overview

Flutter FoodPanda Clone recreates the look and flow of the FoodPanda food-delivery app as a Flutter UI practice project, from onboarding and sign-in through the home feed, location picker, and cart.

> This is an educational UI clone and is not affiliated with foodpanda.

## Features

- **Onboarding and authentication screens:** email and phone number with a country-code picker.
- **Home screen** with food and restaurant listings and sticky section headers.
- **Location screen** for choosing a delivery address.
- **Cart screen** with modal bottom sheets.
- **Custom app icon** and Font Awesome icons.

## Tech Stack

| Area | Technology |
| --- | --- |
| Framework | Flutter, Dart |
| UI packages | google_fonts, font_awesome_flutter, modal_bottom_sheet, sticky_headers, country_code_picker, hexcolor |

## Getting Started

### Prerequisites

- Flutter SDK

### Installation

```bash
git clone https://github.com/RithyBondeth/Flutter-FoodPanda-Clone.git
cd Flutter-FoodPanda-Clone
flutter pub get
flutter run
```

## Project Structure

```text
Flutter-FoodPanda-Clone/
└── lib/
    ├── ui_module/
    │   ├── screens/
    │   │   ├── auth/      # auth, email, phone number
    │   │   ├── main/      # home
    │   │   └── sub/       # cart, location
    │   ├── widgets/
    │   └── constants/
    └── main.dart
```

## Author

**Rithy Bondeth** — Full Stack Developer & AI Engineer

[![Portfolio](https://img.shields.io/badge/Portfolio-0A0A0A?style=for-the-badge&logo=vercel&logoColor=white)](https://bondeth.dev)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/RithyBondeth)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rithy-bondeth-484073282/)

## License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for details. The license covers the source code only; foodpanda names, logos, and images belong to their respective owners.
