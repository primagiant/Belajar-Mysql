-- Membuat Database Perusahaan
CREATE DATABASE `perusahaan`;

-- Menggunakan Database Perusahaan
USE `perusahaan`;





-- Membuat Table Penempatan
CREATE TABLE `penempatan` (
    `id_penempatan` int PRIMARY KEY,
    `ket_penempatan` varchar(255)
);

-- Memasukkan Data ke Table Penempatan
INSERT INTO `penempatan` VALUES
	(111, "lombok"),
    (222, "jayapura"),
    (333, "jakarta"),
    (444, "solo"),
    (555, "bandung"),
    (666, "bali"),
    (777, "pontianak"),
    (888, "palembang"),
    (999, "surabaya"),
    (1010, "semarang"),
    (2020, "medan"),
    (3030, "malang"),
    (4040, "madura"),
    (5050, "pekalongan"),
    (6060, "aceh"),
    (7070, "bengkulu");





-- Membuat Table Pegawai 
CREATE TABLE `pegawai` (
    `id_pegawai` int PRIMARY KEY auto_increment,
    `nip` varchar(16),
    `nama` varchar(128),
    `tlp` varchar(16),
    `ttl` date,
    `id_jabatan` int,
    `id_divisi` int,
    `gender` int(1),
    `id_penempatan` int
);

-- Menambahkan Data ke Table Pegawai
INSERT INTO `pegawai` VALUES
    ("", "2001", "angelika", "43234234", "2013-09-20", 2, 1, 0, 111),
    ("", "2002", "angel", "43234234", "1999-09-20", 1, 1, 0, 222),
    ("", "2003", "miroso", "43234234", "1999-09-20", 1, 2, 1, 333),
    ("", "2004", "parto", "43234234", "1965-09-20", 1, 1, 1, 444),
    ("", "2005", "asmiranda", "4323342", "1966-09-20", 1, 3, 0, 555),
    ("", "2006", "sinchan", "132123", "2009-09-20", 3, 2, 1, 666),
    ("", "2007", "sailormoon", "98689643", "1998-09-20", 2, 2, 0, 777),
    ("", "2008", "asanti", "12343", "1998-09-20", 3, 3, 0, 888),
    ("", "2009", "gerard", "2341212", "1993-09-20", 2, 3, 1, 999),
    ("", "2010", "amalinda", "43234234", "1992-09-20", 3, 2, 0, 1010),
    ("", "2011", "amaliamunawa", "43234234", "1992-09-20", 3, 1, 0, 2020),
    ("", "2012", "joko", "23412", "1991-07-07", 1, 1, 1, 3030),
    ("", "2013", "widodo", "1234345", "1990-08-08", 2, 2, 1, 4040),
    ("", "2014", "ahok", "333333", "1890-06-03", 3, 3, 1, 5050),
    ("", "2015", "anton", "22222", "1990-01-01", 1, 2, 1, 6060),
    ("", "2016", "mitra", "5656565", "1888-02-05", 3, 1, 1, 7070);






-- Membuat Table Jabatan
CREATE TABLE `jabatan` (
    `id_jabatan` int PRIMARY KEY auto_increment,
    `ket_jabatan` varchar(255)
);

-- Menambahkan Data ke Table Jabatan
INSERT INTO `jabatan` VALUES
    ("", "Direktur"),
    ("", "Wakil Direktur"),
    ("", "Manager Keuangan"),
    ("", "Manager Administrasi");





-- Membuat Table Gaji
CREATE TABLE `gaji` (
    `id_gaji` int PRIMARY KEY auto_increment,
    `jml_gaji` int
);

-- Menambahkan Data ke Table Gaji
INSERT INTO `gaji` VALUES
    ("", 1000000),
    ("", 2200000),
    ("", 2200000),
    ("", 2600000);





-- Membuat Table Divisi 
CREATE TABLE `divisi` (
    `id_divisi` int PRIMARY KEY auto_increment,
    `ket_divisi` varchar(255)
);

-- Menambahkan Data ke Table Divisi
INSERT INTO `divisi` VALUES
    ("", "Training"),
    ("", "Divisi System dan Jaringan"),
    ("", "Divisi Komunikasi"),
    ("", "Divisi Logistik dan Tranportasi");



-- INNER JOIN
SELECT `id_pegawai`, `nip`, `nama`, `tlp`, `ttl`, 
jabatan.`ket_jabatan`, divisi.`ket_divisi`, 
gender, penempatan.`ket_penempatan`, gaji.`jml_gaji`
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN penempatan ON pegawai.`id_penempatan` = penempatan.`id_penempatan`
INNER JOIN gaji ON divisi.`id_divisi` = gaji.`id_gaji`
ORDER BY pegawai.`id_pegawai`;

-- LEFT JOIN
SELECT divisi.`ket_divisi`, pegawai.`nama`
FROM divisi
LEFT JOIN pegawai ON divisi.`id_divisi` = pegawai.`id_divisi`;

-- RIGHT JOIN
SELECT pegawai.`nama`, jabatan.`ket_jabatan` 
FROM pegawai
RIGHT JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`;

-- FULL JOIN
SELECT divisi.`ket_divisi`, pegawai.`nama`
FROM divisi
LEFT JOIN pegawai ON divisi.`id_divisi` = pegawai.`id_divisi`
UNION
SELECT divisi.`ket_divisi`, pegawai.`nama`
FROM divisi
RIGHT JOIN pegawai ON divisi.`id_divisi` = pegawai.`id_divisi`;

-- SELF JOIN
SELECT pegawai.`nama` AS `Nama Pegawai`, jabatan.`ket_jabatan` AS `Jabatan`
FROM pegawai, jabatan
WHERE pegawai.`nama` <> jabatan.`ket_jabatan`
AND pegawai.`id_jabatan` = jabatan.`id_jabatan`
ORDER BY pegawai.`nama`;

-- MULTIPLE JOIN
SELECT `id_pegawai`, `nip`, `nama`, `tlp`, `ttl`, 
jabatan.`ket_jabatan`, divisi.`ket_divisi`, 
gender, penempatan.`ket_penempatan`
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN penempatan ON pegawai.`id_penempatan` = penempatan.`id_penempatan`;


-- 1
SELECT jabatan.ket_jabatan, gaji.jml_gaji
FROM jabatan
INNER JOIN gaji ON jabatan.id_jabatan = gaji.id_gaji;

-- 2
SELECT pegawai.`nama` AS `Nama Pegawai`,
divisi.`ket_divisi` AS `Divisi`, 
jabatan.`ket_jabatan` AS `Jabatan`,
gaji.`jml_gaji` AS `Gaji`
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN gaji ON jabatan.`id_jabatan` = gaji.`id_gaji`
ORDER BY gaji.`jml_gaji` ASC;

-- 3
SELECT pegawai.nama, divisi.ket_divisi, jabatan.ket_jabatan
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN gaji ON jabatan.`id_jabatan` = gaji.`id_gaji`
WHERE jml_gaji = 2600000
UNION
SELECT pegawai.nama, divisi.ket_divisi, jabatan.ket_jabatan
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN gaji ON jabatan.`id_jabatan` = gaji.`id_gaji`
WHERE jml_gaji = 2200000;


-- 4
FROM

-- 5
SELECT pegawai.nama, divisi.ket_divisi, jabatan.ket_jabatan
FROM pegawai
INNER JOIN jabatan ON pegawai.`id_jabatan` = jabatan.`id_jabatan`
INNER JOIN divisi ON pegawai.`id_divisi` = divisi.`id_divisi`
INNER JOIN gaji ON jabatan.`id_jabatan` = gaji.`id_gaji`


SELECT DATEDIFF('2021-05-03', '2002-03-12') /365 AS Age;