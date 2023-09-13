// ignore_for_file: file_names

String toCapitalize(String value) {
  List<String> words = value.split(' ');
  List<String> capitalizedWords = [];

  for (String word in words) {
    if (word.isNotEmpty) {
      String capitalizedWord =
          "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
      capitalizedWords.add(capitalizedWord);
    }
  }

  return capitalizedWords.join(' ');
}
