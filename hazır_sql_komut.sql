1. CREATE TABLE  
Tablo oluşturmak için kullanılır.

sql
CREATE TABLE tablo_adi (
    kolon1_tipi,
    kolon2_tipi,
    ...
    PRIMARY KEY (kolon1)
);
---

2. INSERT INTO  
Tabloya veri eklemek için.

sql
INSERT INTO tablo_adi (kolon1, kolon2, ...)
VALUES (deger1, deger2, ...);
---

3. SELECT  
Veri sorgulamak için.

sql
SELECT kolon1, kolon2, ...
FROM tablo_adi
WHERE kosul;
---

4. UPDATE  
Var olan veriyi değiştirmek için.

sql
UPDATE tablo_adi
SET kolon1 = yeni_deger1, kolon2 = yeni_deger2, ...
WHERE kosul;
---

5. DELETE  
Veri silmek için.

sql
DELETE FROM tablo_adi
WHERE kosul;

---

6. ALTER TABLE  
Tablo yapısını değiştirmek için (kolon ekleme, silme vb).

sql
ALTER TABLE tablo_adi
ADD kolon_adi kolon_tipi;

ALTER TABLE tablo_adi
DROP COLUMN kolon_adi;
---

7. DROP TABLE  
Tabloyu tamamen silmek için.

sql
DROP TABLE tablo_adi;
---

8. JOIN  
Birden fazla tabloyu birleştirip sorgulamak için.

sql
SELECT t1.kolon, t2.kolon
FROM tablo1 t1
JOIN tablo2 t2 ON t1.kolon = t2.kolon
WHERE kosul;

---
9. CREATE INDEX  
Tabloda arama hızını artırmak için indeks oluşturma.
---
*10. TRUNCATE TABLE*  
Tablonun tüm verisini hızlıca silmek için (tablo yapısı kalır).

sql
TRUNCATE TABLE tablo_adi;
---
10. Koşullu Seçim (WHERE)
sql
SELECT * FROM tablo_adi
WHERE durum = TRUE;
---
11. Sıralama (ORDER BY)
sql
SELECT * FROM tablo_adi
ORDER BY tarih DESC;

---
12. Sınırlama (LIMIT)
sql
SELECT * FROM tablo_adi
LIMIT 10;