<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link http://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'F`CWtF&0PZ8Mg={6{Ga9^!|[*1w; /2@R|O28U[Al44+4P>xvEcMt9gMgrxj*H(0');
define('SECURE_AUTH_KEY',  'zK^.py5/O|5RClG6kfrCAPJ5/9OC@~*fu|l=>}aMgXBQ]Sd?{T@Qn0Lm-+~`Wn:Z');
define('LOGGED_IN_KEY',    'l],#w7BaAtkvu*= |8tz^gHH2<?-|8tq;--*So.7H*B$0.T>(Y0{+Pf.GFd2<HFq');
define('NONCE_KEY',        '+>Dlz<B3JM8tswDhZb<TdL|-/@[Qm?:9nya ,+m~fj* x2W9^cfQtB!+5#_]fd[V');
define('AUTH_SALT',        'I9FDbQP]-tD.X~[$1wQ&.QYZpT#16ie}i:6xg]Uv#F0tV#-$J^=.c+Ps2SClY sF');
define('SECURE_AUTH_SALT', 'F#Pq`LofCxzAw#k{#@*HiONk|_RKT!wr`^G}x(+X^Z&yHG)lO^[wZ%ATgw7J6x~V');
define('LOGGED_IN_SALT',   '+ulptMtN@~?H)wl!Iv?@$R]xp695_aw0C]Adhz=<IQ.%20i7Go;+a(7`---~Y&hr');
define('NONCE_SALT',       ':aTF^lHf<7odTKB^B-$cGsKT=V8,aG3]V;CLy342+bA4Hq[Q_HZ}K%`DXh=- =?m');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'ZF2_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
