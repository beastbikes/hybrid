/**
 * @overview The Embedded JavaScript API Reference
 * 
 * <p>This reference described the exported REST API for embedded web
 * browser to interact with native application.</p>
 * 
 * <p>Usage:</p>
 * <pre>
 * &lt;script type="text/javascript" src="/1.0/embedded.js"&gt;&lt;script&gt;
 * </pre>
 * 
 * @version 1.0
 * @auther Johnson Lee <jingsen.li@embapibikes.com>
 */
(function(global) {

    var ajax = function(url, options) {
        var self = this;
        var opt = {
            success : options.success || function() {
                console.log('Request ' + url + ' success');
            },
            error : options.error || function(e) {
                console.log(e.stack || e.message);
            },
        };
        var xhr = new XMLHttpRequest();

        try {
            xhr.open('GET', url);
            xhr.onreadystatechange = function() {
                if (this.readyState != 4)
                    return;

                if (this.responseText) {
                    opt.success.call(self, JSON.parse(this.responseText));
                } else {
                    opt.success.call(self);
                }
            };
            xhr.send();
        } catch (e) {
            opt.error.call(self, e);
        }
    };

    var VERSION_1_0 = '/1.0';

    /**
     * <p>The following example shows how to retrieve the current user:<p>
     * <pre>
     * embapi.getUser({
     *     success : function(user) {
     *         console.log(JSON.stringify(user));
     *     },
     *     error : function(e) {
     *         console.log(e.stack || e.message);
     *     },
     * });
     * </pre>
     * 
     * @namespace embapi
     */
    global.embapi = global.embapi || {

        /**
         * Retrieve the agent information
         * 
         * @param options {Object}
         *        A backbone-style options
         * @memberof embapi
         */
        getAgent : function(options) {
            return ajax.call(this, VERSION_1_0 + '/agent', options || {});
        },

        /**
         * Retrieve the current user
         * 
         * @param options {Object}
         *        A backbone-style options
         * @memberof embapi
         */
        getUser : function(options) {
            return ajax.call(this, VERSION_1_0 + '/user', options || {});
        },

        /**
         * Retrieve the current device
         * 
         * @param options {Object}
         *        A backbone-style options
         * @memberof embapi
         */
        getDevice : function(options) {
            return ajax.call(this, VERSION_1_0 + '/device', options || {});
        },

        /**
         * Retrieve the active network
         * 
         * @param options {Object}
         *        A backbone-style options
         * @memberof embapi
         */
        getActiveNetwork : function(options) {
            return ajax.call(this, VERSION_1_0 + '/connectivity/network', options || {});
        },

    };

})(this);

