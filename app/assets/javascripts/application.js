// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .
$(function () {
  // Initialize the jQuery File Upload widget:
  $('#fileupload').fileupload();

  // Load existing files:
  $.getJSON($('#fileupload form').prop('action'), function (files) {
    var fu = $('#fileupload').data('fileupload');
    fu._adjustMaxNumberOfFiles(-files.length);
    fu._renderDownload(files)
        .appendTo($('#fileupload .files'))
        .fadeIn(function () {
          // Fix for IE7 and lower:
          $(this).show();
         });
    });

    // Open download dialogs via iframes,
    // to prevent aborting current uploads:
    $('#fileupload .files a:not([target^=_blank])').live('click', function (e) {
      e.preventDefault();
      $('<iframe style="display:none;"></iframe>')
        .prop('src', this.href)
        .appendTo('body');
    });

});