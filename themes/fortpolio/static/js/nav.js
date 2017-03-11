'use strict';
(function () {
  var body, button, menu, nav;

  body = document.getElementsByTagName('body')[0];

  nav = document.getElementsByTagName('nav')[0];
  if (!nav) {
    return;
  }

  button = nav.getElementsByTagName('button')[0];
  if ('undefined' === typeof button) {
    return;
  }

  menu = nav.getElementsByTagName('ul')[0];
  menu.setAttribute('aria-expanded', 'false');

  button.onclick = function () {
    if (-1 !== nav.className.indexOf('active')) {
      button.classList.toggle('active');
      menu.classList.toggle('active');
      button.setAttribute('aria-expanded', 'false');
      menu.setAttribute('aria-expanded', 'false');
    } else {
      button.classList.toggle('active');
      menu.classList.toggle('active');
      button.setAttribute('aria-expanded', 'true');
      menu.setAttribute('aria-expanded', 'true');
    }
  };

  body.onclick = function (event) {
    if (-1 !== button.className.indexOf('active') && !nav.contains(event.target)) {
      button.onclick();
    }
  };

})();
