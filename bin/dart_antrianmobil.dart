import 'dart:io';

void main() {
  // Variabel untuk 3 Pos Cuci Mobil (null artinya kosong)
  String? posA;
  String? posB;
  String? posC;

  // List untuk menampung mobil yang masuk ke daftar tunggu (Waiting List)
  List<String> waitingList = [];

  bool jalan = true;

  while (jalan) {
    print('\n======================================');
    print('      SISTEM ANTRIAN CUCI MOBIL       ');
    print('======================================');
    print('1. Tambah Antrian');
    print('2. Lihat Waiting List');
    print('3. Lihat Pos (A, B, C)');
    print('4. Selesaikan Pos');
    print('5. Keluar dari Aplikasi');
    stdout.write('Pilih menu (1-5): ');

    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        stdout.write('Masukkan Plat Nomor / Nama Mobil: ');
        String? mobil = stdin.readLineSync();
        
        if (mobil != null && mobil.trim().isNotEmpty) {
          String namaMobil = mobil.trim();

          // Logika pengisian Pos A, B, C secara berurutan atau masuk ke waiting list
          if (posA == null) {
            posA = namaMobil;
            print('-> Mobil "$namaMobil" langsung masuk ke POS A.');
          } else if (posB == null) {
            posB = namaMobil;
            print('-> Mobil "$namaMobil" langsung masuk ke POS B.');
          } else if (posC == null) {
            posC = namaMobil;
            print('-> Mobil "$namaMobil" langsung masuk ke POS C.');
          } else {
            // Jika Pos A, B, dan C semuanya penuh, masukkan ke waiting list
            waitingList.add(namaMobil);
            print('-> Semua pos sedang penuh. Mobil "$namaMobil" masuk ke WAITING LIST (Antrian ke-${waitingList.length}).');
          }
        } else {
          print('Peringatan: Plat nomor tidak boleh kosong!');
        }
        break;

      case '2':
        print('\n--- DAFTAR WAITING LIST (ANTRIAN TUNGGU) ---');
        if (waitingList.isEmpty) {
          print('Tidak ada mobil dalam waiting list.');
        } else {
          for (int i = 0; i < waitingList.length; i++) {
            print('${i + 1}. ${waitingList[i]}');
          }
        }
        print('--------------------------------------------');
        break;

      case '3':
        print('\n--- STATUS POS CUCI MOBIL ---');
        print('Pos A : ${posA ?? "(Kosong)"}');
        print('Pos B : ${posB ?? "(Kosong)"}');
        print('Pos C : ${posC ?? "(Kosong)"}');
        print('-----------------------------');
        break;

      case '4':
        print('\nPilih pos yang ingin diselesaikan:');
        print('1. Pos A');
        print('2. Pos B');
        print('3. Pos C');
        stdout.write('Masukkan pilihan pos (1/2/3): ');
        String? pilihPos = stdin.readLineSync();

        if (pilihPos == '1') {
          if (posA == null) {
            print('Pos A sudah kosong.');
          } else {
            print('Mobil "${posA}" di Pos A telah selesai dicuci.');
            // Jika ada antrian di waiting list, otomatis masukkan ke Pos A
            if (waitingList.isNotEmpty) {
              posA = waitingList.removeAt(0);
              print('-> Mobil "${posA}" dari waiting list dipindahkan ke Pos A.');
            } else {
              posA = null;
            }
          }
        } else if (pilihPos == '2') {
          if (posB == null) {
            print('Pos B sudah kosong.');
          } else {
            print('Mobil "${posB}" di Pos B telah selesai dicuci.');
            // Jika ada antrian di waiting list, otomatis masukkan ke Pos B
            if (waitingList.isNotEmpty) {
              posB = waitingList.removeAt(0);
              print('-> Mobil "${posB}" dari waiting list dipindahkan ke Pos B.');
            } else {
              posB = null;
            }
          }
        } else if (pilihPos == '3') {
          if (posC == null) {
            print('Pos C sudah kosong.');
          } else {
            print('Mobil "${posC}" di Pos C telah selesai dicuci.');
            // Jika ada antrian di waiting list, otomatis masukkan ke Pos C
            if (waitingList.isNotEmpty) {
              posC = waitingList.removeAt(0);
              print('-> Mobil "${posC}" dari waiting list dipindahkan ke Pos C.');
            } else {
              posC = null;
            }
          }
        } else {
          print('Pilihan pos tidak valid.');
        }
        break;

      case '5':
        jalan = false;
        print('Terima kasih telah menggunakan aplikasi sistem antrian.');
        break;

      default:
        print('Pilihan tidak valid. Silakan pilih menu 1 sampai 5.');
    }
  }
}