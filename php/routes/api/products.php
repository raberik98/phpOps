<?php
if ($METHOD == "GET") {
    header('Content-Type: application/json');

    echo json_encode([
        ['name' => 'Laptop', 'description' => 'High-performance laptop', 'price' => 999.99, 'stock' => 50],
        ['name' => 'Phone', 'description' => 'Latest smartphone model', 'price' => 499.99, 'stock' => 100],
        ['name' => 'Tablet', 'description' => '10-inch touchscreen tablet', 'price' => 299.99, 'stock' => 75],
        ['name' => 'Headphones', 'description' => 'Noise-cancelling wireless headphones', 'price' => 199.99, 'stock' => 200],
        ['name' => 'Smartwatch', 'description' => 'Fitness tracking smartwatch', 'price' => 149.99, 'stock' => 120],
        ['name' => 'Camera', 'description' => '4K digital camera', 'price' => 799.99, 'stock' => 30],
        ['name' => 'Speaker', 'description' => 'Bluetooth portable speaker', 'price' => 89.99, 'stock' => 150],
        ['name' => 'Monitor', 'description' => '27-inch 4K monitor', 'price' => 349.99, 'stock' => 60],
        ['name' => 'Keyboard', 'description' => 'Mechanical RGB keyboard', 'price' => 129.99, 'stock' => 80],
        ['name' => 'Mouse', 'description' => 'Wireless gaming mouse', 'price' => 59.99, 'stock' => 90]
    ]);
}

