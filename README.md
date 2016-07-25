# README

Alright, this is my first README. Welcome

In short, this is a twitter API clone.

There, done. In the future, I will add better documentation because how can one get annoyed at shody documentation if yours is non-existent?


## H2 POST - Creates a user

Required params

name
password
email
Optional params

picture_url
Returns:

On success (201): { "id": 1, "username": "cvannoy", "email": "chris@chrisvannoy.com", "bio": "diggity", "auth_token": "f5f2dd4039482a07df3a", "avatar": "https://unsplash.it/200/200" }

On validation failure (422): { "username": [ "has already been taken" ], "email": [ "has already been taken" ] }
