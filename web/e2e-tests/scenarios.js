'use strict';

/* https://github.com/angular/protractor/blob/master/docs/toc.md */

describe('my app', function() {

  browser.get('index.html');

  it('should automatically redirect to /list when location hash/fragment is empty', function() {
    expect(browser.getLocationAbsUrl()).toMatch("/list");
  });


  describe('list', function() {

    beforeEach(function() {
      browser.get('index.html#/list');
    });

  });


  describe('detail', function() {

    beforeEach(function() {
      browser.get('index.html#/detail/0');
    });

  });
});
