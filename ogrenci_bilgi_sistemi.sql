-- 1. Tablo Oluşturma: ogrenciler
CREATE TABLE ogrenciler (
    ogrenci_id INT AUTO_INCREMENT PRIMARY KEY,
    numara VARCHAR(20) UNIQUE NOT NULL,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    bolum VARCHAR(50)
);

-- 2. Tablo Oluşturma: dersler
CREATE TABLE dersler (
    ders_id INT AUTO_INCREMENT PRIMARY KEY,
    ders_adi VARCHAR(50) NOT NULL
);

-- 3. Tablo Oluşturma: notlar
CREATE TABLE notlar (
    not_id INT AUTO_INCREMENT PRIMARY KEY,
    ogrenci_id INT,
    ders_id INT,
    notu INT,
    FOREIGN KEY (ogrenci_id) REFERENCES ogrenciler(ogrenci_id) ON DELETE CASCADE,
    FOREIGN KEY (ders_id) REFERENCES dersler(ders_id) ON DELETE CASCADE
);

-- --------------------------
-- ÖRNEK VERİ EKLEME
-- --------------------------

-- ogrenciler tablosuna veri ekle
INSERT INTO ogrenciler (numara, ad, soyad, bolum) VALUES
('1001', 'Ali', 'Yilmaz', 'Bilgisayar Muhendisligi'),
('1002', 'Ayse', 'Demir', 'Elektrik Muhendisligi');

-- dersler tablosuna veri ekle
INSERT INTO dersler (ders_adi) VALUES
('Matematik'),
('Fizik');

-- notlar tablosuna veri ekle
INSERT INTO notlar (ogrenci_id, ders_id, notu) VALUES
(1, 1, 85),
(1, 2, 90),
(2, 1, 75);

-- --------------------------
-- GÜNCELLEME İŞLEMLERİ
-- --------------------------

-- Öğrenci bilgisi güncelle (ad, soyad, bolum)
UPDATE ogrenciler
SET ad = 'Mehmet', soyad = 'Kaya', bolum = 'Elektrik Muhendisligi'
WHERE ogrenci_id = 1;

-- Not güncelle
UPDATE notlar
SET notu = 95
WHERE not_id = 1;

-- --------------------------
-- SİLME İŞLEMLERİ
-- --------------------------

-- Not kaydını sil
DELETE FROM notlar
WHERE not_id = 3;

-- Öğrenciyi sil (ilgili notlar da silinir çünkü ON DELETE CASCADE var)
DELETE FROM ogrenciler
WHERE ogrenci_id = 2;

-- --------------------------
-- ARAMA İŞLEMLERİ
-- --------------------------

-- İsme göre arama
SELECT * FROM ogrenciler
WHERE ad LIKE '%Ali%';

-- Numaraya göre arama
SELECT * FROM ogrenciler
WHERE numara = '1001';

-- Notu yüksek öğrencileri listele
SELECT o.ad, o.soyad, d.ders_adi, n.notu
FROM notlar n
JOIN ogrenciler o ON o.ogrenci_id = n.ogrenci_id
JOIN dersler d ON d.ders_id = n.ders_id
WHERE n.notu >= 85;