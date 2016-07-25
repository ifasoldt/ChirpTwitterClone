# README

Alright, this is my first README. Welcome

In short, this is a twitter API clone called Chirp!

There, done. In the future, I will add better documentation because how can one get annoyed at shody documentation if yours is non-existent?


## H2 POST - `https://guarded-bayou-26088.herokuapp.com/users` Create a user
`https://guarded-bayou-26088.herokuapp.com/users?name=Paul
George&email=PG13_the_best@example.com&password=Pacers!&picture_url=http://www.pacers.com/picture/pg13`

Required params:
`name`
`password`
`email`
Optional params

`picture_url`
Returns:

On success (201): {"token": "f5f2dd4039482a07df3a"}
On validation failure (422): {"email": [ "has already been taken" ] }

## H2 POST - `https://guarded-bayou-26088.herokuapp.com/users/login` LOGIN as a user
`https://guarded-bayou-26088.herokuapp.com/users/login?email=PG13@example.com&password=Pacers!`

Required params:
`email`
`password`
