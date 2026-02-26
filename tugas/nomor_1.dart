import 'dart:io';

class ProgramBelanja {
  void run() {
    bool isMemberCard = inputKartu();
    double totalBelanja = inputTotalBelanja();

    double diskon = hitungDiskon(
      isMemberCard: isMemberCard,
      totalBelanja: totalBelanja,
    );

    tampilkanHasil(
      totalBelanja: totalBelanja,
      diskon: diskon,
    );
  }

  bool inputKartu() {
    stdout.write("Apakah memiliki kartu member? (1 = Ya, 0 = Tidak): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    return pilihan == 1;
  }

  double inputTotalBelanja() {
    stdout.write("Masukkan total belanja (dalam rupiah): ");
    return double.parse(stdin.readLineSync()!);
  }

  double hitungDiskon({
    required bool isMemberCard,
    required double totalBelanja,
  }) {
    double diskon = 0;

    if (isMemberCard) {
      if (totalBelanja > 500000) {
        diskon = 50000;
      } else if (totalBelanja > 100000) {
        diskon = 15000;
      }
    } else {
      if (totalBelanja > 100000) {
        diskon = 5000;
      }
    }

    return diskon;
  }

  void tampilkanHasil({
    required double totalBelanja,
    required double diskon,
  }) {
    double totalBayar = totalBelanja - diskon;

    print("\n===== HASIL TRANSAKSI =====");
    print("Total Belanja : Rp $totalBelanja");
    print("Diskon        : Rp $diskon");
    print("Total Bayar   : Rp $totalBayar");
  }
}

void main() {
  ProgramBelanja().run();
}