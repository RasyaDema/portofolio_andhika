# Portfolio Andika - Flutter Web Project

Website portfolio pribadi yang dibuat menggunakan Flutter framework dengan arsitektur yang bersih dan terstruktur.

## 🎨 Design Specifications

- **Background Color**: Hitam (#000000)
- **Text Color**: Putih (#FFFFFF)
- **Accent Color**: Merah (#FF0000) untuk garis putus-putus
- **Font Family**: Jersey 10
- **Logo Opacity**: 45% untuk "JUST_K"

## 🏗️ Project Architecture

Project ini menggunakan **Clean Architecture** dengan pemisahan yang jelas antara UI, Business Logic, dan Data:

```
lib/
├── 📱 main.dart                    # Entry point
│
├── ⚙️ config/                      # Configuration
│   └── app_theme.dart             # Theme & text styles
│
├── 🎨 constants/                   # Constants
│   ├── app_constants.dart         # App constants
│   ├── app_colors.dart            # Color palette
│   └── constants.dart             # Barrel export
│
├── 📦 models/                      # Data models
│   ├── portfolio_item.dart
│   ├── contact_info.dart
│   └── models.dart
│
├── 🎮 controllers/                 # Business logic
│   ├── portfolio_controller.dart
│   ├── about_controller.dart
│   ├── contact_controller.dart
│   └── controllers.dart
│
├── 🔧 services/                    # Services
│   ├── navigation_service.dart
│   ├── portfolio_service.dart
│   ├── contact_service.dart
│   └── services.dart
│
├── 📄 screens/                     # UI screens
│   ├── about_page.dart
│   ├── contact_page.dart
│   └── portfolio_page.dart
│
├── 🧩 widgets/                     # Reusable widgets
│   ├── app_nav_bar.dart
│   ├── nav_item.dart
│   ├── social_media_icon.dart
│   └── dashed_line_painter.dart
│
├── 🗺️ routes/                      # Navigation
│   └── app_routes.dart
│
└── 🛠️ utils/                       # Utilities
    ├── responsive_helper.dart
    ├── animation_helper.dart
    └── validators.dart
```

### 📚 Documentation Files

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Penjelasan detail arsitektur
- **[REFACTORING_GUIDE.md](REFACTORING_GUIDE.md)** - Panduan refactoring
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - Quick reference guide
- **[MIGRATION_CHECKLIST.md](MIGRATION_CHECKLIST.md)** - Migration checklist
- **[SUMMARY.md](SUMMARY.md)** - Summary of changes

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
