<?php
require_once 'functions.php';

$cadets = getAllCadets();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>NDA Cadet Dossier System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">

<div class="container mt-5">
    <h2 class="mb-4">Cadet Dossier Dashboard</h2>

    <input type="text" id="searchInput" class="form-control mb-3" placeholder="Search cadet...">

    <table class="table table-dark table-hover">
        <thead>
            <tr>
                <th>NDA No</th>
                <th>Name</th>
                <th>Course</th>
                <th>Battalion</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody id="cadetTable">
            <?php foreach ($cadets as $cadet): ?>
                <tr>
                    <td><?= $cadet['nda_no'] ?></td>
                    <td><?= $cadet['surname'] . " " . $cadet['other_names'] ?></td>
                    <td><?= $cadet['course'] ?></td>
                    <td><?= $cadet['battalion'] ?></td>
                    <td><?= $cadet['status'] ?></td>
                    <td>
                        <button class="btn btn-sm btn-primary viewBtn" data-id="<?= $cadet['id'] ?>">
                            View
                        </button>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<script src="assets/js/app.js"></script>
</body>
</html>