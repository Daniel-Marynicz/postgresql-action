<?php

declare(strict_types=1);

function getDsn(string $dbName)
{
    return sprintf( 'pgsql:host=localhost;port=5432;dbname=%s', $dbName);

}

$databases = [
    'app',
    'app2',
    'app3',
    'app4'
];
foreach ($databases as $dbName) {
    $dsn = getDsn($dbName);
    $pdo = new \PDO($dsn, 'app', 'develop');
    $pdo->exec('SELECT 1');
}
