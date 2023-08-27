# Flutter Architecture

## Important Points

- **Navigator Class**: This class is used to route to a new page, using that page's route class(mixin).
- **Route Class**: This class is used to define the route to a page. It is a mixin of the page's widget class.
- All the data on a page is displayed using the page's state.
- All the actions that are performed on a page are done using the page's cubit.
- TLDR: State is used for retrieving the data, and Cubit is used for performing actions.
