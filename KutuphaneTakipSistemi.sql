-- 1. Kitaplar Tablosu
CREATE TABLE kitaplar (
    kitap_id INT AUTO_INCREMENT PRIMARY KEY,
    kitap_adi VARCHAR(100) NOT NULL,
    yazar VARCHAR(50),
    yayin_yili YEAR,
    stok INT DEFAULT 1
);

-- 2. Uyeler Tablosu
CREATE TABLE uyeler (
    uye_id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    telefon VARCHAR(20)
);

-- 3. Odunc Tablosu (Ödünç alma işlemleri)
CREATE TABLE odunc (
    odunc_id INT AUTO_INCREMENT PRIMARY KEY,
    kitap_id INT,
    uye_id INT,
    odunc_tarihi DATE,
    iade_tarihi DATE,
    teslim_edildi BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (kitap_id) REFERENCES kitaplar(kitap_id),
    FOREIGN KEY (uye_id) REFERENCES uyeler(uye_id)
);

-- --------------------------
-- Örnek Veri Ekleme
-- --------------------------

INSERT INTO kitaplar (kitap_adi, yazar, yayin_yili, stok) VALUES
('Suç ve Ceza', 'Fyodor Dostoyevski', 1866, 3),
('Sefiller', 'Victor Hugo', 1862, 2);

INSERT INTO uyeler (ad, soyad, telefon) VALUES
('Ahmet', 'Yilmaz', '5551234567'),
('Ayse', 'Demir', '5559876543');

INSERT INTO odunc (kitap_id, uye_id, odunc_tarihi, teslim_edildi) VALUES
(1, 1, '2025-09-01', FALSE),
(2, 2, '2025-09-05', TRUE);

-- --------------------------
-- Ödünç alınan kitapları listele
-- --------------------------

SELECT o.odunc_id, k.kitap_adi, u.ad, u.soyad, o.odunc_tarihi, o.iade_tarihi, o.teslim_edildi
FROM odunc o
JOIN kitaplar k ON o.kitap_id = k.kitap_id
JOIN uyeler u ON o.uye_id = u.uye_id;

-- --------------------------
-- Kitap stok güncelle (örn: iade edildiğinde)
-- --------------------------

UPDATE kitaplar
SET stok = stok + 1
WHERE kitap_id = 1;

-- --------------------------
-- Üye bilgisi güncelle
-- --------------------------

UPDATE uyeler
SET telefon = '5550000000'
WHERE uye_id = 1;

-- --------------------------
-- Kitap silme (örneğin stokta kalmadıysa)
-- --------------------------

DELETE FROM kitaplar
WHERE kitap_id = 2;