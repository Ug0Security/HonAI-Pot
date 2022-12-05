<?php

  // Get the host from the query string
  $host = escapeshellcmd($_GET['host']);

  // Execute the ping command and store the output in a variable
  $output = shell_exec("/var/www/html/honey/openai.sh $host");

  // Print the output
  echo "<pre>$output</pre>";
  
  echo var_dump($output);
?>
