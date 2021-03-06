'use strict';
const winston = require('winston');
const UploadPage = require('../../support/pages/upload.page');
const FileInvalidPage = require('../../support/pages/file.invalid.page');

module.exports = function () {
    this.defineStep('Invalid file page shows the appropriate information', {timeout: 10 * 60 * 1000}, function () {
        const fileList = global.fileList;

        for (const testFile of fileList) {
            // For each file to test, make sure we start from the upload page
            winston.debug('Ensuring upload page open');
            if (!UploadPage.isOpen()) {
                UploadPage.open();
            }
            UploadPage.openFileDetails(testFile.filename);

            winston.debug('Checking for appropriate file invalid page');
            FileInvalidPage.checkErrorCodeIncluded(testFile.errorCode);
        }
    });
};
