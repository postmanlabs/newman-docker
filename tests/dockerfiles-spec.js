/**
 * @fileoverview This test suite runs tests on the various versions of newman-docker.
 */

var expect = require('expect.js'),
    fs = require('fs'),
    path = require('path'),
    validateDockerfile = require('validate-dockerfile');

/* global describe, it */
describe('Validate Dockerfiles', function () {
    var versions = ['ubuntu_14_04']; // TODO: Decide how we want to automatically load versions.
    versions.map(function (version) {
        var dockerFilePath = path.join(__dirname, '..', version, 'Dockerfile'),
            dockerFileContent = fs.readFileSync(dockerFilePath);
        it('Docker file for "' + version + '" must be valid', function () {
            var result = validateDockerfile(dockerFileContent.toString());
            if (!result.valid) {
                console.log(JSON.stringify(result, null, 4)); // Helps debugging on the CI
            }
            expect(result.valid).to.be(true);
        });
    });
});
