# Flash Daddiez
flashcardzzzzz

##Team Normz
* Long walks along the River
* Stand ups every 1.5 hours
  * what you did since last stand up?
  * what you had trouble with?
  * what you are doing next?
* Slack private group
* Someone else reviews your code/PR
* L.N.M.B. (Leave No Man Behind)
* Cookies(?)
* Respect all ideas
* GOAL: MVP by end of Friday
* "S".gsub("Z")

###Backlog:
* Creating Q+A decks (nick and keith)
* Creating registration/authentication (tim and derick)
* Creating homepage/basic
* Creating user profile
* Creating quiz (nick and keith)
* Create finish w/ quiz page

###HTTP Routes:
get / 
get /users/new
post /users
get /users/:user_id
get /decks/:deck_id/cards/:card_id
post /cards/:card_id/guesses
get /users/:user_id/rounds/:round_id

get /login
post /login
get /logout

###Controllers
* users
* login
* decks

###Views
* users/new && users/show

###Stretch Goals
* JQuery
* Color scheme for individual user
* Check off deck for user when deck is 100% done