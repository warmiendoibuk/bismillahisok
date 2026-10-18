<?php
// C:\xampp\htdocs\jaria\includes\footer.php
require_once __DIR__ . '/database.php';
require_once __DIR__ . '/settings_helper.php';

// Ambil Informasi Footer & Kontak dari Database
$footer_about    = get_site_setting('footer_about_text', 'Wirausaha sosial pemberdayaan santri Panti Asuhan Al-Jihad Surabaya menyulap kain perca menjadi kerajinan bernilai tinggi.');
$footer_phone    = get_site_setting('footer_phone', '+62 812-3456-7890');
$footer_email    = get_site_setting('footer_email', 'info@jariacraft.com');
$footer_address  = get_site_setting('footer_address', 'Panti Asuhan Al-Jihad, Surabaya, Jawa Timur');
$footer_copy     = get_site_setting('footer_copyright_text', 'JARIA Craft (Jahit Ceria) — Panti Asuhan Al-Jihad Surabaya.');
$footer_subtext  = get_site_setting('footer_subtext', 'Proyek Kewirausahaan Sosial | Mahasiswa Ilmu Komunikasi E1 Semester 5 UIN Sunan Ampel Surabaya');

// Format Nomor WhatsApp untuk URL Direct wa.me
$clean_phone = preg_replace('/[^0-9]/', '', $footer_phone);
if (strpos($clean_phone, '0') === 0) {
    $clean_phone = '62' . substr($clean_phone, 1);
}

// Link Google Maps Panti Asuhan Al-Jihad
$maps_url = "https://www.google.com/maps/dir//Yayasan+Al-Jihad+Surabaya,+Jl.+Jemursari+Utara+III+No.9,+Jemur+Wonosari,+Kec.+Wonocolo,+Surabaya,+Jawa+Timur+60237/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x2dd7fb6b0870bb89:0x59664e65a3277c0f?sa=X&ved=1t:57443&ictx=111";

// Ambil Link Footer Dinamis dari Database
$footer_links = [];
try {
    $stmt_fl = $pdo->query("SELECT section_name, id, title, url, sort_order FROM footer_links ORDER BY section_name ASC, sort_order ASC, id ASC");
    $footer_links = $stmt_fl->fetchAll(PDO::FETCH_GROUP | PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $footer_links = [];
}
?>
<style>
    .footer-custom {
        background-color: #0f172a !important;
        color: #94a3b8 !important;
        border-top: 1px solid rgba(255, 255, 255, 0.1);
        margin-top: auto;
    }
    .footer-title {
        color: #ffffff !important;
        font-weight: 700;
        margin-bottom: 1.25rem;
        font-size: 1.05rem;
        text-decoration: none;
        display: inline-block;
    }
    .footer-title:hover {
        color: #38bdf8 !important;
    }
    .footer-link {
        color: #94a3b8 !important;
        text-decoration: none;
        transition: all 0.25s ease;
        display: inline-block;
        margin-bottom: 0.5rem;
    }
    .footer-link:hover {
        color: #38bdf8 !important;
        transform: translateX(5px);
    }
    .footer-contact-link {
        color: #94a3b8 !important;
        text-decoration: none;
        transition: color 0.2s ease;
    }
    .footer-contact-link:hover {
        color: #38bdf8 !important;
        text-decoration: underline;
    }
</style>

<footer class="footer-custom pt-5 pb-4 mt-5">
    <div class="container">
        <div class="row g-4 mb-4">
            <!-- 1. TENTANG & KONTAK (SEBELAH KIRI) -->
            <div class="col-lg-5 col-md-6">
                <h5>
                    <a href="about.php" class="footer-title">JARIA Craft</a>
                </h5>
                <p class="small leading-relaxed text-secondary mb-3" style="max-width: 420px;">
                    <?php echo htmlspecialchars($footer_about); ?>
                </p>
                <div class="small text-secondary">
                    <p class="mb-2">
                        <i class="bi bi-geo-alt-fill text-primary me-2"></i>
                        <a href="<?php echo htmlspecialchars($maps_url); ?>" target="_blank" rel="noopener noreferrer" class="footer-contact-link">
                            <?php echo htmlspecialchars($footer_address); ?>
                        </a>
                    </p>
                    <p class="mb-2">
                        <i class="bi bi-whatsapp text-success me-2"></i>
                        <a href="https://wa.me/<?php echo $clean_phone; ?>?text=Halo%20JARIA%20Craft,%20saya%20ingin%20bertanya%20mengenai%20produk%20kerajinan" target="_blank" rel="noopener noreferrer" class="footer-contact-link">
                            <?php echo htmlspecialchars($footer_phone); ?>
                        </a>
                    </p>
                    <p class="mb-0">
                        <i class="bi bi-envelope-fill text-warning me-2"></i>
                        <a href="mailto:<?php echo htmlspecialchars($footer_email); ?>" class="footer-contact-link">
                            <?php echo htmlspecialchars($footer_email); ?>
                        </a>
                    </p>
                </div>
            </div>

            <!-- 2. NAVIGASI DINAMIS DARI DATABASE -->
            <div class="col-lg-7 col-md-6">
                <?php if (!empty($footer_links)): ?>
                    <div class="row g-3">
                        <?php foreach ($footer_links as $section_name => $links): ?>
                            <div class="col-6 col-sm-4">
                                <h5 class="footer-title"><?php echo htmlspecialchars($section_name); ?></h5>
                                <ul class="list-unstyled small mb-0">
                                    <?php foreach ($links as $fl): ?>
                                        <li>
                                            <a href="<?php echo htmlspecialchars($fl['url']); ?>" class="footer-link">
                                                &rsaquo; <?php echo htmlspecialchars($fl['title']); ?>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <!-- FALLBACK JIKA DATABASE KOSONG -->
                    <h5 class="footer-title">Navigasi Utama</h5>
                    <div class="row g-2">
                        <div class="col-6 col-sm-4">
                            <ul class="list-unstyled small mb-0">
                                <li><a href="index.php" class="footer-link">&rsaquo; Beranda</a></li>
                                <li><a href="catalog.php" class="footer-link">&rsaquo; Katalog Produk</a></li>
                                <li><a href="about.php" class="footer-link">&rsaquo; Kisah Kami</a></li>
                            </ul>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>

        <hr class="border-secondary opacity-25 my-4">

        <!-- 3. COPYRIGHT FOOTER -->
        <div class="text-center small">
            <p class="mb-1 text-light">&copy; <?php echo date('Y'); ?> <strong><?php echo htmlspecialchars($footer_copy); ?></strong></p>
            <span class="text-secondary opacity-75"><?php echo htmlspecialchars($footer_subtext); ?></span>
        </div>
    </div>
</footer>