<?php
// C:\xampp\htdocs\jaria\includes\header.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/database.php';
require_once __DIR__ . '/settings_helper.php';
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo isset($page_title) ? htmlspecialchars($page_title) : 'JARIA Craft — Kerajinan Perca Panti Asuhan'; ?></title>
    
    <!-- BOOTSTRAP 5 & ICONS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Plus Jakarta Sans', 'Segoe UI', sans-serif;
            background-color: #faf9f5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* EFEK HOVER KARTU PRODUK MEMBESAR & TERANGKAT */
        .card {
            transition: transform 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275), box-shadow 0.3s ease !important;
            cursor: pointer;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.03) !important;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15) !important;
        }

        /* EFEK ZOOM GAMBAR DI DALAM KARTU */
        .card .card-img-top {
            transition: transform 0.4s ease-in-out !important;
        }

        .card:hover .card-img-top {
            transform: scale(1.08) !important;
        }
    </style>
</head>
<body>