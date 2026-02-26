void main() {
  var waktuSekarang = 17;
  var dia = 'Nur Budi Nugraha';

  if (waktuSekarang <= 10) {
    play(dia);
  } else if (waktuSekarang == 17) {
    eat(dia);
  } else {
    play(dia);
  }
}

void eat(var nama) {
  print('$nama sedang makan.');
}

void play(var nama) {
  print('$nama sedang main.');
}

