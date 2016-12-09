'use strict';
const lodash = require("lodash");
let commonConfig = require("./common.conf").config;

let localConfig = {
    // ============
    // Capabilities
    // ============
    // Maximum instances to run in parallel.  Can be overridden on a per-browser basis by adding maxInstances option under each capability.
    maxInstances: 3,
    capabilities: [
        {
            browserName: 'chrome',
            maxInstances: 1
        },
        {
            browserName: 'firefox',
            maxInstances: 1
        }
    ],

    // ===================
    // Test Configurations
    // ===================
    // Set a base URL in order to shorten url command calls. If your url parameter starts
    // with "/", then the base url gets prepended.
    baseUrl: process.env.SERVICE_URL || 'http://localhost:3000',

    // Test runner services
    // Services take over a specific job you don't want to take care of. They enhance
    // your test setup with almost no effort. Unlike plugins, they don't add new
    // commands. Instead, they hook themselves up into the test process.
    services: ['selenium-standalone'],
    seleniumLogs: './logs/selenium',

    // Running Jenkins with older version of selenium as the 3.0.1 release does not integrate with firefox correcly
    // Geckodriver firefox v48+ uses seems unreliable and needs more time to mature.
    seleniumArgs: {
        version: '2.53.1'
    },
    seleniumInstallArgs: {
        version: '2.53.1'
    }
};
exports.config = lodash.defaultsDeep(localConfig, commonConfig);