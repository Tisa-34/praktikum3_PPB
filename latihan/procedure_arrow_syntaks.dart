void main() {
  var waktuSekarang = 110;
  var dia = 'Kudo Shinichi';

  if (waktuSekarang <= 10) {
    play(dia);
  } else if (waktuSekarang == 17) {
    kasus(dia);
  } else {
    play(dia);
  }
}

void kasus(var nama) => print('$nama sedang memecahkan kasus.');

void play(var nama) => print('$nama sedang main.');