/**
 * The Hybrid API agent
 *
 * @class
 */
function Agent() {

    /**
     * The name of agent
     *
     * @type {String}
     */
    this.name = null;

    /**
     * The platform of agent (eg: Android/5.1.0, iPhone/8.0)
     *
     * @type {String}
     */
    this.platform = '';

    /**
     * The version code
     *
     * @type {Number}
     */
    this.versionCode = 0x1000;

    /**
     * The version name
     *
     * @type {String}
     */
    this.versionName = '1.0';

}

/**
 * The authentication information
 *
 * @class
 */
function Authentication() {

    /**
     * The user id
     *
     * @type {String}
     */
    this.id = '';

    /**
     * The username
     *
     * @type {String}
     */
    this.username = '';

    /**
     * The email
     *
     * @type {String}
     */
    this.email = '';

    /**
     * Indicates whether the user is authenticated or anonymous
     *
     * @type {Boolean}
     */
    this.authenticated = false;

    /**
     * The session token
     *
     * @type {String}
     */
    this.session = '';

}

/**
 * The device information
 *
 * @class
 */
function Device() {

    /**
     * The device id
     *
     * @type {String}
     */
    this.id = '';

    /**
     * The device token
     *
     * @type {String}
     */
    this.token = '';

}

/**
 * The network information
 *
 * @class
 */
function Network() {

    /**
     * The network type
     * <ul>
     * <li>0 - Unknown</li>
     * <li>1 - Ethernet</li>
     * <li>2 - WIFI</li>
     * <li>3 - Cellular</li>
     * </ul>
     *
     * @type {Number}
     */
    this.type = 0;

    /**
     * The network name
     *
     * @type {String}
     */
    this.name = '';

    /**
     * Indicates whether the network is available
     *
     * @type {Boolean}
     */
    this.available = false;

    /**
     * Indicates whether the device is currently roaming on this network.
     *
     * @type {Boolean}
     */
    this.roaming = false;

    /**
     * The network state
     * <ul>
     * <li>0 - Unknown</li>
     * <li>1 - Connecting</li>
     * <li>2 - Connected</li>
     * <li>3 - Suspend</li>
     * <li>4 - Disconnecting</li>
     * <li>5 - Disconnected</li>
     * </ul>
     *
     * @type {Number}
     */
    this.state = 0;

}
