/**
 * @fileoverview This test suite runs tests on the various versions of newman-docker.
 */

var expect = require('expect.js'),
    fs = require('fs'),
    path = require('path'),
    DockerFileValidator = require('dockerfile_lint');

/* global describe, it */
describe('Validate Dockerfiles', function () {
    var versions = ['ubuntu_1404'],
        rules = fs.readFileSync(path.join(__dirname, 'dockerfile_rules.yml')),
        validator = new DockerFileValidator(rules); // TODO: Decide how we want to automatically load versions.

    versions.map(function (version) {
        var dockerFilePath = path.join(__dirname, '..', version, 'Dockerfile'),
            dockerFileContent = fs.readFileSync(dockerFilePath);

        it('Docker file for "' + version + '" must be valid', function () {
            var result = validator.validate(dockerFileContent.toString()),
                numBadThings = result.error.count + result.warn.count;
            if (!(numBadThings == 0)) {
                console.log(JSON.stringify(result, null, 4)); // Helps debugging on the CI
            }
            expect(numBadThings).to.be(0);
        });
    });
});
