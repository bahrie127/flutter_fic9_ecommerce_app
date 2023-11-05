class Courier {
  final String code;
  final String name;

  Courier({
    required this.code,
    required this.name,
  });

  @override
  String toString() => name;
}

List<Courier> couriers = [
  Courier(code: 'jne', name: 'JNE'),
  Courier(code: 'pos', name: 'POS'),
  Courier(code: 'jnt', name: 'J&T'),
];

// kode subdistrict origin
const String subdistrictOrigin = '5779';
