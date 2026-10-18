<?php
// C:\xampp\htdocs\jaria\includes\database.php

$host     = 'localhost';
$db_name  = 'jaria_db';
$username = 'root';
$password = ''; // Default XAMPP password kosong
$charset  = 'utf8mb4';

$dsn = "mysql:host={$host};dbname={$db_name};charset={$charset}";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Lempar exception jika ada error SQL
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Hasil query otomatis berupa array asosiatif
    PDO::ATTR_EMULATE_PREPARES   => false,                  // Gunakan prepared statements asli untuk keamanan SQL Injection
];

try {
    $pdo = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    // Tampilkan pesan kesalahan sederhana saat pengembangan
    die("Koneksi Database Gagal: " . $e->getMessage());
}