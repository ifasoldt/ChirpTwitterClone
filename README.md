# README

Alright, this is my first README. Welcome

In short, this is a twitter API clone called Chirp!

There, done. In the future, I will add better documentation because how can one get annoyed at shody documentation if yours is non-existent?


### POST - <https://guarded-bayou-26088.herokuapp.com/users> Create a user

Required params:
`name`,
`password`,
`email`

Optional params

`picture_url`

Returns:

On success (201): {"token": "f5f2dd4039482a07df3a"}

On validation failure (422): {"email": [ "has already been taken" ] }

---

### H3 POST - <https://guarded-bayou-26088.herokuapp.com/users/login> LOGIN as a user

Required params:
`email`,
`password`

Returns:

On success (200): {"token": "f5f2dd4039482a07df3a"}

On validation failure: { "error": "Email and/or password does not exist, please try again"}

---

### GET - <https://guarded-bayou-26088.herokuapp.com/tweets> Current User's Timeline.

Required params:
`token` (if no token, will just return a list of ALL tweets without any current user info--behaves more like and index of all tweets.)

Optional params:
`page`

Returns:

On success (200): {
```json
{
"user": {
  "id": 1,
  "name": "Katrina Koss",
  "email": "naomie@kaulkeklein.net",
  "picture_url": "http://photo.net/photodb/random-photo?category=Portraits",
  "followers_count": 1,
  "followees_count": 3,
  "timeline_tweets": [{
        "id": 966,
        "body": "officiis aperiam sed consectetur aliquam earum fuga suscipit consequatur sunt quos repellendus culpa perspiciatis",
        "user": {
          "name": "Neal Wolff IV",
          "id": 6,
          "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
        },
        "created_at": "2016-07-07T21:56:11.000Z"
      },
      {
        "id": 2453,
        "body": "delectus sunt quis",
        "user": {
          "name": "Katrina Koss",
          "id": 1,
          "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
        },
        "created_at": "2016-07-06T07:49:50.000Z"
      },
      {
        "id": 32,
        "body": "aliquam et dolorem aut commodi numquam excepturi qui",
        "user": {
          "name": "Katrina Koss",
          "id": 1,
          "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
        },
        "created_at": "2016-07-04T18:24:23.000Z"
      }],
    "followers": [
      {
        "id": 30,
        "name": "Jermaine Pouros PhD",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "followees": [
      {
        "id": 6,
        "name": "Neal Wolff IV",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 65,
        "name": "Baby Weber DDS",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 41,
        "name": "Zoila Lockman",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "suggested_people_to_follow": [
      {
        "id": 89,
        "name": "Mona Beahan",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 33,
        "name": "Georgette Franecki",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 54,
        "name": "Brandy Crooks PhD",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 96,
        "name": "Amir Haag",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 85,
        "name": "Eleanore Lehner",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ]
  }
}
```


On Validation failure: {"error": "You need to be logged in to do that"}

---

### POST - <https://guarded-bayou-26088.herokuapp.com/tweets> Post a Tweet as the current user.



Required params:

`token`

`body`(length < 170) Example: "Hi, I'm a new post!"

On Success: {

```json
  "user": {
    "id": 3,
    "name": "Lina Tremblay",
    "email": "iliana_balistreri@altenwerthwilderman.net",
    "picture_url": "http://photo.net/photodb/random-photo?category=Portraits",
    "followers_count": 1,
    "followees_count": 2,
    "timeline_tweets": [
      {
        "id": 3008,
        "body": "Hi, I'm a new post!",
        "user": {
          "name": "Lina Tremblay",
          "id": 3
        },
        "created_at": "2016-07-25T19:31:35.300Z"
      },
      {
        "id": 2043,
        "body": "dolor praesentium eum rerum repellendus deleniti quam quisquam eos",
        "user": {
          "name": "Lina Tremblay",
          "id": 3
        },
        "created_at": "2016-07-22T05:59:11.000Z"
      },
```

On Validation failure:

{"error": "You need to be logged in to do that"} OR

{ "body": ["is too long (maximum is 160 characters)"]}

---

### GET - <https://guarded-bayou-26088.herokuapp.com/user> Get the information of a single user.

Required params:

`token`

`id` (of user you want to lookup)

On success: (200)

```json
{
  "user": {
    "id": 5,
    "name": "Haylie Gleichner MD",
    "picture_url": "http://photo.net/photodb/random-photo?category=Portraits",
    "followers_count": 1,
    "followees_count": 2,
    "followers": [
      {
        "id": 79,
        "name": "Richmond Keebler",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "followees": [
      {
        "id": 10,
        "name": "Cassandre Will MD",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 74,
        "name": "Estelle Collier",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "tweets": [
      {
        "id": 20,
        "body": "ab modi itaque quo",
        "user": {
          "name": "Haylie Gleichner MD",
          "id": 5
        },
        "created_at": "2015-08-06T10:55:19.000Z"
      },
      {
        "id": 106,
        "body": "eum et labore perspiciatis consequatur",
        "user": {
          "name": "Haylie Gleichner MD",
          "id": 5
        },
```

On validation failure: (404) {"error": "You need to be logged in to do that"}

---

### GET - <https://guarded-bayou-26088.herokuapp.com/users> GET a list of all users.

Required params:

`token`

On success:

```json
{
  "users": [
    {
      "id": 89,
      "name": "Aaliyah Abernathy",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits",
      "followers_count": 0,
      "followees_count": 3,
      "tweet_count": 0,
      "currently_being_followed": false
    },
    {
      "id": 61,
      "name": "Adaline Miller DVM",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits",
      "followers_count": 1,
      "followees_count": 0,
      "tweet_count": 0,
      "currently_being_followed": false
    },
```

On validation failure: {"error": "You need to be logged in to do that"}

---

### POST <https://guarded-bayou-26088.herokuapp.com/follow/5> Post follow a user.

Required params:

`token`

`id` (as follow/:id)

On success: (200)

On validation failure: (400) {"error": "You need to be logged in to do that"}, OR {"error": "You cannot follow someone you are already following"}

---

### POST <https://guarded-bayou-26088.herokuapp.com/unfollow/5> POST unfollow a user.

Required params:

`token`

`id` (as follow/:id)

On success: (200)

On validation failure: (400) {"error": "You need to be logged in to do that"}, OR {"error": "You must be following someone to unfollow them."}

---

### POST <https://guarded-bayou-26088.herokuapp.com/users_search?search_term=as> POST search database for users

Required params:

`search_term`

On success:{
  ```json

  "users": [
    {
      "id": 10,
      "name": "Cassandre Will MD",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
    },
    {
      "id": 70,
      "name": "Courtney Jast",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
    },
```

etc.

If no results: { "error": "I'm sorry, it doesn't look there are any results that match your search term"}

If no search_term input: Search will return a list of all users.

---

### GET <https://guarded-bayou-26088.herokuapp.com/tweets_search?search_term=as> GET database search of all tweets.

Required params:

`search_term`

On success:

```json
"tweets": [
  {
    "id": 205,
    "body": "consequatur est voluptas ipsum rem iure",
    "user": {
      "name": "Marian Schmeler",
      "id": 4
    },
    "created_at": "2016-07-22T16:21:23.000Z"
  },
  {
    "id": 1112,
    "body": "et facere tenetur dolor omnis quam a cum voluptatibus quas porro",
    "user": {
      "name": "Laurie Orn",
      "id": 2
    },
    "created_at": "2016-07-22T03:21:41.000Z"
  },
```

If no results: { "error": "I'm sorry, it doesn't look there are any results that match your search term"}

If no search_term input: Search will return a list of all tweets.

---

### GET <https://guarded-bayou-26088.herokuapp.com/total_search?search_term=as> GET database search of all tweets and users, users first.

Required params:

`search_term`

On success:

```json
{
  "users": [
    {
      "id": 24,
      "name": "Abigale O'Conner",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
    },
    {
      "id": 101,
      "name": "Isaiah Fasoldt",
      "picture_url": null
    },
    {
      "id": 30,
      "name": "Jermaine Pouros PhD",
      "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
    },
```

If no results: { "error": "I'm sorry, it doesn't look there are any results that match your search term"}

If no search_term input: Search will return a list of all tweets.

---
