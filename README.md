<div align="center">

# 🎬 Movie App iOS

**A SwiftUI movie browsing app powered by The Movie Database (TMDB) API.**

![Platform](https://img.shields.io/badge/Platform-iOS-black?style=flat-square&logo=apple)
![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-6E48AA?style=flat-square&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-16-4776E6?style=flat-square&logo=xcode&logoColor=white)
![Stars](https://img.shields.io/github/stars/ahmetbostanciklioglu/Movie-App-iOS?style=flat-square&color=6E48AA)
![Last Commit](https://img.shields.io/github/last-commit/ahmetbostanciklioglu/Movie-App-iOS?style=flat-square&color=4776E6)

</div>

## 📖 Overview

Movie App iOS is a native SwiftUI application for discovering films through The Movie Database (TMDB) API. The home screen surfaces popular and trending movies in horizontal carousels, lets you filter titles by genre, and includes a search bar. Tapping any movie opens a full-screen detail view with an About tab (synopsis) and a Reviews tab that pulls user reviews for the selected title. The project follows an MVVM architecture with an async/await networking layer.

## ✨ Features

- **Discover movies** — browse popular and trending films fetched live from the TMDB API.
- **Genre filtering** — select a genre chip to load a grid of matching movies via TMDB's discover endpoint.
- **Movie detail view** — full-screen cover with poster, title, and metadata, plus tabbed About and Reviews sections.
- **User reviews** — reviews for the selected movie are loaded on demand from TMDB.
- **Search bar** — a search field on the home screen for finding titles.
- **Polished UI** — custom Poppins typography, a dark color scheme, and matched-geometry animations for genre and section selection.

## 🚀 Getting Started

```bash
git clone https://github.com/ahmetbostanciklioglu/Movie-App-iOS.git
cd Movie-App-iOS
open movie.xcodeproj
```

Then open `movie.xcodeproj` in Xcode, select a simulator or device, and press `Cmd + R` to build and run.

> The app talks to the TMDB API. An API key is referenced in `movie/Feature/Base/Utils/Constants.swift` — replace it with your own key from [themoviedb.org](https://www.themoviedb.org/settings/api) if needed.

## 📋 Requirements

- iOS 18.0 or later
- Xcode 16 or later
- Swift 5.0

## 🧑‍💻 Author

**Ahmet Bostancıklıoğlu** — [@ahmetbostanciklioglu](https://github.com/ahmetbostanciklioglu) · ahmetbostancikli@gmail.com

> ⭐ If this helped you, consider giving the repo a star!
