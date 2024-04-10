<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Freak Website</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add your custom CSS styles here */
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Fitness Freak</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <!-- Add more navigation links here if needed -->
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="mb-4">Latest Posts</h2>
        <div class="row">
            <?php
            // Include the database connection file
            include 'database_connect.php';

            // Fetch all posts from the database
            $sql = "SELECT posts.*, users.username FROM posts 
                    INNER JOIN users ON posts.author_id = users.user_id
                    ORDER BY created_at DESC";
            $result = $conn->query($sql);

            // Check if there are posts available
            if ($result->num_rows > 0) {
                // Output data of each row
                while ($row = $result->fetch_assoc()) {
                    ?>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="<?php echo $row['image_url']; ?>" class="card-img-top" alt="Post Image">
                            <div class="card-body">
                                <h5 class="card-title"><?php echo $row['title']; ?></h5>
                                <p class="card-text"><?php echo substr($row['content'], 0, 100); ?>...</p>
                                <a href="#" class="btn btn-primary">Read More</a>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">Posted by <?php echo $row['username']; ?> on <?php echo $row['created_at']; ?></small>
                            </div>
                        </div>
                    </div>
                    <?php
                }
            } else {
                echo "No posts found.";
            }

            // Close database connection
            $conn->close();
            ?>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
