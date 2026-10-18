<?php
// C:\xampp\htdocs\jaria\includes\navbar.php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/database.php';
require_once __DIR__ . '/settings_helper.php';

$current_page = basename($_SERVER['PHP_SELF']);

// Hitung Item Keranjang Belanja
$cart_count = 0;
if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $item) {
        $cart_count += (is_array($item) ? ($item['quantity'] ?? 1) : (int)$item);
    }
}

// Ambil Logo
$site_logo = get_site_setting('site_logo', 'assets/images/logo.png');

// Ambil Menu Navbar Dinamis dari Database
$nav_menus = [];
try {
    $stmt_nav = $pdo->query("SELECT * FROM navbar_menu ORDER BY sort_order ASC, id ASC");
    $nav_menus = $stmt_nav->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $nav_menus = [];
}
?>
<style>
    .navbar-brand-img { 
        height: 36px; 
        object-fit: contain; 
        transition: transform 0.3s ease;
    }
    .navbar-brand:hover .navbar-brand-img {
        transform: scale(1.1) rotate(-3deg);
    }
    
    .custom-navbar {
        background-color: #ffffff !important;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        padding-top: 0.75rem !important;
        padding-bottom: 0.75rem !important;
        transition: all 0.3s ease;
    }

    .brand-title {
        font-size: 1.35rem;
        font-weight: 800;
        color: #1f2937;
        letter-spacing: -0.02em;
        line-height: 1;
    }

    .badge-craft-pill {
        background: linear-gradient(135deg, #0d6efd, #0b5ed7) !important;
        color: #ffffff !important;
        font-size: 0.78rem;
        font-weight: 700;
        padding: 0.35em 0.8em;
        border-radius: 50rem !important;
        box-shadow: 0 4px 10px rgba(13, 110, 253, 0.25);
    }

    /* MENU NAVIGASI DENGAN ANIMASI HOVER UNDERLINE */
    .custom-navbar .nav-link {
        font-weight: 600;
        color: #4b5563;
        padding: 0.4rem 0.85rem !important;
        position: relative;
        transition: color 0.3s ease;
        font-size: 0.92rem;
    }

    .custom-navbar .nav-link::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2.5px;
        bottom: 0;
        left: 50%;
        background-color: #0d6efd;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        transform: translateX(-50%);
        border-radius: 2px;
    }

    .custom-navbar .nav-link:hover,
    .custom-navbar .nav-link.active {
        color: #0d6efd !important;
        font-weight: 700;
    }

    .custom-navbar .nav-link:hover::after,
    .custom-navbar .nav-link.active::after {
        width: 70%;
    }

    /* TOMBOL KERANJANG HOVER GLOWING */
    .btn-cart-blue {
        background: linear-gradient(135deg, #0d6efd, #0052cc) !important;
        color: #ffffff !important;
        border-radius: 50rem !important;
        padding: 0.45rem 1.35rem !important;
        font-weight: 700;
        font-size: 0.88rem;
        border: none;
        box-shadow: 0 4px 15px rgba(13, 110, 253, 0.3);
        transition: all 0.3s ease;
    }

    .btn-cart-blue:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(13, 110, 253, 0.45) !important;
        color: #ffffff !important;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light custom-navbar sticky-top">
    <div class="container">
        <!-- LOGO BRAND DINAMIS -->
        <a class="navbar-brand d-flex align-items-center gap-2 m-0 p-0" href="index.php">
            <img src="<?php echo htmlspecialchars($site_logo); ?>" alt="JARIA Logo" class="navbar-brand-img" onerror="this.src='assets/images/logo.png'">
            <span class="brand-title">JARIA</span> 
            <span class="badge badge-craft-pill">Craft</span>
        </a>

        <button class="navbar-toggler border-0 shadow-none p-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- MENU NAVIGASI DINAMIS DARI DATABASE -->
            <ul class="navbar-nav mx-auto align-items-center gap-1 my-3 my-lg-0">
                <?php if (!empty($nav_menus)): ?>
                    <?php foreach ($nav_menus as $menu): 
                        $is_active = ($current_page === $menu['url']);
                    ?>
                        <li class="nav-item">
                            <a class="nav-link <?php echo $is_active ? 'active' : ''; ?>" href="<?php echo htmlspecialchars($menu['url']); ?>">
                                <?php echo htmlspecialchars($menu['title']); ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                <?php else: ?>
                    <li class="nav-item"><a class="nav-link <?php echo ($current_page === 'index.php') ? 'active' : ''; ?>" href="index.php">Beranda</a></li>
                    <li class="nav-item"><a class="nav-link <?php echo ($current_page === 'catalog.php') ? 'active' : ''; ?>" href="catalog.php">Katalog Produk</a></li>
                    <li class="nav-item"><a class="nav-link <?php echo ($current_page === 'about.php') ? 'active' : ''; ?>" href="about.php">Kisah Kami</a></li>
                <?php endif; ?>
            </ul>

            <!-- TOMBOL KERANJANG KANAN -->
            <a href="cart.php" class="btn btn-cart-blue d-inline-flex align-items-center gap-2 text-decoration-none">
                <i class="bi bi-cart3 fs-6"></i>
                <span>Keranjang</span>
                <?php if ($cart_count > 0): ?>
                    <span class="badge bg-white text-primary rounded-circle ms-1" style="color: #0d6efd !important; font-size: 0.72rem; padding: 0.3em 0.6em;">
                        <?php echo $cart_count; ?>
                    </span>
                <?php endif; ?>
            </a>
        </div>
    </div>
</nav>