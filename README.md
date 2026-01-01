# Portfolio Andika - Flutter Web Project

Website portfolio pribadi yang dibuat menggunakan Flutter framework.

## 🎨 Design Specifications

- **Background Color**: Hitam (#000000)
- **Text Color**: Putih (#FFFFFF)
- **Accent Color**: Merah (#FF0000) untuk garis putus-putus
- **Font Family**: Jersey 10
- **Logo Opacity**: 45% untuk "JUST_K"

## 📁 Struktur Project

```
portofolio_andika/
├── assets/
│   └── images/          # Folder untuk icon social media
│       ├── instagram.png
│       ├── gmail.png
│       ├── youtube.png
│       └── whatsapp.png
├── fonts/
│   └── Jersey10-Regular.ttf  # Font Jersey 10
├── lib/
│   └── main.dart        # Main file dengan Contact Page
└── pubspec.yaml         # Dependencies dan assets configuration
```

## 🚀 Setup Instructions

### 1. Install Font Jersey 10

1. Download font Jersey 10 dari [Google Fonts](https://fonts.google.com/specimen/Jersey+10)
2. Extract file dan copy `Jersey10-Regular.ttf` ke folder `fonts/`
3. Lihat detail di `fonts/README.md`

### 2. Tambahkan Gambar Social Media

1. Download icon untuk:

   - Instagram (instagram.png)
   - Gmail (gmail.png)
   - YouTube (youtube.png)
   - WhatsApp (whatsapp.png)

2. Simpan semua icon di folder `assets/images/`

**Sumber Download Icon:**

- [Flaticon](https://www.flaticon.com/) - Icon gratis berkualitas
- [Icons8](https://icons8.com/) - Icon dengan berbagai style
- [IconFinder](https://www.iconfinder.com/) - Filter: Free icons

**Tips:**

- Format: PNG dengan background transparan
- Ukuran: 512x512px atau 1024x1024px
- Pastikan nama file sesuai: `instagram.png`, `gmail.png`, dll (huruf kecil)

3. Lihat panduan lengkap di `assets/images/README.md`

### 3. Run Project

```bash
# Install dependencies
flutter pub get

# Run di Chrome (untuk web)
flutter run -d chrome

# Atau build untuk production
flutter build web
```

## 📱 Fitur Contact Page

- ✅ Header dengan logo "JUST_K" (opacity 45%)
- ✅ Navigation menu: HOME, ABOUT, PORTOFOLIO, CONTACT
- ✅ Garis merah putus-putus (top & bottom)
- ✅ Text informasi kontak
- ✅ Icon social media interaktif:
  - Instagram (@JUST_K513)
  - Gmail
  - YouTube (KEVIN ZONE)
  - WhatsApp

## 🎯 Roadmap

- [ ] Implementasi halaman HOME
- [ ] Implementasi halaman ABOUT
- [ ] Implementasi halaman PORTOFOLIO
- [ ] Tambahkan animasi transisi
- [ ] Tambahkan link aktif ke social media
- [ ] Responsive design untuk mobile

## 💻 Development

Project ini menggunakan:

- Flutter SDK ^3.9.0
- Font: Jersey 10
- Target Platform: Web (support all platforms)

## 📝 Notes

- Semua kode saat ini ada di `main.dart` untuk kemudahan development awal
- Page HOME, ABOUT, dan PORTOFOLIO akan diimplementasikan di tahap berikutnya
- Contact page sudah fully functional dengan design sesuai mockup

## 🔧 Troubleshooting

### Font tidak muncul?

```bash
flutter clean
flutter pub get
# Restart aplikasi
```

### Gambar tidak muncul?

- Pastikan nama file sesuai (case-sensitive)
- Pastikan file ada di `assets/images/`
- Run `flutter pub get` setelah menambahkan gambar
- Restart aplikasi

## 📞 Contact Information

- Instagram: @JUST_K513
- YouTube: KEVIN ZONE

---

Made with ❤️ using Flutter
