<?php include "db.php"; ?>

<!DOCTYPE html>
<html>
<head>
    <title>BLeague | Matches</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="site-header">
    <nav class="navbar">
        <a class="logo" href="index.php">BLeague</a>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="leaderboard.php">Leaderboard</a></li>
            <li><a class="active" href="matches.php">Matches</a></li>
        </ul>
    </nav>
</header>

<main>
<section class="section">
    <div class="section-heading">
        <h2>Match Results</h2>
    </div>

    <div class="table-wrapper">
        <table>
            <tr>
                <th>Date</th>
                <th>Home Team</th>
                <th>Score</th>
                <th>Away Team</th>
            </tr>

            <?php
            $sql = "
            SELECT 
                m.MatchDate,
                home.TeamsName AS HomeTeam,
                away.TeamsName AS AwayTeam,
                m.HomeScore,
                m.AwayScore
            FROM Matches m
            JOIN Teams home ON m.HomeTeamID = home.TeamID
            JOIN Teams away ON m.AwayTeamID = away.TeamID
            ORDER BY m.MatchDate DESC
            ";

            $result = $conn->query($sql);

            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['MatchDate'] . "</td>";
                echo "<td>" . $row['HomeTeam'] . "</td>";
                echo "<td>" . $row['HomeScore'] . " - " . $row['AwayScore'] . "</td>";
                echo "<td>" . $row['AwayTeam'] . "</td>";
                echo "</tr>";
            }
            ?>
        </table>
    </div>
</section>
</main>

</body>
</html>