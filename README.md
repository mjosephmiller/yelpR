# README

This is a Yelp clone built with Ruby on Rails.

Ruby version: 2.3.0

You can find a deployed version of this web app on [Heroku](http://crowdreview.herokuapp.com), but if you'd prefer to run it locally, here's how:

```
$ git clone https://github.com/mjosephmiller/yelpR.git

$ bundle

$ rails s

```

This app is a Yelp clone. A user can sign up, add restaurants, leave reviews and find out where to visit next.

Features:
------
* Visitors can create new restaurants using a form, specifying a name and description
* Restaurants can be edited and deleted
* Visitors can leave reviews for restaurants, providing a score (1-5) and a comment about their experience
* The restaurants individual pages should display all the reviews, along with the average rating of each restaurant
* Users can register/login/logout/login via Facebook
* A user must be logged in to create restaurants and write reviews
* Users can only edit/delete restaurants which they've created
* Users can only leave one review per restaurant
