1) Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.
	
SELECT ograd, ogrsoyad, i.atarih  From ogrenci as o, islem as i
where o.ogrno = i.ogrno

	
	2) Fıkra ve hikaye türündeki kitapların adını ve türünü listeleyin.
	
    SELECT k.kitapadi, t.turadi from kitap as k, tur as t 
WHERE k.turno = t.turno AND
t.turadi IN ("Fıkra", "Hikaye")
	
	3) 10B veya 10C sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları listeleyin.
    
    SELECT o.ograd, o.ogrno, o.ogrsoyad, k.kitapadi, o.sinif FROM ogrenci as o, islem as i, kitap as k
WHERE o.ogrno =i.ogrno AND i.kitapno = k.kitapno AND
o.sinif IN ("10B", "10C")
ORDER BY ograd, ogrsoyad

	
	#join ile yazın
	4) Öğrencinin adını, soyadını ve kitap aldığı tarihleri listeleyin.
	
    SELECT o.ograd, o.ogrsoyad, i.atarih FROM ogrenci as o
INNER JOIN islem as i 
ON o.ogrno = i.ogrno
ORDER BY i.atarih desc

	
	5) Fıkra ve hikaye türündeki kitapların adını ve türünü listeleyin.
	
     SELECT k.kitapadi, t.turadi FROM kitap as k
INNER JOIN tur as t
ON k.turno= t.turno
WHERE t.turadi IN ("Fıkra", "Hikaye")

	
	6) 10B veya 10C sınıfındaki öğrencilerin numarasını, adını, soyadını ve okuduğu kitapları, öğrenci adına göre listeleyin.
	
     SELECT o.ogrno, o.ograd, o.ogrsoyad, k.kitapadi FROM ogrenci as o
INNER JOIN islem as i
ON o.ogrno = i.ogrno
INNER JOIN kitap as k
ON i.kitapno = k.kitapno
WHERE o.sinif IN ("10B", "10C")
ORDER BY o.ograd

	
	7) Kitap alan öğrencinin adı, soyadı, kitap aldığı tarih listelensin. Kitap almayan öğrencilerinde listede görünsün.

	SELECT o.ograd, o.ogrsoyad, i.atarih FROM ogrenci as o
LEFT JOIN islem as i
ON o.ogrno = i.ogrno 
	
	8) Kitap almayan öğrencileri listeleyin.
	SELECT * From ogrenci WHERE ogrno NOT IN (select ogrno from islem)
	
	9) Alınan kitapların kitap numarasını, adını ve kaç defa alındığını kitap numaralarına göre artan sırada listeleyiniz.
	
	SELECT k.kitapno, k.kitapadi, count(i.kitapno) FROM kitap as k
JOIN islem as i
ON i.kitapno =k.kitapno 
GROUP BY k.kitapno, k.kitapadi
ORDER BY k.kitapno ASC

	10) Alınan kitapların kitap numarasını, adını kaç defa alındığını (alınmayan kitapların yanında 0 olsun) listeleyin.
SELECT k.kitapno, k.kitapadi, count(i.kitapno) FROM kitap as k
LEFT JOIN islem as i
ON i.kitapno =k.kitapno 
GROUP BY k.kitapno, k.kitapadi
ORDER BY k.kitapno ASC

	11) Öğrencilerin adı soyadı ve aldıkları kitabın adı listelensin.
	
	
SELECT o.ograd, o.ogrsoyad, k.kitapadi from ogrenci as o
INNER JOIN islem as i
ON  o.ogrno = i.ogrno
INNER JOIN kitap as k
ON i.kitapno= k.kitapno
ORDER BY ograd, ogrsoyad

	12) Her öğrencinin adı, soyadı, kitabın adı, yazarın adı soyad ve kitabın türünü ve kitabın alındığı tarihi listeleyiniz. Kitap almayan öğrenciler de listede görünsün.
	SELECT o.ograd, o.ogrsoyad, k.kitapadi, y.yazarad, y.yazarsoyad, t.turadi, t.turno, i.atarih FROM ogrenci as o
LEFT JOIN islem as i ON o.ogrno = i.ogrno
LEFT JOIN kitap as k ON i.kitapno = k.kitapno
LEFT JOIN yazar as y ON k.yazarno = y.yazarno
LEFT JOIN tur as t ON k.turno = t.turno
ORDER BY k.kitapadi

	
	13) 10A veya 10B sınıfındaki öğrencilerin adı soyadı ve okuduğu kitap sayısını getirin.
	
    Select ograd, ogrsoyad, count(i.ogrno) as kitap_sayisi from ogrenci as o
INNER JOIN islem as i
ON  o.ogrno = i.ogrno 
WHERE o.sinif IN ("10A","10B")
GROUP BY ograd, ogrsoyad
ORDER BY kitap_sayisi DESC
	
	14) Tüm kitapların ortalama sayfa sayısını bulunuz.

	SELECT avg(sayfasayisi) FROM kitap
	
	15) Sayfa sayısı ortalama sayfanın üzerindeki kitapları listeleyin.
	
    SELECT * FROM kitap 
WHERE sayfasayisi > (SELECT avg(sayfasayisi) FROM kitap)


	
	16) Öğrenci tablosundaki öğrenci sayısını gösterin
	select count(*) from ogrenci
	
	17) Öğrenci tablosundaki toplam öğrenci sayısını toplam sayı takma(alias kullanımı) adı ile listeleyin.
	
	select count(*) as "Toplam Sayı " from ogrenci

	18) Öğrenci tablosunda kaç farklı isimde öğrenci olduğunu listeleyiniz.
	
	select count(DISTINCT ograd) as "Toplam Sayı " from ogrenci

	19) En fazla sayfa sayısı olan kitabın sayfa sayısını listeleyiniz.
	
	SELECT max(sayfasayisi) as sayfa_sayisi from kitap


	20) En fazla sayfası olan kitabın adını ve sayfa sayısını listeleyiniz.
	
    SELECT k.kitapadi, k.sayfasayisi FROM kitap as k
    where k.sayfasayisi = (select max(sayfasayisi) from kitap)
	
	21) En az sayfa sayısı olan kitabın sayfa sayısını listeleyiniz.
	SELECT min(sayfasayisi) as sayfa_sayisi from kitap
	
	22) En az sayfası olan kitabın adını ve sayfa sayısını listeleyiniz.
	SELECT k.kitapadi, k.sayfasayisi FROM kitap as k
    where k.sayfasayisi = (select min(sayfasayisi) from kitap)
	
	23) Dram türündeki en fazla sayfası olan kitabın sayfa sayısını bulunuz.
	
	
	24) numarası 15 olan öğrencinin okuduğu toplam sayfa sayısını bulunuz.
	
	SELECT sum(k.sayfasayisi) From kitap as k 
JOIN islem as i 
ON i.kitapno = k.kitapno
WHERE i.ogrno = 15

	25) İsme göre öğrenci sayılarının adedini bulunuz.(Örn: ali 5 tane, ahmet 8 tane )

select ograd, COUNT(ogrno) from ogrenci GROUP BY ograd

	
	26) Her sınıftaki öğrenci sayısını bulunuz.
	
	select count(ogrno), sinif from ogrenci GROUP by sinif
	27) Her sınıftaki erkek ve kız öğrenci sayısını bulunuz.
	
	select count(ogrno) as toplam_ogrenci, cinsiyet, sinif from ogrenci WHERE cinsiyet IN ("K", "E") GROUP by sinif, cinsiyet
     
	28) Her öğrencinin adını, soyadını ve okuduğu toplam sayfa sayısını büyükten küçüğe doğru listeleyiniz.

	Select o.ograd, o.ogrsoyad, sum(k.sayfasayisi) as okunan_sayfa from ogrenci as o
INNER JOIN islem as i
ON o.ogrno = i.ogrno
INNER JOIN kitap as k
ON i.kitapno = k.kitapno
GROUP BY o.ograd, o.ogrsoyad
ORDER BY okunan_sayfa DESC
 
	
	29) Her öğrencinin okuduğu kitap sayısını getiriniz.

    select o.ograd, ogrsoyad, count(i.islemno) as "okuduguKitapSayisi" FROM ogrenci as o INNER JOIN  islem as i ON o.ogrno = i.ogrno GROUP BY o.ograd, o.ogrsoyad 
ORDER BY okuduguKitapSayisi DESC