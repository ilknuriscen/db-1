# db-1
# Veritabanı Dokümantasyonu

## Proje Amacı
Bu veritabanı, tarım ürünleri yönetim sistemi kapsamında; çiftçi, ürün, sipariş ve kullanıcı yönetimini sağlamak için tasarlanmıştır. 

## Genel Bilgiler
Bu veritabanı, aşağıdaki tabloları ve ilişkileri içermektedir:
- **Kullanıcılar**: Sisteme kayıtlı tüm kullanıcı bilgilerini içerir.
- **Çiftçiler**: Çiftçilere ait özel bilgileri içerir.
- **Ürünler**: Çiftçilerin eklediği ürün bilgilerini içerir.
- **Siparişler**: Kullanıcıların verdikleri sipariş bilgilerini içerir.
- **Kategoriler**: Ürünlerin kategorilerini düzenler.

## Tablolar ve Açıklamaları
### 1. **roller**
- Kullanıcıların rollerini belirtir.
- **İlişki**: `kullanicilar` tablosuyla ilişkilidir.

### 2. **kullanicilar**
- Kullanıcıların temel bilgilerini içerir.
- **Alanlar**: `ad_soyad`, `email`, `telefon`, `rol_id`.
- **İlişki**: `roller`, `teslimat_adresleri`, `urunler`, `siparisler` tabloları ile ilişkilidir.

### 3. **urunler**
- Çiftçiler tarafından eklenen ürünleri içerir.
- **Alanlar**: `urun_adi`, `kategori_id`, `ciftci_id`, `birim_fiyat`, `stok_miktari`.
- **İlişki**: `urun_kategorileri`, `ciftciler`, `siparis_detaylari`, `stok_takip`, `favori_urunler`.

### 4. **siparisler**
- Kullanıcıların verdikleri sipariş bilgilerini içerir.
- **Alanlar**: `kullanici_id`, `toplam_tutar`, `created_at`.
- **İlişki**: `siparis_detaylari`, `iade_talepleri`, `odeme`.

### 5. **urun_kategorileri**
- Ürün kategorilerini içerir.
- **Alanlar**: `kategori_adi`, `aciklama`.
- **İlişki**: `urunler`.

### 6. **siparis_detaylari**
- Siparişlerdeki ürün bilgilerini içerir.
- **Alanlar**: `urun_id`, `miktar`, `birim_fiyat`.

### 7. **ciftciler**
- Çiftçilere ait detaylı bilgileri içerir.
- **Alanlar**: `ciftci_turu`, `ekipman_id`.
- **İlişki**: `urunler`, `ciftlik_ekipmanlari`.

### 8. **yorumlar**
- Kullanıcıların ürünlere yaptığı yorumları içerir.
- **Alanlar**: `urun_id`, `yorum_metin`, `yorum_tarih`.

### 9. **stok_takip**
- Ürünlerin stok durumunu izler.
- **Alanlar**: `urun_id`, `guncel_stok`, `son_guncelleme_tarihi`.

### 10. **teslimat_adresleri**
- Kullanıcıların teslimat adreslerini içerir.
- **Alanlar**: `kullanici_id`, `adres`, `sehir`, `posta_kodu`.

### 11. **sikayetler**
- Kullanıcıların sistemle ilgili şikayetlerini içerir.
- **Alanlar**: `kullanici_id`, `metin`, `tarih`.


## Kurulum ve Kullanım
1. Veritabanı dosyasını indirin ve MySQL veritabanı yönetim sistemine yükleyin.
2. Gerekli tabloları oluşturmak için `migrations` dosyalarını çalıştırın.
3. Proje içerisindeki `.env` dosyasını düzenleyerek veritabanı bağlantı bilgilerini ekleyin.


