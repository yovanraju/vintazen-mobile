# Vintazen Mobile

### Tugas 7

##### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

- Definisi Stateless Widget:

    Stateless Widget adalah widget Flutter yang tidak memiliki state internal. Widget ini tidak memiliki state internal yang dapat diubah setelah dibuat. Stateless Widget hanya dapat menerima data dari luar dan mengirimkan data ke luar melalui parameter.

- Definisi Stateful Widget: 

   Stateful Widget adalah widget yang memiliki state atau status yang dapat berubah selama siklus hidupnya. Ini memungkinkan widget untuk berinteraksi dengan pengguna dan memperbarui tampilannya sesuai dengan perubahan data atau interaksi.

- Perbedaan Stateless Widget dan Stateful Widget:

1. Status (State):

    - Stateless Widget: Tidak memiliki state yang berubah. Semua data bersifat final dan tidak dapat diubah setelah widget dibuat.
    - Stateful Widget: Memiliki state yang dapat berubah selama siklus hidup widget, memungkinkan pembaruan UI secara dinamis.

2. Implementasi:

    - Stateless Widget: Hanya membutuhkan satu kelas yang mengextends StatelessWidget.
    - Stateful Widget: Membutuhkan dua kelas, yaitu kelas widget yang mengextends StatefulWidget dan kelas state yang mengextends State.

3. Kinerja:

    - Stateless Widget: Biasanya lebih efisien karena tidak perlu menangani perubahan state.
    - Stateful Widget: Mungkin sedikit lebih berat karena harus menangani perubahan state dan pembaruan UI.

4. Penggunaan:

    - Stateless Widget: Digunakan untuk elemen UI yang statis dan tidak memerlukan interaksi atau perubahan.
    - Stateful Widget: Digunakan untuk elemen UI yang interaktif dan memerlukan perubahan berdasarkan tindakan pengguna atau data yang berubah.

##### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- Scaffold
    Fungsi: Menyediakan struktur dasar halaman aplikasi dengan AppBar dan body
- AppBar
    Fungsi: Menampilkan bar bagian atas aplikasi yang berisi judul "Vintazen"
- Column & Row
    Fungsi: Mengatur tata letak widget secara vertikal (Column) dan horizontal (Row)
- Padding
    Fungsi: Memberikan jarak/padding pada widget
- Text
    Fungsi: Menampilkan teks seperti judul, nama, NPM, dan kelas
- Card
    Fungsi: Menampilkan informasi dalam bentuk kartu (digunakan di InfoCard)
- Container
    Fungsi: Mengatur tata letak dan styling widget di dalamnya
- GridView
    Fungsi: Menampilkan item-item dalam bentuk grid 3 kolom
- Material
    Fungsi: Memberikan efek material design pada widget
InkWell
    Fungsi: Memberikan efek sentuhan dan menangani event onTap
- Icon
    Fungsi: Menampilkan ikon untuk setiap menu item

##### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` berfungsi untuk memberitahu framework Flutter bahwa ada perubahan state internal yang memerlukan rebuild widget. Variabel yang dapat terdampak adalah variabel yang dideklarasikan sebagai state dalam StatefulWidget.

##### 4. Jelaskan perbedaan antara const dengan final.

1. const:
    - Nilai harus sudah diketahui pada saat compile time
    - Nilai tidak dapat diubah sama sekali
    - Membuat objek menjadi deeply immutable
    - Contoh dalam kode: `const Text('Vintazen')`

2. final:
    - Nilai bisa diketahui pada saat runtime
    - Nilai hanya bisa di-assign sekali
    - Tidak membuat objek menjadi deeply immutable
    - Contoh dalam kode: `final String npm = '2306275512'`

Dalam kode ini, `final` digunakan untuk variabel seperti `npm`, `name`, dan `className` karena nilainya ditetapkan saat runtime, sedangkan `const` digunakan untuk widget yang nilainya sudah diketahui saat compile time seperti `const Text()` dan `const SizedBox()`.

##### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

1. Membuat Proyek Flutter Baru

        flutter create vintazen
        cd vintazen

2. Merapikan Struktur Proyek

    - Membuat file baru `menu.dart` di folder `lib`
    - Memindahkan logika tampilan dari `main.dart` ke `menu.dart`
    - Mengimpor `menu.dart` di `main.dart`

3. Membuat Widget Sederhana

    a. Mengubah tema warna di main.dart:

        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400])

    b. Membuat widget stateless dan menambahkan data diri:

        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Product", Icons.shopping_cart, Color(0xFF2A3132)),  // Warna biru tua
            ItemHomepage("Tambah Product", Icons.add, Color(0xFF336B87)),          // Warna biru muda
            ItemHomepage("Logout", Icons.logout, Color(0xFF90AFC5)),               // Warna abu-abu
        ];


4. Membuat Tiga Tombol Sederhana

    a. Membuat model untuk tombol:

        class ItemHomepage {
            final String name;
            final IconData icon;
            final Color color;

            ItemHomepage(this.name, this.icon, this.color);
        }

    b. Mendefinisikan tombol dengan warna berbeda:

        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Product", Icons.shopping_cart, Color(0xFF2A3132)),  // Warna biru tua
            ItemHomepage("Tambah Product", Icons.add, Color(0xFF336B87)),          // Warna biru muda
            ItemHomepage("Logout", Icons.logout, Color(0xFF90AFC5)),               // Warna abu-abu
        ];

5. Membuat Komponen Card

    a. Membuat `InfoCard` untuk menampilkan informasi:

        class InfoCard extends StatelessWidget {
            final String title;
            final String content;
            final Color color;
            
            const InfoCard({
                super.key, 
                required this.title, 
                required this.content, 
                required this.color
            });
            // ... implementasi build
        }

    b. Membuat `ItemCard` dengan `Snackbar`:

        class ItemCard extends StatelessWidget {
            final ItemHomepage item;
            const ItemCard(this.item, {super.key});

            @override
            Widget build(BuildContext context) {
                return Material(
                    color: item.color,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                        onTap: () {
                            ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                    SnackBar(
                                        content: Text("Kamu telah menekan tombol ${item.name}!")
                                    )
                                );
                            },
                            child: Container(
                                // ... implementasi tampilan tombol
                        ),
                        ),
                    );
                }
        }

6. Menyusun Layout

    - Menggunakan Scaffold sebagai struktur dasar
    - Menambahkan AppBar dengan judul "Vintazen"
    - Menyusun komponen dengan Column dan Row
    - Menampilkan info cards menggunakan Row
    - Menampilkan menu items menggunakan GridView.count:

            GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ItemHomepage item) {
                    return ItemCard(item);
                }).toList(),
            )

7. Kustomisasi Tampilan

    - Menambahkan warna kustom untuk background (Color(0xFF73605B))
    - Mengatur padding dan spacing
    - Menambahkan style untuk text dan icon
    - Membuat card dengan border radius

8. Fitur Interaktif yang Diimplementasikan

    - Tiga tombol dengan fungsi berbeda:
        - Lihat Product (dengan ikon shopping cart)
        - Tambah Product (dengan ikon add)
        - Logout (dengan ikon logout)
    - Setiap tombol memiliki warna yang berbeda
    - Feedback berupa Snackbar saat tombol ditekan:
        - "Kamu telah menekan tombol Lihat Product"
        - "Kamu telah menekan tombol Tambah Product"
        - "Kamu telah menekan tombol Logout"



### Tugas 8

1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

    - Kegunaan const di Flutter adalah untuk membuat objek yang immutable (tidak dapat diubah) dan deeply immutable (tidak dapat diubah meskipun objek tersebut direferensikan oleh objek lain).
    - Keuntungan menggunakan const adalah meningkatkan performa karena objek yang sudah dibuat tidak perlu dibuat lagi, dan memudahkan debugging karena nilai objek sudah diketahui pada compile time.
    - Sebaiknya menggunakan const saat nilai objek sudah diketahui pada compile time, seperti konstanta atau nilai yang tidak berubah selama runtime.
    - Sebaiknya tidak menggunakan const untuk objek yang nilainya tidak diketahui pada compile time, seperti nilai yang didapatkan dari API atau input pengguna.    

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

    - Column: Mengatur widget secara vertikal
    - Row: Mengatur widget secara    horizontal    

    Contoh implementasi:

    Column(
        children: [
            Text('Hello, World!'),
        ],
    )

    Row(
        children: [
            Text('Hello, World!'),
        ],
    )

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

    - Elemen input yang digunakan adalah TextFormField untuk input nama produk, intensitas, dan perasaan.
    - Tidak ada elemen input Flutter lain yang digunakan pada tugas ini.    

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

    - Mengatur tema dengan mengubah warna pada `main.dart`
    - Mengimplementasikan tema pada aplikasi yang dibuat

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

    Dalam aplikasi Vintazen, saya menerapkan beberapa teknik navigasi Flutter untuk mengelola perpindahan antar halaman:

    -   Penggunaan Navigator.push dan Navigator.pop
        Untuk berpindah ke halaman baru, saya menggunakan Navigator.push:


            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HalamanBaru()),
            );

        Untuk kembali ke halaman sebelumnya, saya menggunakan Navigator.pop:

            Navigator.pop(context);

    -   Implementasi Drawer untuk Navigasi Menu:
         
        Saya menggunakan widget Drawer untuk membuat menu navigasi samping:

            Drawer(
                child: ListView(
                    children: [
                        DrawerHeader(   
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                        ),  
                        child: Text('Menu Vintazen'),
                    ),
                    ListTile(
                        title: Text('Halaman Utama'),
                            onTap: () {
                                Navigator.pushReplacement(
                                context,    
                                MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                        },
                    ),
                    // Item menu lainnya
                    ],
                ),
            );

    -   Penggunaan Named Routes
        Untuk halaman-halaman utama, saya mendefinisikan named routes di main.dart:

            MaterialApp(
                initialRoute: '/',
                routes: {
                    '/': (context) => MyHomePage(),
                    '/tambah': (context) => TambahProdukForm(),
                    '/lihat': (context) => LihatProduk(),
                },
            );

        Kemudian, saya bisa menggunakan Navigator.pushNamed untuk berpindah halaman:

            Navigator.pushNamed(context, '/tambah');

Dengan menerapkan teknik-teknik ini,saya dapat mengelola navigasi antar halaman dengan efektif dalam aplikasi Vintazen. Pendekatan ini memungkinkan pengguna untuk berpindah antar halaman dengan mudah dan memberikan pengalaman pengguna yang lancar.

