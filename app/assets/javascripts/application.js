// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  
  $('#sortable').sortable({
    axis: 'y',
    dropOnEmpty: false,
    cursor: 'move',
    items: '.floorplan',
    opacity: 0.5,
    scroll: true,
    stop: function(e, ui) {
      ui.item.effect('highlight', {}, 1000);
    },
    update: function(e, ui) {
      location_id = $(this).data('location_id');
      position = ui.item.index();
      $.ajax({
        type: 'PATCH',
        URL: ui.item.data('update_url'),
        dataType: 'json',
        data: { location: { id: location_id }, floor_plan: { row_order_position: position } }
      })
    }
  });
});

