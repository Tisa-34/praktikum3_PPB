import 'dart:io';
List<Map<String, dynamic>> daftarBuku = [];
List<Map<String, dynamic>> daftarMahasiswa = [];
List<Map<String, dynamic>> daftarPeminjaman = [];

void main() {
  while (true) {
    print("\n===== SISTEM PERPUSTAKAAN =====");
    print("1. Tambah Buku");
    print("2. Tambah Mahasiswa");
    print("3. Pinjam Buku");
    print("4. Lihat Data");
    print("5. Keluar");
    stdout.write("Pilih menu: ");
    String? pilih = stdin.readLineSync();

    switch (pilih) {
      case '1':
        tambahBuku();
        break;
      case '2':
        tambahMahasiswa();
        break;
      case '3':
        pinjamBuku();
        break;
      case '4':
        tampilData();
        break;
      case '5':
        print("Terima kasih.");
        return;
      default:
        print("Menu tidak tersedia.");
    }
  }
}

void tambahBuku() {
  stdout.write("ID Buku: ");
  String id = stdin.readLineSync()!;

  stdout.write("Judul Buku: ");
  String judul = stdin.readLineSync()!;


  if (daftarBuku.any((buku) => buku['judul'] == judul)) {
    print("Judul buku sudah ada!");
    return;
  }

  stdout.write("Penerbit: ");
  String penerbit = stdin.readLineSync()!;

  stdout.write("Stok (minimal 2): ");
  int stok = int.parse(stdin.readLineSync()!);

  if (stok < 2) {
    print("Stok minimal harus 2!");
    return;
  }

  daftarBuku.add({
    'id': id,
    'judul': judul,
    'penerbit': penerbit,
    'stok': stok
  });

  print("Buku berhasil ditambahkan.");
}


void tambahMahasiswa() {
  stdout.write("NIM: ");
  String nim = stdin.readLineSync()!;


  if (daftarMahasiswa.any((mhs) => mhs['nim'] == nim)) {
    print("NIM sudah terdaftar!");
    return;
  }

  stdout.write("Nama: ");
  String nama = stdin.readLineSync()!;

  daftarMahasiswa.add({
    'nim': nim,
    'nama': nama
  });

  print("Mahasiswa berhasil ditambahkan.");
}

void pinjamBuku() {
  stdout.write("Masukkan NIM: ");
  String nim = stdin.readLineSync()!;

  var mahasiswa =
      daftarMahasiswa.firstWhere((mhs) => mhs['nim'] == nim, orElse: () => {});

  if (mahasiswa.isEmpty) {
    print("Mahasiswa tidak ditemukan!");
    return;
  }


  int jumlahPinjam = daftarPeminjaman
      .where((pinjam) => pinjam['nim'] == nim)
      .length;

  if (jumlahPinjam >= 2) {
    print("Mahasiswa sudah meminjam maksimal 2 buku!");
    return;
  }

  stdout.write("Masukkan ID Buku: ");
  String idBuku = stdin.readLineSync()!;

  var buku =
      daftarBuku.firstWhere((b) => b['id'] == idBuku, orElse: () => {});

  if (buku.isEmpty) {
    print("Buku tidak ditemukan!");
    return;
  }

  if (buku['stok'] <= 1) {
    print("Stok buku tinggal 1. Tidak dapat dipinjam!");
    return;
  }


  buku['stok'] -= 1;

  daftarPeminjaman.add({
    'nim': nim,
    'nama': mahasiswa['nama'],
    'id': buku['id'],
    'judul': buku['judul']
  });

  print("Peminjaman berhasil.");
}


void tampilData() {
  print("\n--- DATA BUKU ---");
  for (var buku in daftarBuku) {
    print(
        "ID: ${buku['id']} | Judul: ${buku['judul']} | Penerbit: ${buku['penerbit']} | Stok: ${buku['stok']}");
  }

  print("\n--- DATA MAHASISWA ---");
  for (var mhs in daftarMahasiswa) {
    print("NIM: ${mhs['nim']} | Nama: ${mhs['nama']}");
  }

  print("\n--- DATA PEMINJAMAN ---");
  int no = 1;
  for (var pinjam in daftarPeminjaman) {
    print(
        "$no. NIM: ${pinjam['nim']} | Nama: ${pinjam['nama']} | ID Buku: ${pinjam['id']} | Judul: ${pinjam['judul']}");
    no++;
  }
}