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
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js


//= require_tree .

$(document).on('nested:fieldAdded', function(event){
  // this field was just inserted into your form
  var field = event.field; 

  // it's a jQuery object already! Now you can find date input
  var dateField = field.find('.datepicker');
  // and activate datepicker on it
  dateField.datepicker({ format: 'yyyy-mm-dd' })
})
