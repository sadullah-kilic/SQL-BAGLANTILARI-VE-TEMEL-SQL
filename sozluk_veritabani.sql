-- 1. Kelimeler Tablosu
CREATE TABLE kelimeler (
    kelime_id INT AUTO_INCREMENT PRIMARY KEY,
    ingilizce VARCHAR(100) NOT NULL UNIQUE,
    turkce VARCHAR(100) NOT NULL
);

-- --------------------------
-- Örnek Veri Ekleme
-- --------------------------

INSERT INTO kelimeler (ingilizce, turkce) VALUES
('apple', 'elma'),
('book', 'kitap'),
('computer', 'bilgisayar');

-- --------------------------
-- Kelime Arama (İngilizce'ye göre)
-- --------------------------

SELECT * FROM kelimeler
WHERE ingilizce LIKE '%app%';

-- --------------------------
-- Kelime Güncelleme
-- --------------------------

UPDATE kelimeler
SET turkce = 'bilgisayar (guncel)'
WHERE ingilizce = 'computer';

-- --------------------------
-- Kelime Silme
-- --------------------------

DELETE FROM kelimeler
WHERE ingilizce = 'book';