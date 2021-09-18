
class MiniBookTranslations {
  static Map<String, String> get keys => {
    MiniBookStringsEnum.name.name: 'Cartilha',
  };
}

enum MiniBookStringsEnum {
  name,
}

extension MiniBookStringsEnumExt on MiniBookStringsEnum {
  String get name => this.toString();
}
