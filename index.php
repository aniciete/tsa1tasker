<?php
/**
 * Redirect root requests to the CodeIgniter 4 public directory.
 * This prevents 403 Forbidden errors on shared hosting like InfinityFree.
 */
header('Location: public/');
exit();
