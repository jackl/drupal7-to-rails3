# Load the rails application
require File.expand_path('../application', __FILE__)

# Drupal table names are by default not pluralized.
ActiveRecord::Base.pluralize_table_names = false

# Initialize the rails application
Drupal7::Application.initialize!
