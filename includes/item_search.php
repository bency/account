<?php
include('../connect.php');
$query="select name from spend_record group by name";

if($result = mysql_query($query)){
	while($value = mysql_fetch_assoc($result))
		$data[$value['name']] = $value['name'];
}

/*
 * Load sample data
 */

/*
 * Results array
 */
$results = array();

/*
 * Autocomplete formatter
 */
function autocomplete_format($results) {
    foreach ($results as $result) {
        echo $result[0] . '|' . $result[1] . "\n";
    }
}

/*
 * Search for term if it is given
 */
if (isset($_GET['q'])) {
    $q = strtolower($_GET['q']);
    if ($q) {
        foreach ($data as $key => $value) {
            if (strpos(strtolower($key), $q) !== false) {
                $results[] = array($key, $value);
            }
        }
    }
}

/*
 * Output format
 */
$output = 'autocomplete';
if (isset($_GET['output'])) {
    $output = strtolower($_GET['output']);
}

/*
 * Output results
 */
if ($output === 'json') {
    echo json_encode($results);
} else {
    echo autocomplete_format($results);
}
