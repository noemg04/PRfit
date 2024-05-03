<?php
// Connect to the database
$host = 'localhost';
$user = 'username';
$password = 'password';
$dbname = 'database_name';
$conn = mysqli_connect($host, $user, $password, $dbname);

// Check the connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the form data
$startingWeight = $_POST['startingWeight'];
$increment = $_POST['increment'];

// Insert the data into the database
$sql = "INSERT INTO values_table (starting_weight, increment) VALUES ('$startingWeight', '$increment')";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

// Close the connection
mysqli_close($conn);
?>
