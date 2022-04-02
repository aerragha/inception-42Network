<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', "wordpress");

/** Database username */
define( 'DB_USER', getenv('MYSQL_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', "mariadb" );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^EO|rLN39@2!Er;&jaxNRUjwhN>JmcvGcN@Dao2?.{p)0Vba2!t[**IC!Hxm-R-}');
define('SECURE_AUTH_KEY',  'w`z$(Mx0zCq6W]q<|SfZ&7)ciBUa^88Zal#E:s~2*=n`Cr3b3yf^Ge;vh0 a$7|#');
define('LOGGED_IN_KEY',    '[uiOe3OizcjyL$ }rfHmHCH~f7Um|v8=J bh%OnD-Zn8Ll7E@RR&#*P9C$M>Czh7');
define('NONCE_KEY',        '[=|aB{zoML|xb.L{&):a=ZIc8I?bIu6W-kN~(:l)%,atCE8yq-WhG@cS6XR B9U<');
define('AUTH_SALT',        ',7~tOmJ^zP?3@_i-n5_*TJkK(;1=%J,3]M>h0-S=V/tNP8S^|((_(We}VdV-PC%2');
define('SECURE_AUTH_SALT', '[kH3N;GQ@0_iz[D^n;t{R}a[@<.,xNr62?~C3iW p~vhZo1%5x-l|Bpj fNQ=p!u');
define('LOGGED_IN_SALT',   '[oJ}Az#-*lse.vmq2G;}tekgB:M[9~7}6jc,T6TpYTBKd$-|U6aS@uC_;.ThG^1_');
define('NONCE_SALT',       '$t<>Sc1g9Z!vQ>Q3LH957N}pJ&4An^<fh^=z`PX;];*n1fzV?FH|-/c}7xjh&wL<');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';