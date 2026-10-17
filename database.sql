CREATE DATABASE IF NOT EXISTS lms_ead CHARACTER SET utf8mb4;
USE lms_ead;

DROP TABLE IF EXISTS tugas;
DROP TABLE IF EXISTS materi;
DROP TABLE IF EXISTS mata_kuliah;

CREATE TABLE mata_kuliah (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  kode VARCHAR(20) NOT NULL UNIQUE,
  nama VARCHAR(100) NOT NULL,
  dosen VARCHAR(100) NOT NULL,
  semester TINYINT UNSIGNED NOT NULL
) ENGINE=InnoDB;

CREATE TABLE materi (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  mata_kuliah_id INT UNSIGNED NOT NULL,
  judul VARCHAR(150) NOT NULL,
  isi TEXT NOT NULL,
  tautan VARCHAR(255) NOT NULL DEFAULT '',
  FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE tugas (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  mata_kuliah_id INT UNSIGNED NOT NULL,
  judul VARCHAR(150) NOT NULL,
  instruksi TEXT NOT NULL,
  tenggat DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO mata_kuliah (kode, nama, dosen, semester) VALUES
('PAW', 'Pemrograman Aplikasi Web', 'Budi Santoso', 3),
('BD',  'Basis Data', 'Siti Rahma', 2);

INSERT INTO materi (mata_kuliah_id, judul, isi, tautan) VALUES
(1, 'Dasar PHP', 'Variabel, tipe data, dan fungsi dasar PHP.', 'https://www.php.net/manual'),
(2, 'Pengantar SQL', 'Perintah dasar SELECT, INSERT, UPDATE, dan DELETE.', 'https://dev.mysql.com/doc/');

INSERT INTO tugas (mata_kuliah_id, judul, instruksi, tenggat, status) VALUES
(1, 'Latihan CRUD', 'Buat CRUD sederhana dengan PHP dan MySQL.', '2026-11-30', 'Aktif'),
(2, 'Rancang ERD', 'Buat ERD untuk sistem perpustakaan sederhana.', '2026-12-07', 'Draf');