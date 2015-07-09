# Events for seniors

Events for seniors is an app made for diploma on Jagiellonian University.
App allows users to search events and add their own after creating an account.
Website has some features for older adults like larger font, increasing/decreasing font size,
simplicity, reduced whitespaces between some elements, a lot of explanation and tips
especially in forms.

## Prerequisites

* Ruby 2.2
* Rails 4.2.0
* MySQL
* Git

## Getting started

  1. `git clone https://github.com/stolarz92/events_for_seniors.git`
  2. Go to app directory `cd events_for_seniors`
  3. Run `bundle` command
  4. Run `rake db:setup`

## Demo
Working app is available [here](http://leszczyna.wzks.uj.edu.pl/12_stolarski/events_for_seniors/)

#### Admin:
* login: admin@admin.com
* pass: password

Admin can:

1. Add, edit, delete events and cities
2. Add his own events


#### User:
* login: user@user.pl
* pass: password

Logged in user can:

1. Add his own events and manage them
2. Add others events to his 'calendar' (when he is on event site)
3. Manage his profile

All users can:

1. Search and view events
2. Register and log in
