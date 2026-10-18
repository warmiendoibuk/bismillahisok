<?php
// C:\xampp\htdocs\jaria\includes\functions.php

// Format angka ke Rupiah
function format_rupiah($angka) {
    return "Rp " . number_format($angka, 0, ',', '.');
}

// Format tanggal Indonesia
function format_tanggal($tanggal) {
    return date('d M Y', strtotime($tanggal));
}

// Pembersih input (Anti-XSS)
function sanitize($data) {
    return htmlspecialchars(trim($data), ENT_QUOTES, 'UTF-8');
}