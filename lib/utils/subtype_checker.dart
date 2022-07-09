class SubtypeChecker<Child, Parent> {
  bool isValidSubtype(dynamic type) {
    return isSubtype2<Child, Parent>(type);
  }

  bool isValid({dynamic type = null}) {
    return isSubtype1<Child, Parent>(type);
    //return isSubtype1<Child, Parent>(type);
  }

  bool isSubtype1<S, T>(dynamic type) {
    final isSASubtypeOfT = <S>[] is List<T>;
    print('isSubtype1 - is $S ASubtypeOf $T: $isSASubtypeOfT');

    final isTASubtypeOfS = <T>[] is List<S>;
    print('isSubtype1 - is $T ASubtypeOf $S: $isTASubtypeOfS');

    return isSASubtypeOfT && !isTASubtypeOfS;
  }

  bool isSubtype2<S, T>(dynamic type) {
    var isSubtype = false;
    try {
      isSubtype = isSubtype3<T>(type);
    } catch (e) {
      print(e);
    }
    print('isSubtype2 - isSubtype: $isSubtype');
    return isSubtype;
  }

  bool isSubtype3<T>(dynamic type) {
    final listFromS = List.from([type]);
    print('isSubtype3 - listFromS: $listFromS');
    return listFromS is List<T>;
  }
}
