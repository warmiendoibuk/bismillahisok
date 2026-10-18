<?php
// includes/settings_helper.php
if (!isset($pdo)) {
    require_once __DIR__ . '/database.php';
}

function get_site_setting($key, $default = '') {
    global $pdo;
    try {
        $stmt = $pdo->prepare("SELECT setting_value FROM site_settings WHERE setting_key = :key LIMIT 1");
        $stmt->execute(['key' => $key]);
        $res = $stmt->fetchColumn();
        return ($res !== false) ? $res : $default;
    } catch (Exception $e) {
        return $default;
    }
}
?>