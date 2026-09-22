<?php

function connectDB() {
    $host = "localhost";
    $db = "nda_cadet_dossier";
    $user = "root";
    $pass = "";

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Database connection failed: " . $e->getMessage());
    }
}

function getAllCadets() {
    $pdo = connectDB();

    $stmt = $pdo->prepare("
        SELECT id, nda_no, surname, other_names, course, battalion, status
        FROM cadets
        WHERE is_deleted = 0
        ORDER BY nda_no ASC
    ");

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getCadetById($id) {
    $pdo = connectDB();

    $stmt = $pdo->prepare("
        SELECT * FROM cadets WHERE id = ?
    ");
    $stmt->execute([$id]);

    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getCadetPerformance($cadet_id) {
    $pdo = connectDB();

    $stmt = $pdo->prepare("
        SELECT * FROM performance_summary 
        WHERE cadet_id = ?
        ORDER BY academic_year DESC
    ");
    $stmt->execute([$cadet_id]);

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function logAudit($user_id, $action, $table_name, $record_id) {
    $pdo = connectDB();

    $stmt = $pdo->prepare("
        INSERT INTO audit_logs (user_id, action, table_name, record_id)
        VALUES (?, ?, ?, ?)
    ");

    $stmt->execute([$user_id, $action, $table_name, $record_id]);
}