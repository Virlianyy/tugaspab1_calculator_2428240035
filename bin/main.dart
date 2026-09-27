import 'dart:io';
import 'package:tugaspab1_calculator_2428240035/kalkulator.dart';

void main() {
  Kalkulator kalkulator = Kalkulator();

  print('================================');
  print('      KALKULATOR SEDERHANA');
  print('================================');

  bool ulangi = true;

  while (ulangi) {
    double bilanganPertama = inputBilangan('Masukkan bilangan pertama: ');
    double bilanganKedua = inputBilangan('Masukkan bilangan kedua: ');

    print('\nPilih operasi matematika:');
    print('[1] Tambah');
    print('[2] Kurang');
    print('[3] Kali');
    print('[4] Bagi');

    String? pilihan = stdin.readLineSync();

    double hasil;

    switch (pilihan) {
      case '1':
        hasil = kalkulator.tambah(bilanganPertama, bilanganKedua);
        print('\nHasil: $hasil');
        break;

      case '2':
        hasil = kalkulator.kurang(bilanganPertama, bilanganKedua);
        print('\nHasil: $hasil');
        break;

      case '3':
        hasil = kalkulator.kali(bilanganPertama, bilanganKedua);
        print('\nHasil: $hasil');
        break;

      case '4':
        if (bilanganKedua == 0) {
          print('\nError: Bilangan kedua tidak boleh 0 untuk pembagian.');
          continue;
        }

        hasil = kalkulator.bagi(bilanganPertama, bilanganKedua);
        print('\nHasil: $hasil');
        break;

      default:
        print('\nError: Pilihan tidak valid.');
        print('Silakan pilih menu 1, 2, 3, atau 4.');
        continue;
    }

    print('\nApakah ingin melakukan perhitungan lagi?');
    print('Ketik Y untuk Ya atau T untuk Tidak.');

    String? jawaban = stdin.readLineSync()?.toUpperCase();

    if (jawaban == 'Y') {
      ulangi = true;
    } else if (jawaban == 'T') {
      ulangi = false;
      print('\nTerima kasih telah menggunakan kalkulator!');
    } else {
      print('\nInput tidak valid. Program akan keluar.');
      ulangi = false;
    }
  }
}

double inputBilangan(String pesan) {
  while (true) {
    stdout.write(pesan);

    String? input = stdin.readLineSync();

    double? bilangan = double.tryParse(input ?? '');

    if (bilangan != null) {
      return bilangan;
    }

    print('Error: Input tidak valid.');
    print('Silakan masukkan angka, contoh: 10 atau 10.5\n');
  }
}

