void main() {
  var daftarCemilan = ["Seblak", "Gacoan", "Wonton", "Ramen", "Matcha"];

  print("Daftar Cemilan");
  print("---------------");


  daftarCemilan.forEach((makanan) {
    print(makanan);
  });

  print("---------------");
  print("Total Cemilan : ${daftarCemilan.length}");
}