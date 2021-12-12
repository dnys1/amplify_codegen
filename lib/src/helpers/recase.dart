// Extended from recase v4.0 (https://github.com/techniboogie-dart/recase) to
// include changes related to acronym preservation.

final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');
final RegExp _acronymRegex = RegExp(r'^JSON|AWS|IP|ID');

final _symbolSet = {' ', '.', '/', '_', '\\', '-'};

/// An instance of text to be re-cased.
class ReCase {
  final String originalText;
  final List<String> _words;

  ReCase(String text)
      : originalText = text,
        _words = text.groupIntoWords();

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getPascalCase(separator: ' ');

  String _getCamelCase({String separator = ''}) {
    List<String> words = _words.map(_upperCaseFirstLetter).toList();
    if (_words.isNotEmpty) {
      words[0] = words[0].toLowerCase();
    }

    return words.join(separator);
  }

  String _getConstantCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String _getPascalCase({String separator = ''}) {
    List<String> words = _words.map(_upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String _getSentenceCase({String separator = ' '}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();
    if (_words.isNotEmpty) {
      words[0] = _upperCaseFirstLetter(words[0]);
    }

    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    List<String> words = _words.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }
}

extension StringReCase on String {
  String get capitalized {
    if (length < 2) return toUpperCase();
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get camelCase => ReCase(this).camelCase;

  String get constantCase => ReCase(this).constantCase;

  String get sentenceCase => ReCase(this).sentenceCase;

  String get snakeCase => ReCase(this).snakeCase;

  String get dotCase => ReCase(this).dotCase;

  String get paramCase => ReCase(this).paramCase;

  String get pathCase => ReCase(this).pathCase;

  String get pascalCase => ReCase(this).pascalCase;

  String get headerCase => ReCase(this).headerCase;

  String get titleCase => ReCase(this).titleCase;

  List<String> groupIntoWords() {
    final StringBuffer sb = StringBuffer();
    final List<String> words = [];

    for (var i = 0; i < length; i++) {
      final String char = this[i];
      final String? nextChar = i + 1 == length ? null : this[i + 1];

      if (_symbolSet.contains(char)) {
        continue;
      }

      sb.write(char);

      final bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) &&
              !_upperAlphaRegex.hasMatch(char)) ||
          _symbolSet.contains(nextChar);

      if (isEndOfWord) {
        var word = sb.toString();
        final acronym = _acronymRegex.firstMatch(word)?.group(0);
        if (acronym != null) {
          final capturedChars = word.length;
          final acronymLength = acronym.length;
          word = word.substring(0, acronymLength);
          i -= (capturedChars - acronymLength);
        }
        words.add(word);
        sb.clear();
      }
    }

    return words;
  }
}
