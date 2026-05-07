<?php
include "db.php";

if (!isset($_GET['id'])) {
    die("No team selected.");
}

$teamID = intval($_GET['id']);

$teamSql = "SELECT * FROM Teams WHERE TeamID = $teamID";
$teamResult = $conn->query($teamSql);

if ($teamResult->num_rows == 0) {
    die("Team not found.");
}

$team = $teamResult->fetch_assoc();

$image = strtolower(str_replace(" ", "", $team['TeamsName'])) . ".png";
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo $team['TeamsName']; ?></title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="site-header">
    <nav class="navbar">
        <a class="logo" href="index.php">BLeague</a>
        <ul class="nav-links">
            <li><a href="index.php">Home</a></li>
            <li><a href="leaderboard.php">Leaderboard</a></li>
            <li><a href="matches.php">Matches</a></li>
        </ul>
    </nav>
</header>

<main>
<section class="section">
    <div class="team-card">
        <h1><?php echo $team['TeamsName']; ?></h1>

        <img src="images/<?php echo $image; ?>" class="team-logo-large">

        <p><strong>City:</strong> <?php echo $team['City']; ?></p>
        <p><strong>Coach:</strong> <?php echo $team['CoachName']; ?></p>
        <p><strong>Founded:</strong> <?php echo $team['FoundedYear']; ?></p>
    </div>

    <h2>Players</h2>

    <div class="table-wrapper">
        <table>
            <tr>
                <th>Player</th>
                <th>Position</th>
                <th>Jersey</th>
                <th>PPG</th>
                <th>APG</th>
                <th>RPG</th>
            </tr>

            <?php
            $playerSql = "
            SELECT * FROM Players 
            WHERE TeamID = $teamID
            ORDER BY PointsPerGame DESC
            ";

            $players = $conn->query($playerSql);

            while ($row = $players->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['PlayerName'] . "</td>";
                echo "<td>" . $row['PlayerPosition'] . "</td>";
                echo "<td>" . $row['JerseyNumber'] . "</td>";
                echo "<td>" . $row['PointsPerGame'] . "</td>";
                echo "<td>" . $row['AssistsPerGame'] . "</td>";
                echo "<td>" . $row['ReboundsPerGame'] . "</td>";
                echo "</tr>";
            }
            ?>
        </table>
    </div>
</section>
</main>

</body>
</html>
