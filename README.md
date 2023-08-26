# Flutter Architecture

## Important Points

- Use Separation of Concerns principle.
- **Repository**: A repository class abstracts the data sources from the rest of the app. It is the single source of truth for data.
- **Dependency Injection**: Dependency injection is a technique whereby one object supplies the dependencies of another object. A dependency is an object that can be used (a service). An injection is the passing of a dependency to a dependent object (a client) that would use it.
- **GetIt**: GetIt is a simple service locator for Dart and Flutter projects. It allows to decouple the interface from a concrete implementation that can be provided in different ways (e.g. for testing purposes or to switch implementations).
- **Entity**: An entity is a business object that encapsulates the state and behavior of a domain concept. The entity is the fundamental building block for modeling the domain in object-oriented programming. Entities are used in UI instead of models.
- UI will always communicate with Domain Layer. Domain Layer will communicate with Data Layer. Data Layer will communicate with API or Database.
- **Domain Layer**: The domain layer is a collection of entities and use cases. This layer is independent of every other layer and contains all the business logic of the app.
