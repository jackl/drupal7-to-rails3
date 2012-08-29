drupal7-to-rails3
=================

Minimal project that can import some common Drupal 7 node types (story, page) and make available in json format. Basically I needed to abandon Drupal7 after a migration from Drupal6 that was error-strewn. Finding various data export options all broken was the last straw.

Assumes database being pointed to contains Drupal 7 content.

== Setup

  * Edit database.yml and point towards your Drupal 7 database.
  * rails server
  * Navigate to http://localhost:3000/stories 