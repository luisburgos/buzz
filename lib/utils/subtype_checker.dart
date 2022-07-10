class SubtypeChecker<Child, Parent> {
  bool isValid() {
    return isSubtype1<Child, Parent>();
  }

  bool isSubtype1<S, T>() {
    final isSASubtypeOfT = <S>[] is List<T>;
    print('isSubtype1 - is $S ASubtypeOf $T: $isSASubtypeOfT');

    final isTASubtypeOfS = <T>[] is List<S>;
    print('isSubtype1 - is $T ASubtypeOf $S: $isTASubtypeOfS');

    return isSASubtypeOfT && !isTASubtypeOfS;
  }
}
