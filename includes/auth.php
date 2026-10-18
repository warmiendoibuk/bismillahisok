<?php
// C:\xampp\htdocs\jaria\includes\auth.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function check_admin_login() {
    // Jika tidak ada session admin yang valid, tendang langsung ke halaman login admin
    if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
        header("Location: /jaria/admin/login.php");
        exit;
    }
}