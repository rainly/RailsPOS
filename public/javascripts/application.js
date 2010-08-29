// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function submitForm () {
  document.getElementById('tab_form').onsubmit();
}

function clearText (thefield) {
  if (thefield.defaultValue === thefield.value) {
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
  rightScroll = new iScroll('rightscroller');
}

document.addEventListener('DOMContentLoaded', setup_rightscroll);

function showItemOptions(itemId) {
  var old_item;
  $$(".show_options").each(function(value, index) {
    old_item = value;
    value.removeClassName("show_options");
  });
  var item = $$(itemId).first();
  if (old_item !== item) {
    item.addClassName("show_options");
  }
  rightScroll.refresh();
}

function chooseOptionForPurchase(purchaseId, option, link) {
  var old_item;
  $$("#purchase_" + purchaseId + " .highlight").each(function(value, index) {
    old_item = value;
    value.removeClassName("highlight");
  });
  var item = link.parentNode;
  item.addClassName("highlight");
  if (old_item !== item) {
    new Ajax.Request(link.href, {
      method:     'put',
      parameters: {
        'purchase[alteration]': option
      },
      onSuccess: function (data) {
        console.log(data);
        alert('success!');
      }
    });
  }
  return false;
}