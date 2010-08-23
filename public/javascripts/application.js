// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function submitForm () {
  document.getElementById('tab_form').onsubmit();
}

function clearText (thefield) {
  if (thefield.defaultValue==thefield.value) {
    thefield.value = "";
  }
}

var leftScroll;

function setup_leftscroll () {
  document.addEventListener('touchmove', function(e){ e.preventDefault(); });
  leftScroll = new iScroll('leftscroller');
}

document.addEventListener('DOMContentLoaded', setup_leftscroll);

var rightScroll;

function setup_rightscroll () {
  document.addEventListener('touchmove', function(e){ e.preventDefault(); });
  leftScroll = new iScroll('rightscroller');
}

document.addEventListener('DOMContentLoaded', setup_rightscroll);