# User Stories

* As a user, I can sign up and log in.
* As a user, I can preform CRUD actions on Games and Wishlist.


# Models

## User

#### Attributes:

* email
* name

#### Associations:

* has_many :games
* has_many :wishlist

## Game

#### Attributes:

* Name
* Release Date
* Developer
* Publisher
* Condition
* Console Format(DMG - GBC - GBA)

#### Associations:

* belongs_to :user

## Wishlist

#### Attributes:

* Name
* Console Format(DMG - GBC - GBA)

#### Associations:

* belongs_to :user