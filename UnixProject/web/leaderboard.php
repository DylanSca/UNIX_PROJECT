<?php 
include "db.php";
include "redis.php";

$cacheKey = "leaderboard";

$cachedData = $redis->get($cacheKey);

if ($cachedData) {
    $players = json_decode($cachedData, true);
} 
else {

    $sql = "
    SELECT 
        p.PlayerName,
        p.PlayerPosition,
        p.PointsPerGame,
        p.AssistsPerGame,
        p.ReboundsPerGame,
        t.TeamsName
    FROM Players p
    JOIN Teams t ON p.TeamID = t.TeamID
    ORDER BY p.PointsPerGame DESC
    ";

    $result = $conn->query($sql);

    $players = [];

    while ($row = $result->fetch_assoc()) {
        $players[] = $row;
    }

    /* cache for 60 seconds */
    $redis->setex($cacheKey, 60, json_encode($players));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLeague | Leaderboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="site-header">
    <nav class="navbar">
        <a class="logo" href="index.php">BLeague</a>

        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="index.php#teams">Teams</a></li>
            <li><a class="active" href="leaderboard.php">Leaderboard</a></li>
            <li><a href="matches.php">Matches</a></li>
        </ul>
    </nav>
</header>

<main>

<section class="section">

    <div class="section-heading">
        <h2>Top Players</h2>
    </div>

    <div class="table-wrapper">

        <table>

            <thead>
                <tr>
                    <th>Rank</th>
                    <th>Player</th>
                    <th>Team</th>
                    <th>Position</th>
                    <th>PPG</th>
                    <th>APG</th>
                    <th>RPG</th>
                </tr>
            </thead>

            <tbody>

                <?php

                $rank = 1;

                foreach ($players as $row) {

                    echo "<tr>";

                    echo "<td>" . $rank . "</td>";

                    echo "<td>" . $row['PlayerName'] . "</td>";

                    echo "<td>" . $row['TeamsName'] . "</td>";

                    echo "<td>" . $row['PlayerPosition'] . "</td>";

                    echo "<td>" . $row['PointsPerGame'] . "</td>";

                    echo "<td>" . $row['AssistsPerGame'] . "</td>";

                    echo "<td>" . $row['ReboundsPerGame'] . "</td>";

                    echo "</tr>";

                    $rank++;
                }

                ?>

            </tbody>

        </table>

    </div>

</section>

</main>

<footer>
    <p>&copy; 2005 BLeague</p>
</footer>

</body>
</html>
