<?php

$METHOD = $_SERVER['REQUEST_METHOD'];
$URI = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

switch ($URI) {
    case '/':
        $title = 'home';
        include './layouts/layout.php';
        include './routes/pages/home.php';
        include './layouts/layout_end.php';
        break;
    case '/api/products':
        include './routes/api/products.php';
        break;
    default:
        $title = '404';
        include './layouts/layout.php';
        include './routes/404.php';
        include './layouts/layout_end.php';
        break;
}