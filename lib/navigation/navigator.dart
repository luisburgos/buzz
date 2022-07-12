abstract class Navigator {
  String get backDefaultRoute;

  void back();
  void offAndToNamed(String fallback);
  void toNamed(String path);
  bool canPop();
}
