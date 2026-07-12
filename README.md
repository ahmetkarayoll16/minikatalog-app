# Mini Katalog Uygulaması

## Açıklama

Bu proje, bir frontend staj (internship) eğitim projesi kapsamında geliştirilmiş basit bir ürün katalog uygulamasıdır. Kullanıcılar ürünleri bir grid görünümünde listeleyebilir, ürün detaylarını inceleyebilir ve seçtikleri ürünleri sepete ekleyip yönetebilirler.

Uygulama, gerçek bir API'ye bağlanmadan, mock (simüle edilmiş) JSON verisi kullanılarak geliştirilmiştir. Herhangi bir state management (Provider, Riverpod vb.) veya HTTP paketi kullanılmamıştır — yalnızca Flutter'ın kendi `material.dart` kütüphanesi tercih edilmiştir.

## Özellikler

- **Discover (Ana Sayfa):** Ürünlerin `GridView` ile listelendiği ekran
- **Ürün Detay Sayfası:** Seçilen ürünün görseli, başlığı, fiyatı ve açıklamasının gösterildiği ekran
- **Sepet Sayfası:** Sepete eklenen ürünlerin listelendiği, adet artırma/azaltma ve silme işlemlerinin yapılabildiği ekran
- Sayfalar arası geçiş `Navigator.push/pop` ile, veri aktarımı ise Route Arguments mantığıyla gerçekleştirilmiştir

## Kullanılan Flutter Sürümü

```
Flutter 3.44.6
Dart 3.12.2
```

> **Not:** Kendi ortamındaki tam sürüm numarasını görmek için terminalde `flutter --version` komutunu çalıştır ve çıktıdaki değerleri yukarıdaki alana güncelle.

## Çalıştırma Adımları

1. Bu repository'yi bilgisayarına klonla:
   ```
   git clone https://github.com/ahmetkarayoll16/minikatalog-app
   ```

2. Proje klasörüne gir:
   ```
   cd /minikatalog-app
   ```

3. Bağımlılıkları yükle:
   ```
   flutter pub get
   ```

4. Bağlı bir emülatör veya fiziksel cihaz olduğundan emin ol:
   ```
   flutter devices
   ```

5. Uygulamayı çalıştır:
   ```
   flutter run
   ```

## Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── models/
│   └── product_model.dart       # Product modeli (fromJson/toJson)
├── data/
│   ├── mock_products.dart       # Simüle edilmiş JSON verisi
│   └── cart_manager.dart        # Sepet yönetimi (singleton)
├── screens/
│   ├── discover_screen.dart     # Ana sayfa
│   ├── product_detail_screen.dart  # Ürün detay sayfası
│   └── cart_screen.dart         # Sepet sayfası
└── widgets/
    ├── product_card.dart        # Grid kartı
    └── product_image.dart       # Network/asset görsel yöneticisi
```
