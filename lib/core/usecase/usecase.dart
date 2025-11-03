abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();

  Type call(Params params);
}

abstract class UsecaseGettter<T> {
  const UsecaseGettter();

  T get call;
}
