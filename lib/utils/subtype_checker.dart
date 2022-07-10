class SubtypeChecker<Child, Parent> {
  bool isValid() {
    return isSubtype<Child, Parent>();
  }

  bool isSubtype<S, T>() {
    final isSASubtypeOfT = <S>[] is List<T>;
    final isTASubtypeOfS = <T>[] is List<S>;
    return isSASubtypeOfT && !isTASubtypeOfS;
  }
}
