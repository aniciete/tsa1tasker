<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Tasker Profile</title>
    <meta name="description" content="Your personal task management assistant">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- STYLES -->
    <link rel="stylesheet" href="<?= base_url('style.css') ?>">

</head>

<body>

    <!-- HEADER: MENU + HEROE SECTION -->
    <header>
        <div class="menu">
            <ul>
                <li class="menu-item hidden"><a href="<?= base_url() ?>">Welcome</a></li>
                <li class="menu-item hidden"><a href="<?= base_url('about') ?>">About</a></li>
                <li class="menu-item hidden"><a href="<?= base_url('profile') ?>">Profile</a></li>
                <li class="menu-item hidden"><a href="<?= base_url('tasks') ?>">Tasks</a></li>
            </ul>
        </div>

        <div class="heroe">

            <h1>Profile</h1>

            <h2>Hi, <?= esc($username) ?>!</h2>

            <h3>ID: <?= esc($id) ?></h3>
            <h3>Full name: <?= esc($full_name) ?></h3>
            <h3>Email: <?= esc($email) ?></h3>
            <h3>Created at: <?= esc($created_at) ?></h3>

        </div>

    </header>

    <!-- CONTENT -->

    <section>

        <p>Demo user profile.</p>

    </section>

    <!-- FOOTER -->

    <footer>

        <div class="copyrights">

            <p>&copy; <?= date('Y') ?> Tasker. All rights reserved.</p>

        </div>

    </footer>

    <!-- SCRIPTS -->

    <script {csp-script-nonce}>
        document.getElementById("menuToggle").addEventListener('click', toggleMenu);
        function toggleMenu() {
            var menuItems = document.getElementsByClassName('menu-item');
            for (var i = 0; i < menuItems.length; i++) {
                var menuItem = menuItems[i];
                menuItem.classList.toggle("hidden");
            }
        }
    </script>

    <!-- -->

</body>

</html>