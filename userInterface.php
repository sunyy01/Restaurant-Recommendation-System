<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recommendation System UI Page</title>
    <style>
        /* Center align all text */
        body {
            text-align: center;
            background-image: url('image.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: 'Comic Sans MS', cursive;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 250%;
            background-color: rgba(255, 255, 255, 0.7); /* 50% opacity white */
            z-index: -1;
        }

        /* Improve input field visibility */
        input[type="text"],
        input[type="password"] {
            padding: 12px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        /* Highlight input fields when selected */
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #ff9baf;
            outline: none;
        }

        /* Add some space between form elements */
        .form-element {
            margin-bottom: 10px;
        }

        /* Remove default form button styles */
        input[type="submit"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            background-color: #ff9baf;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            z-index: 2;
        }

        /* Change form button background color on hover */
        input[type="submit"]:hover {
            background-color: #ff5b5b;
        }

        table {
            position: relative;
            z-index: 1;
            width: 100%;
            min-width: 300px; /* set a minimum width for the table */
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
            margin-top: 50px; /* add some margin to separate the table from the form */
        }

        /* Style the table header */
        th {
            background-color: #ff9baf;
            color: #fff;
            font-weight: bold;
            padding: 10px;
            text-align: left;
        }

        /* Style the table cells */
        td {
            font-size: 16px;
            padding: 8px;
            border-bottom: 1px solid #ccc;
        }
        </style>
</head>
<div class="container">
    <h1>Find The Restaurant of your choice!</h1>
    <!--Using Selection-->
    <h2>Search Restaurant by Location</h2>
    <form method="GET" action="userInterface.php">
        <input type="hidden" id="searchRestaurantByLocation" name="searchRestaurantByLocation">
        Which Location are you interested in (capital the inital letter): 
        <select name="Location">
            <option value="Downtown">Downtown</option>
            <option value="Kitsilano">Kitsilano</option>
            <option value="West End">West End</option>
            <option value="Yaletown">Yaletown</option>
            <option value="Gastown">Gastown</option>
        </select>
        <p><input type="submit" value="Let's go" name="search"></p>
    </form>

    <hr />

    <!--Using Join-->
    <h2>Search Restaurant by Dish Style</h2>
    <form method="GET" action="userInterface.php">
        <input type="hidden" id="searchRestaurantByDishStyle" name="searchRestaurantByDishStyle">
        Which dish style are you interested in (capital the inital letter): 
        <select name="DishStyle">
            <option value="Chinese">Chinese</option>
            <option value="Italian">Italian</option>
            <option value="Mexican">Mexican</option>
            <option value="Japanese">Japanese</option>
            <option value="American">American</option>
        </select> 
        <p><input type="submit" value="Let's go" name="search"></p>
    </form>

    <hr />

    <!--Using Projection-->
    <h2>Search Restaurant by Type</h2>
    <form method="GET" action="userInterface.php">
        <input type="hidden" id="searchRestaurantByType" name="searchRestaurantByType">
        What type of food do you prefer (capital the inital letter): 
        <select name="Type">
            <option value="Hot pot">Hot pot</option>
            <option value="Pizza">Pizza</option>
            <option value="Tacos">Tacos</option>
            <option value="Seafood">Seafood</option>
            <option value="Burger">Burger</option>
        </select> 
        <p><input type="submit" value="Let's go" name="search"></p>
    </form>

    <hr />

<body>
<!--Using division-->
<h2>Want a Perfect Match?</h2>
<p>Pick the restaurant with your ideal features! :P</p>
<form method="POST" action="userInterface.php">
    <input type="checkbox" id="displayDivisionRestaurantRequest1" name="features[]" value="Vegetarian Options">
    <label for="ingredient1">I want Vegetarian Options!</label><br>
    <input type="checkbox" id="displayDivisionRestaurantRequest4" name="features[]" value="Gluten-free Options">
    <label for="ingredient3">I want Gluten-free Options!</label><br>
    <input type="checkbox" id="displayDivisionRestaurantRequest2" name="features[]" value="Happy Hour">
    <label for="ingredient2">I want Happy Hour!</label><br>
    <input type="checkbox" id="displayDivisionRestaurantRequest3" name="features[]" value="Outdoor Seating">
    <label for="ingredient3">I want Outdoor Seating!</label><br>
    <input type="checkbox" id="displayDivisionRestaurantRequest4" name="features[]" value="Live Music">
    <label for="ingredient3">I want Live Music!</label><br><br>
    <input type="submit" value="Submit" name="displayDivisionRestaurantRequest"></p>
</form>

<hr />
<h2>Recommendation</h2>

<!--Using aggregation with group by-->
<p>Recommendation by the number of ratings for restaurants in location</p>
<form method="GET" action="userInterface.php">
    <input type="hidden" id="displaythePopularRestaurantRequest" name="displaythePopularRestaurantRequest">
    <input type="submit" value="views popular restaurants by location!" name="displaythePopularRestaurant"></p>
</form>

<hr />
<!--Using nested aggregation with group by-->
<p>Recommendation by the highest average stars</p>
<form method="GET" action="userInterface.php">
    <input type="hidden" id="displaytheHighestAvgStarRequest" name="displaytheHighestAvgStarRequest">
    <input type="submit" value="get a highest star recommendation!" name="displaytheHighestAvgStar"></p>
</form>

<hr />
<!--Using aggregation with having-->
<p>Recommendation for restaurants having at least 3 features</p>
<form method="GET" action="userInterface.php">
    <input type="hidden" id="displaythe3FeatureRequest" name="displaythe3FeatureRequest">
    <input type="submit" value="get restaurants with at least 3 features!" name="displaythe3FeaturesRestaurant"></p>
</form>
<hr />

<?php

session_start();

if (isset($_COOKIE['UserID'])) {

    $_SESSION['UserID'] = $_COOKIE['UserID'];
    echo "Hiiii! ".$_SESSION['UserID'].' , welcome to food heaven<br>';
}

$success = True;
$db_conn = NULL;
$show_debug_alert_messages = False;

function debugAlertMessage($message) {
    global $show_debug_alert_messages;

    if ($show_debug_alert_messages) {
        echo "<script type='text/javascript'>alert('" . $message . "');</script>";
    }
}

function executePlainSQL($cmdstr) { //takes a plain (no bound variables) SQL command and executes it
    //echo "<br>running ".$cmdstr."<br>";
    global $db_conn, $success;

    $statement = OCIParse($db_conn, $cmdstr);

    if (!$statement) {
        echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
        $e = OCI_Error($db_conn); // For OCIParse errors pass the connection handle
        echo htmlentities($e['message']);
        $success = False;
    }

    $r = OCIExecute($statement, OCI_DEFAULT);
    if (!$r) {
        echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
        $e = oci_error($statement); // For OCIExecute errors pass the statementhandle
        echo htmlentities($e['message']);
        $success = False;
    }

    return $statement;
}

function executeBoundSQL($cmdstr, $list) {
    /* Sometimes the same statement will be executed several times with different values for the variables involved in the query.
In this case you don't need to create the statement several times. Bound variables cause a statement to only be
parsed once and you can reuse the statement. This is also very useful in protecting against SQL injection.
See the sample code below for how this function is used */

    global $db_conn, $success;
    $statement = OCIParse($db_conn, $cmdstr);

    if (!$statement) {
        echo "<br>Cannot parse the following command: " . $cmdstr . "<br>";
        $e = OCI_Error($db_conn);
        echo htmlentities($e['message']);
        $success = False;
    }

    foreach ($list as $tuple) {
        foreach ($tuple as $bind => $val) {
            //echo $val;
            //echo "<br>".$bind."<br>";
            OCIBindByName($statement, $bind, $val);
            unset ($val); //make sure you do not remove this. Otherwise $val will remain in an array object wrapper which will not be recognized by Oracle as a proper datatype
        }

        $r = OCIExecute($statement, OCI_DEFAULT);
        if (!$r) {
            echo "<br>Cannot execute the following command: " . $cmdstr . "<br>";
            $e = OCI_Error($statement); // For OCIExecute errors, pass the statementhandle
            echo htmlentities($e['message']);
            echo "<br>";
            $success = False;
        }
    }
}

//prints Restaurant information filter by Location
function printRestaurantResultLoc($result) {
    echo "<div class='restaurant-info'>";
    echo "<h2>Based on your location choice, </h2>";
    echo "<p>Here are the restaurants we recommend:<p>";
    echo "<table style='margin: auto; width: 80%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
            <th style='text-align: center;'>Name</th>
            <th></th>
            <th style='text-align: center;'>Address</th>
            <th></th>
            <th style='text-align: center;'>Location</th>
            <th></th>
            <th style='text-align: center;'>Open Hour</th>
            <th></th>
            <th style='text-align: center;'>Max Allowance</th></tr>";

    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "<td>" . $row["LOCATION"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["OPEN_HOUR"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["MAX_ALLOWANCE"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
}

//prints Restaurant information filter by DishStyle
function printRestaurantResultDS($result) {
    echo "<div class='restaurant-info'>";
    echo "<h2>Nice Style choice! </h2>";
    echo "<p>Here are the restaurants we recommend:</p>";
    echo "<table style='margin: auto; width: 80%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
            <th style='text-align: center;'>Name</th>
            <th></th>
            <th style='text-align: center;'>Address</th>
            <th></th>
            <th style='text-align: center;'>Location</th>
            <th></th>
            <th style='text-align: center;'>Open Hour</th>
            <th></th>
            <th style='text-align: center;'>Max Allowance</th></tr>";

    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "<td>" . $row["LOCATION"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["OPEN_HOUR"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["MAX_ALLOWANCE"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
}

//prints Restaurant information filter by DishStyle
function printRestaurantResultT($result) {
    echo "<div class='restaurant-info'>";
    echo "<h2>Based on your type choice, </h2>";
    echo "<p>Here are the restaurants we recommend:</p>";
    echo "<table style='margin: auto; width: 80%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
            <th style='text-align: center;'>Name</th>
            <th></th>
            <th style='text-align: center;'>Address</th>
            <th></th>
            <th style='text-align: center;'>Location</th>
            <th></th>
            <th style='text-align: center;'>Open Hour</th>
            <th></th>
            <th style='text-align: center;'>Max Allowance</th></tr>";
        
    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "<td>" . $row["LOCATION"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["OPEN_HOUR"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["MAX_ALLOWANCE"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
}

// print the Restaurant names
function printDRResult($result) {
    echo "<div class='restaurant-info'>";
    echo "<h2>Nice Style choice! </h2>";
    echo "<p>Here are the restaurants we recommend:</p>";
    echo "<table style='margin: auto; width: 80%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
            <th style='text-align: center;'>Name</th>
            <th></th>
            <th style='text-align: center;'>Address</th>
            <th></th>
            <th style='text-align: center;'>Location</th>
            <th></th>
            <th style='text-align: center;'>Open Hour</th>
            <th></th>
            <th style='text-align: center;'>Max Allowance</th></tr>";

    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "<td>" . $row["LOCATION"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["OPEN_HOUR"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["MAX_ALLOWANCE"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
    echo "</div>";
}

function printHRResult($result) {
    echo "<h2>Here are the restaurants we recommend:<h2>";
    echo "<table style='margin: auto; width: 50%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
        <th style='text-align: center;'>Stars</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Name</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Address</th>
        <th></tr>";

    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["STARS"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "</tr>";
    }
    echo "</table>";
}

// print the rating numbers and corresponding restaurant name
function printNRResult($result) {
    echo "<h2>Here are the restaurants we recommend:<h2>";
    echo "<table style='margin: auto; width: 50%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
        <th style='text-align: center;'>Location</th>
        <th></th>
        <th style='text-align: center;'>Num of Ratings</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Name</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Address</th>
        <th></tr>";

    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["LOCATION"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["COUNT(RR2.RATINGID)"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_ADDRESS"] . "</td>";
        echo "</tr>";
    }
    echo "</table>";
}

function printMFResult($result) {
    echo "<h2>Here are the restaurants we recommend:<h2>";
    echo "<table style='margin: auto; width: 50%; border-collapse: collapse;'>";
    echo "<tr style='background-color: #f2f2f2;'>
        <th style='text-align: center;'>Num of features</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Name</th>
        <th></th>
        <th style='text-align: center;'>Restaurant Address</th>
        <th></tr>";


    while ($row = OCI_Fetch_Array($result, OCI_BOTH)) {
        echo "<tr>";
        echo "<td style='text-align: center;'>" . $row["COUNT(RF.FEATUREID)"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_NAME"] . "</td><td></td>";
        echo "<td style='text-align: center;'>" . $row["R_ADDRESS"] . "</td><td></td>";
        echo "</tr>";
    }
    echo "</table>";
}


function connectToDB() {
    global $db_conn;

    // Your username is ora_(CWL_ID) and the password is a(student number). For example,
    // ora_platypus is the username and a12345678 is the password.
    $db_conn = OCILogon("ora_azxyxza", "a97622831", "dbhost.students.cs.ubc.ca:1522/stu");

    if ($db_conn) {
        debugAlertMessage("Database is Connected");
        return true;
    } else {
        debugAlertMessage("Cannot connect to Database");
        $e = OCI_Error(); // For OCILogon errors pass no handle
        echo htmlentities($e['message']);
        return false;
    }
}

function disconnectFromDB() {
    global $db_conn;

    debugAlertMessage("Disconnect from Database");
    OCILogoff($db_conn);
}

/* HANDLING */
// Select restaurant by Location
function handleSearchByLocation() {
    global $db_conn;
    $Location = $_GET['Location'];
    $result = executePlainSQL(
        "SELECT DISTINCT * 
        FROM Restaurant r 
        WHERE r.Location LIKE '%". $Location . "%'");
    printRestaurantResultLoc($result);
}

// Join Restaurant, R_is_DS, Dish_Style
function handleSearchByDishStyle() {
    global $db_conn;
    $DishStyle = $_GET['DishStyle'];
    $result = executePlainSQL(
        "SELECT DISTINCT r.r_Name, r.r_Address, r.Location, r.Open_hour, r.Max_allowance
         FROM Restaurant r, R_is_DS ri, Dish_Style d
         WHERE ri.r_Address = r.r_Address AND ri.r_Name = r.r_Name 
               AND ri.StyleID = d.StyleID 
               AND d.DS_name LIKE '%". $DishStyle . "%'");
    printRestaurantResultDS($result);
}

// Only Select the restaurant information in the cross-product of Restaurant, R_Include_T, RType
function handleSearchByType() {
    global $db_conn;
    $Type = $_GET['Type'];
    $result = executePlainSQL(
        "SELECT DISTINCT r.r_Name, r.r_Address, r.Location, r.Open_hour, r.Max_allowance
         FROM Restaurant r, R_Include_T ri, RType t
         WHERE ri.r_Address = r.r_Address AND ri.r_Name = r.r_Name 
               AND ri.RtypeID = t.RtypeID 
               AND t.Rtypename LIKE '%". $Type . "%'");
    printRestaurantResultT($result);
}

//list the Restaurant names without selected gradient(Division)
function handleDivisionRestaurantRequest(){
    global $db_conn;
    if(isset($_POST['features'])) {
        $features = $_POST['features'];
        $num_features = count($features);
        
        // BuserInterfaceld the SQL query
        $query = "SELECT DISTINCT *
        FROM Restaurant r
        WHERE NOT EXISTS (
              SELECT f.Description 
              FROM Feature f
              WHERE f.FeatureID NOT IN (
                  SELECT rf.featureID 
                  FROM R_has_F rf
                  WHERE rf.r_Address = r.r_Address
                  AND rf.r_Name = r.r_Name
              )
              AND f.Description IN ('" . implode("', '", $features) . "')
          )";
                         
        $result = executePlainSQL($query);
        
        // Print the result
        printDRResult($result);
        
    } else {
        // If no features are selected, display all restaurants
        $result = executePlainSQL("SELECT * FROM Restaurant");
        
        // Print the result
        printDRResult($result);
    }
}

// List the number of ratings for restaurants in each location (decreasing order)
//Aggregation with group by
function handleDisplayPopularRequest(){
    global $db_conn;
    $result = executePlainSQL("SELECT COUNT(rr2.ratingID), rr2.r_Name, rr2.r_Address, r.Location
    from R_got_rating rr2, Restaurant r
    where rr2.r_Name = r.r_Name and
          rr2.r_Address = r.r_Address
    group by r.Location, rr2.r_Name, rr2.r_Address
    ORDER BY COUNT(rr2.ratingID) DESC");
    printNRResult($result);}


//////////////////////////////////////////////
/////////////////////////////////////////////

//returns a list of distinct restaurants where the restaurant's average rating is higher than the highest average rating of all restaurants in the same location.
//Nested Aggregation 
function handleDisplayRequest(){
    global $db_conn;
    $result = executePlainSQL("SELECT distinct rr.stars, rr.r_Name, rr.r_Address
    from R_got_rating rr, Restaurant r1
    where rr.r_Name = r1.r_Name and
          rr.r_Address = r1.r_Address and
          rr.stars > (SELECT MAX(AVG(stars)) 
                        FROM R_got_rating rr1, Restaurant r2
                        WHERE r2.r_Name = rr1.r_Name and
                              r2.r_Address = rr1.r_Address 
                        group by r2.Location)
    group by r1.Location, rr.r_Name, rr.r_Address, rr.stars");
    printHRResult($result);}

/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
////////////////////////////////////////////////////

//return the restaurant name and address of the selecting location, only list the restaurants with at least 3 features
//Aggregation with having
function handle3FeaturesRequest(){
    global $db_conn;
    $result = executePlainSQL("SELECT COUNT(rf.featureID), rf.r_Name, rf.r_Address
                        FROM Restaurant r, R_has_F rf, Feature f
                        WHERE r.r_Name = rf.r_Name AND
                              r.r_Address = rf.r_Address AND
                              rf.featureID = f.featureID
                        GROUP BY rf.r_Address, rf.r_Name
                        HAVING COUNT(rf.featureID) > 2");
    printMFResult($result);}

// HANDLE ALL POST ROUTES
// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
function handlePOSTRequest() {
    if (connectToDB()) {
        if (array_key_exists('displayDivisionRestaurantRequest', $_POST)) {
            handleDivisionRestaurantRequest();
        } else if (array_key_exists('updateQueryRequest', $_POST)) {
            handleUpdateRequest();
        } else if (array_key_exists('insertQueryRequest', $_POST)) {
            handleInsertRequest();
        } else if (array_key_exists('displayDivisionRestaurantRequest', $_POST)) {
            handleDivisionRestaurantRequest();
        }
        disconnectFromDB();
    }
}

// HANDLE ALL GET ROUTES
// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
// HANDLE ALL GET ROUTES
// A better coding practice is to have one method that reroutes your requests accordingly. It will make it easier to add/remove functionality.
function handleGETRequest() {
    if (connectToDB()) {
        if (array_key_exists('displaytheHighestAvgStar', $_GET)) {
            handleDisplayRequest();
        } else if (array_key_exists('displaythe3FeaturesRestaurant', $_GET)) {
            handle3FeaturesRequest();
        } else if (array_key_exists('displaythePopularRestaurant', $_GET)) {
            handleDisplayPopularRequest();
        } else if (array_key_exists('searchRestaurantByLocation', $_GET)) {
            handleSearchByLocation();
        } else if (array_key_exists('searchRestaurantByDishStyle', $_GET)) {
            handleSearchByDishStyle();
        } else if (array_key_exists('searchRestaurantByType', $_GET)) {
            handleSearchByType();
        }
        disconnectFromDB();
    }
}

if (isset($_POST['reset']) || isset($_POST['updateSubmit']) || isset($_POST['insertSubmit'])
    || isset($_POST['displayDivisionRestaurantRequest'])) {
    handlePOSTRequest();
} else if (isset($_GET['countTupleRequest']) || isset($_GET['displaytheHighestAvgStarRequest'])
    || isset($_GET['displaythePopularRestaurantRequest']) || isset($_GET['displaythe3FeatureRequest'])
    || isset($_GET['displayDivisionRestaurantRequest1']) || isset($_GET['displayDivisionRestaurantRequest2'])
    || isset($_GET['displayDivisionRestaurantRequest3']) || isset($_GET['searchRestaurantByLocation']) 
    || isset($_GET['searchRestaurantByDishStyle']) || isset($_GET['searchRestaurantByType'])){
    handleGETRequest();
}

?>
</body>
</html>




