<?php include "db.php"; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BLeague | Home</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header class="site-header">
    <nav class="navbar">
        <a class="logo" href="index.php">BLeague</a>

        <ul class="nav-links">
            <li><a class="active" href="index.php">Home</a></li>
            <li><a href="#teams">Teams</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="leaderboard.php">Leaderboard</a></li>
            <li><a href="matches.php">Matches</a></li>
        </ul>
    </nav>
</header>

<main>

    <section class="hero">
        <div class="hero-content">
            <p>Basketball Association</p>

            <h1>Welcome to BLeague</h1>

            <p>
                BLeague is a basketball league founded in 2005 by John Paul.
                It was created to develop players and help them reach a professional level.
            </p>

            <div class="hero-buttons">
                <a class="button primary" href="#teams">View Teams</a>
                <a class="button secondary" href="leaderboard.php">View Leaderboard</a>
            </div>
        </div>

        <div class="hero-card">
            <h2>League Stats</h2>

            <div class="stats-grid">
                <div><strong>10</strong><span>Teams</span></div>
                <div><strong>50+</strong><span>Players</span></div>
            </div>
        </div>
    </section>

    

    <section id="teams" class="section alt-section">

        <div class="section-heading">
            <h2>Teams</h2>
        </div>

        <div class="card-grid">

            <?php

            $sql = "SELECT * FROM Teams";
            $result = $conn->query($sql);

            while ($row = $result->fetch_assoc()) {

                $image = strtolower(str_replace(" ", "", $row['TeamsName'])) . ".png";

                echo "<div class='team-card'>";

                echo "<img src='images/$image' alt='" . $row['TeamsName'] . "' class='team-logo'>";

                echo "<h3>
                        <a href='team.php?id=" . $row['TeamID'] . "'>
                            " . $row['TeamsName'] . "
                        </a>
                      </h3>";

                echo "<p><strong>City:</strong> " . $row['City'] . "</p>";

                echo "<p><strong>Coach:</strong> " . $row['CoachName'] . "</p>";

                echo "<p><strong>Founded:</strong> " . $row['FoundedYear'] . "</p>";

                echo "</div>";
            }

            ?>

        </div>

    </section>

    <section id="about" class="section alt-section">
        <div class="section-heading">
            <p class="eyebrow">BLeague Overview</p>
            <h2>About the League</h2>
        </div>

        <p class="overviewPara">
            BLeague gives fans access to team information, player statistics,
            and leaderboard rankings. All data is retrieved from a MariaDB database.
        </p>
    </section>

</main>

<footer class="footer">
    <p>&copy; 2005 BLeague</p>
</footer>

</body>
</html>