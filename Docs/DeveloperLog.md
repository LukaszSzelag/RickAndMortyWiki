<h1>
  📝 RickAndMortyWiki Developer Log
</h1>

## Overview

Hello, my name is Łukasz 👋🏻

I decided to create this developer log to share my thoughts about the development process behind **RickAndMortyWiki** 🤔

In this document, I describe my architectural, technical and design decisions in a less formal way than in the main README. The goal is to show not only what was built, but also why certain decisions were made 👨🏻‍💻

If you are reading this, thank you for taking a look into my development process 😄

---

## 📝 Project Requirements

This project was part of a coding challenge with the following requirements:

- Swift 6
- Default Actor Isolation set to `nonisolated`
- iOS 18.0+
- minimum of 3 screens:
  - characters list,
  - character details,
  - episode details,
- characters list with pull to refresh,
- characters search using a search bar,
- SwiftUI views,
- MVVM architecture,
- API client built with modern Swift Concurrency,
- code written with good practices in mind:
  - SOLID,
  - KISS,
  - DRY,
  - Clean Architecture principles.

The challenge also mentioned additional, optional features:

- Swift Package Manager,
- Dependency Injection via frameworks,
- marking characters as favorites and pinning them to the top of the list,
- error handling,
- unit tests,
- snapshot tests.

---

## 🧭 Architecture

### Layers

Because this app has a small number of closely related features, I decided to divide the project into three main layers:

```text
Data
Domain
Presentation
```

In a larger application with more independent features, I would consider a feature-first structure, for example:

```text
Feature
├── Domain
├── Data
└── Presentation
```

A feature-first structure can make adding or removing features easier in bigger projects. However, in this application most screens are strongly connected to the same domain: Rick and Morty characters and episodes.

I didn't want to overcomplicate the structure, I wanted work with shared domain entities first, instead of creating separate feature modules too early.

My chosen approach still follows the general idea of Clean Architecture and keeps responsibilities separated.

### Responsibility Breakdown

```text
Domain
├── Entities
│   └── Business models used by the app
└── Repositories
    └── Protocols describing what data operations are needed

Data
├── API
│   └── API client, ApiEndpoint and ApiError
├── DTO
│   └── Models matching API responses
├── Mappers
│   └── Mapping DTOs into domain entities
└── Repositories
    └── Concrete implementations of domain repository protocols

Presentation
├── CharactersList
├── CharacterDetails
└── EpisodeDetails

PreviewSupport
├── MockData
│   └── Mock domain entities
└── Repositories
    └── Mock repository implementations for previews and tests
```

The most important rule is that the **Domain layer does not know about SwiftUI or the API client**.

The **Data layer** talks to the API, decodes DTOs and maps them into domain models.

The **Presentation layer** contains Views and ViewModels. It is responsible for displaying data and reacting to user actions, but it does not handle networking directly.

This gives the project a clean division of responsibilities.

---

## ❓ MVVM or TCA?

For this project, I chose **MVVM**.

The challenge mentioned that **The Composable Architecture** was preferred, but MVVM was also accepted. I know the theory behind TCA, but I have never used it in my private projects before.

Because of that, I decided to use an architecture I feel more confident with - MVVM.

I wanted the project to show my current practical skills instead of introducing a complex architecture that I have not yet used enough in real projects.

I think MVVM was a good fit because:

- it works naturally with SwiftUI,
- it keeps Views simple,
- it allows ViewModels to be tested,
- it does not require additional frameworks,
- it is familiar to me,
- it fits the size of this app.

---

## 💉 Dependency Injection

I created my own simple dependency container called `AppDependencies`.

I did not use external Dependency Injection frameworks because I do not have enough practical experience with them yet.

The container stores the main dependencies used across the app:

```swift
struct AppDependencies {
    let characterRepository: any CharacterRepository
    let episodeRepository: any EpisodeRepository
    let favoriteCharactersRepository: any FavoriteCharactersRepository
}
```

It includes small factories for production and previews.

Production dependencies use real repository implementations, while preview and test dependencies use mock repositories.

---

## 🌐 API Client

The app fetches data from the public Rick and Morty API.

This API is simple from the client perspective because it:

- uses only the `GET` method,
- does not require a request body,
- does not require authorization,
- does not require custom headers or tokens.

```swift
protocol ApiClient: Sendable {
    func request<T: Decodable & Sendable>(_ endpoint: ApiEndpoint) async throws -> T
}

struct RickAndMortyApiClient: ApiClient {
    private let baseURL: URL
    private let session: URLSession
    private let decoder: JSONDecoder

    init(
        baseURL: URL = URL(string: "https://rickandmortyapi.com/api")!,
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.session = session
        self.decoder = decoder
    }

    func request<T: Decodable & Sendable>(_ endpoint: ApiEndpoint) async throws -> T {
        let url = try makeURL(for: endpoint)

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw ApiError.fromCode(httpResponse.statusCode)
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ApiError.decodingFailure
        }
    }

    private func makeURL(for endpoint: ApiEndpoint) throws -> URL {
        var components = URLComponents(
            url: baseURL.appending(path: endpoint.path),
            resolvingAgainstBaseURL: false
        )

        if !endpoint.queryItems.isEmpty {
            components?.queryItems = endpoint.queryItems
        }

        guard let url = components?.url else {
            throw ApiError.invalidURL
        }

        return url
    }
}
```

There is no need to configure HTTP methods, request bodies or authorization tokens in this project.

If the API was more complex, I would consider adding support for:

```text
GET
POST
PUT
DELETE
request body
headers
authorization tokens
```

However, adding all of that here would create unnecessary code.

---

## 🛣️ API Endpoints

I decided to represent API endpoints as an enum.

The app uses only a small number of endpoints, so an enum is simple and expressive enough.

```swift
enum ApiEndpoint: Sendable {
    case characters(page: Int, name: String?)
    case charactersByIDs([Int])
    case episode(id: Int)

    var path: String {
        switch self {
        case .characters:
            return "character"
        case .charactersByIDs(let ids):
            return "character/\(ids.map { String($0) }.joined(separator: ","))"
        case .episode(let id):
            return "episode/\(id)"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .characters(let page, let name):
            var items: [URLQueryItem] = [
                URLQueryItem(name: "page", value: "\(page)")
            ]

            let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)

            if let trimmedName, !trimmedName.isEmpty {
                items.append(URLQueryItem(name: "name", value: trimmedName))
            }

            return items

        case .charactersByIDs:
            return []

        case .episode:
            return []
        }
    }
}
```

---

## ❗️ API Error Handling

Even though the Rick and Morty API is simple, I wanted the error handling to be more explicit.

I did not want to guess which status codes should be handled and which should not. Because of that, `ApiError` maps known HTTP status codes into meaningful error cases.

```swift
enum ApiError: Error, Equatable, LocalizedError {
    case invalidURL
    case invalidResponse
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case tooManyRequests
    case serverError(statusCode: Int)
    case invalidStatusCode(Int)
    case decodingFailure

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "api.error.invalid_url"
        case .invalidResponse:
            "api.error.invalid_response"
        case .badRequest:
            "api.error.bad_request"
        case .unauthorized:
            "api.error.unauthorized_access"
        case .forbidden:
            "api.error.access_forbidden"
        case .notFound:
            "api.error.resource_not_found"
        case .tooManyRequests:
            "api.error.too_many_requests"
        case .serverError(let statusCode):
            "api.error.server_error \(statusCode)."
        case .invalidStatusCode(let code):
            "api.error.unexpected_status_code \(code)."
        case .decodingFailure:
            "api.error.decoding_failure"
        }
    }
}

extension ApiError {
    static func fromCode(_ code: Int) -> ApiError {
        switch code {
        case 400:
            .badRequest
        case 401:
            .unauthorized
        case 403:
            .forbidden
        case 404:
            .notFound
        case 429:
            .tooManyRequests
        case 500...599:
            .serverError(statusCode: code)
        default:
            .invalidStatusCode(code)
        }
    }
}
```

I know that this API does not require authorization, so `401` and `403` are unlikely in normal usage 🤷🏻‍♂️

This was especially useful because the API can return `404` for an empty search result, which can be interpreted differently depending on the endpoint - in this particular app I used It to display empty view.

---

## 📕 Repositories

Repositories were created with testability in mind.

ViewModels do not communicate with the API client directly. Instead, they depend on repository protocols from the Domain layer.

This makes it possible to test ViewModels without internet access and without real API calls.

For example:

```text
CharactersListViewModel
→ CharacterRepository protocol
→ MockCharacterRepository in tests
→ DefaultCharacterRepository in production
```

This approach gives several benefits:

- ViewModels are easier to test,
- networking details stay outside Presentation,
- DTOs do not leak into ViewModels,
- mock data can be used for previews,
- real implementations can be replaced without changing ViewModels.

---

## 📺 Presentation

The Presentation layer contains everything related to the UI:

```text
Views
ViewModels
View states
UI components
Presentation extensions
```

I decided to build the minimum required 3 screens:

```text
CharactersListView
CharacterDetailsView
EpisodeDetailsView
```

I was tempted to add a `TabView` with separate tabs for characters, episodes and settings. The settings screen could have included things like appearance mode or language selection.

I decided not overcomplicate and stick to the minimum.

---

## CharactersListView

`CharactersListView` displays characters in a native SwiftUI `List`.

The screen supports:

- initial loading,
- pull to refresh,
- search,
- pagination,
- empty state,
- error state,
- favorite characters pinned to the top.

Refreshing is handled with SwiftUI’s `.refreshable()` modifier.

Searching is handled with `.searchable()`.

SwiftUI APIs their best.

Characters are fetched using `CharacterRepository`. The list uses pagination to load more characters when the user scrolls to the end.

I also implemented favorite characters. A user can mark a character as favorite using swipe actions, and favorite characters are pinned to the top of the list.

The favorite logic is handled through `FavoriteCharactersRepository`.

---

## CharacterDetailsView

`CharacterDetailsView` is the simplest of the three screens.

It displays a character card with information such as:

- name,
- image,
- species,
- gender,
- status,
- origin,
- last known location.

Below the card, the screen displays a list of episodes in which the character appeared.

The ViewModel for this screen depends only on `FavoriteCharactersRepository`.

The screen already receives a `Character` object, so it does not need to fetch character details again.

The ViewModel is only responsible for checking and updating the favorite state.

---

## EpisodeDetailsView

`EpisodeDetailsView` displays episode details and the episode cast.

The screen fetches episode data using `EpisodeRepository`.

Then, based on character IDs from the episode model, it fetches character data using `CharacterRepository`.

I also wanted to show whether a character from the cast is marked as favorite, so `FavoriteCharactersRepository` is involved as well.

Favorite characters are displayed first in the cast list. This makes the UI more personalized and keeps favorite-related behavior consistent across the app.

---

## UI Styling

I wanted the UI to feel clean and readable while still matching the Rick and Morty theme.

Colors were chosen to fit the general mood of the show.

For example, character status and gender are displayed using reusable badges. Some values use solid colors, while others can use gradients.

The styling logic is kept in Presentation-specific extensions, for example:

```text
CharacterGender+Presentation
CharacterStatus+Presentation
```

This keeps the Domain layer clean.

`CharacterGender` and `CharacterStatus` describe business meaning. Their colors and visual styles belong to Presentation.

---

## InfoBadge

`InfoBadge` is a small reusable component used to display information such as status, gender or species.

It accepts any `ShapeStyle`, which means it can work with:

```text
Color
LinearGradient
AnyShapeStyle
```

This makes the component flexible without adding much complexity.

It also keeps badge styling consistent between screens.

---

## 🔤 Localization

The project uses `Localizable.xcstrings`.

I decided to use Localization to display text in two languages:
- Polish
- English

This was my personal preference, because I always build apps to support more than one language.

Although only translations where made for these two languages, user facing stringsa are not hardcoded and app is easier to localize.

---

## 🧪 Unit Tests

I added unit tests using Swift Testing.

The main focus is on ViewModels because they contain most of the app behavior.

The tests cover scenarios such as:

- successful loading,
- empty state,
- error state,
- favorite characters,
- search,
- pagination,
- episode details loading.

Thanks to repository protocols and mock repositories, ViewModels can be tested without making real network requests.

This was one of the main reasons why repositories were introduced early in the project.

---

## 📈 What I Would Improve Next

There are still some things I would like to improve or add later:

- more unit tests,
- mapper tests,
- accessibility labels,
- snapshot tests

... and **COMMIT CHANGES REGULARLY**

---

## Summary

Overall, the project helped me practice building a SwiftUI app with a structure that is clean, understandable and prepared for future testing.

I enjoyed this project from the very start and I plan to build more in near future.

If you reached the end of this document and are reading this words, I would like to thank you once again for the time you spent on reading this document 😄

I wish you all the best,

Take care! 👋🏻
