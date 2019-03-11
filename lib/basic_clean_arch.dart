library basic_clean_arch;

/// A Displayer is used to display the result of a use case that changes the
/// displayed view.
abstract class Displayer<T> {
  /// Displays data from a ViewModel or an Error contained in [result].
  void display({Future<T> result});
}

/// A Presenter is used to get a ViewModel from Entities or other Models.
abstract class Presenter<Model,ViewModel> {
  /// Takes data from an Entity or another Model [model] and returns a ViewModel.
  ViewModel present(Model model);
}

/// A `UseCase` is typically implemented by an interactor.
/// It executes the business logic of the use case.
abstract class UseCase<RequestType,Model,ViewModel> {
  /// The [Presenter] to use.
  Presenter<Model,ViewModel> presenter;
  /// Executes the UseCase for the given [request].
  void execute({RequestType request,Displayer displayer});
}