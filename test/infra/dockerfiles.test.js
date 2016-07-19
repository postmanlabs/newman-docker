/**
 * @fileoverview This test suite runs tests on the various versions of newman-docker.
 */

var expect = require('expect.js'),
    fs = require('fs'),
    path = require('path'),
    DockerFileValidator = require('dockerfile_lint');

/* global describe, it */
describe('Validate Dockerfiles', function () {
    var imagesBaseDirectory = path.join(__dirname, '../../images'),
        versions = fs.readdirSync(imagesBaseDirectory).filter(function (item) {
            return fs.statSync(path.join(imagesBaseDirectory, item)).isDirectory();
        }),
        rules = fs.readFileSync(path.join(__dirname, 'dockerfile_rules.yml')),
        validator = new DockerFileValidator(rules);

    versions.map(function (version) {
        var dockerFilePath = path.join(imagesBaseDirectory, version, 'Dockerfile'),
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
