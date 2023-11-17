Future<int> getIntegers() async {
  int i = 0;
  i = 1;
  i = 2;
  i = 3;
  i = 4;
  i = 5;
  return i;
}

Stream<int> genIntegers() async* {
  int i = 0;
  i = 1;
  yield i;
  i = 2;
  await Future.delayed(const Duration(seconds: 2));
  yield i;
  i = 3;
  await Future.delayed(const Duration(seconds: 2));
  yield i;
  i = 4;
  await Future.delayed(const Duration(seconds: 2));
  yield i;
  i = 5;
  await Future.delayed(const Duration(seconds: 2));
  yield i;
}
