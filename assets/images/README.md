# Cara Menambahkan Gambar Social Media

## Langkah-langkah:

### 1. Download Gambar/Icon

Download gambar icon untuk setiap social media dengan nama berikut:

- `instagram.png` - Icon Instagram
- `gmail.png` - Icon Gmail
- `youtube.png` - Icon YouTube
- `whatsapp.png` - Icon WhatsApp

### 2. Simpan Gambar

Simpan semua gambar tersebut di folder ini:

```
portofolio_andika/assets/images/
```

### 3. Format Gambar

- Format yang disarankan: PNG dengan background transparan
- Ukuran yang disarankan: 512x512 pixels atau 1024x1024 pixels
- Ukuran file: Maksimal 500KB per gambar

### 4. Sumber Download Icon

Anda bisa download icon dari:

**Gratis & Berkualitas:**

- **Flaticon** (https://www.flaticon.com/)

  - Search: "instagram icon", "gmail icon", "youtube icon", "whatsapp icon"
  - Download format PNG
  - Pilih yang memiliki background transparan

- **Icons8** (https://icons8.com/)

  - Search icon yang diinginkan
  - Download format PNG
  - Pilih ukuran 512px atau lebih

- **IconFinder** (https://www.iconfinder.com/)
  - Filter: Free icons
  - Download format PNG

**Menggunakan Logo Resmi:**

- Instagram: https://www.instagram.com/brand/
- YouTube: https://www.youtube.com/about/brand-resources/
- WhatsApp: https://www.whatsapp.com/brand-guidelines/
- Gmail: Search "gmail icon png" di Google Images (pilih yang transparan)

### 5. Rename File

Pastikan nama file sesuai dengan yang tertulis di kode:

- `instagram.png`
- `gmail.png`
- `youtube.png`
- `whatsapp.png`

**PENTING:** Nama file harus sama persis (huruf kecil semua)

### 6. Struktur Folder Akhir

```
portofolio_andika/
├── assets/
│   └── images/
│       ├── instagram.png
│       ├── gmail.png
│       ├── youtube.png
│       ├── whatsapp.png
│       └── README.md (file ini)
├── fonts/
│   └── Jersey10-Regular.ttf
└── lib/
    └── main.dart
```

### 7. Setelah Menambahkan Gambar

Setelah menyimpan semua gambar, jalankan command:

```bash
flutter pub get
```

Kemudian restart aplikasi Flutter Anda.

## Tips:

- Gunakan icon dengan warna yang sesuai (Instagram: gradien ungu-pink, Gmail: warna merah/putih, YouTube: merah, WhatsApp: hijau)
- Pastikan background transparan agar terlihat bagus di background hitam
- Jika gambar terlalu besar, bisa resize menggunakan tool online seperti TinyPNG atau ImageResizer
