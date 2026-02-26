import 'dart:io';

void main() {
  stdout.write("Masukkan jumlah anak ayam mula-mula (N): ");
  int? n = int.tryParse(stdin.readLineSync()!);

  if (n == null || n <= 0) {
    print("Input tidak valid. Masukkan angka lebih dari 0.");
    return;
  }

  for (int i = n; i >= 1; i--) {
    if (i == 1) {
      print("Anak ayam turun 1, mati satu tinggal induknya");
    } else {
      print("Anak ayam turun $i, mati satu tinggal ${i - 1}");
    }
  }
}