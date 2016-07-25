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
`token`

Returns:

On success (200): {
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
        "id": 2043,
        "body": "dolor praesentium eum rerum repellendus deleniti quam quisquam eos",
        "user": {
          "name": "Lina Tremblay",
          "id": 3
        },
        "created_at": "2016-07-22T05:59:11.000Z"
      },
      {
        "id": 875,
        "body": "pariatur omnis eligendi at consequatur dignissimos non dolore similique laudantium ducimus nihil nesciunt quidem laborum",
        "user": {
          "name": "Lina Tremblay",
          "id": 3
        },
        "created_at": "2016-07-13T04:36:16.000Z"
      },
      {
        "id": 222,
        "body": "vitae impedit aut minus",
        "user": {
          "name": "Lina Tremblay",
          "id": 3
        },"followers": [
      {
        "id": 16,
        "name": "Dr. Isaiah Crooks",
        "email": "jaycee.mccullough@blickgutmann.org",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "followees": [
      {
        "id": 55,
        "name": "Dorothea Hamill",
        "email": "jennie@bins.info",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 88,
        "name": "Breanna Moen",
        "email": "helene_stoltenberg@lesch.com",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      }
    ],
    "suggested_people_to_follow": [
      {
        "id": 19,
        "name": "Norwood Hodkiewicz",
        "email": "brannon.okeefe@bartolettiwest.com",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 60,
        "name": "Wade Kuphal Jr.",
        "email": "brycen@beahan.io",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 71,
        "name": "Reva Waters",
        "email": "arielle@zieme.io",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 27,
        "name": "Americo Balistreri",
        "email": "reagan_hudson@rauboyer.io",
        "picture_url": "http://photo.net/photodb/random-photo?category=Portraits"
      },
      {
        "id": 25,
        "name": "Jayden Purdy",
        "email": "quinton@beahanboyer.com",
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

{"error": "You need to be logged in to do that", } OR

{ "body": ["is too long (maximum is 160 characters)"]}

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

###
