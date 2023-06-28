// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require best_in_place

$(document).ready(function() {
  /* Activating Best In Place */  
  jQuery(".best_in_place").best_in_place() });
