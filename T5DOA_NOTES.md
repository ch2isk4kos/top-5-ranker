# Association Model

              @user      
                |           
                ^           
@category -< @ranking -< @player >- @sport
                            |
                            ^
                          @team

category has_many :rankings
category has_many :users, :rankings

ranking belongs_to :user
ranking belongs_to :category
ranking has_many :players

user has_many :rankings
user has_many :categories, through: :rankings

ranking belongs_to :user
ranking belongs_to :category
ranking has_many :players
ranking has_many :sports, through: :players

player belongs_to :ranking
player belongs_to :sport
player belongs_to :team

sport has_many :players
sport has_many :rankings, through: :players

# Attributes

*User*
* username
* email
* password_digest

$ rails g resource User username:string email:string password_digest:string fav_sport:string fav_team:string fav_player:string

*Category*
* title

$ rails g resource Category title:string

*Ranking*
* description
* user_id
* category_id

$ rails g resource Ranking description:text user_id:integer category_id:integer user:belongs_to category:belongs_to

*Player*
* first_name
* last_name
* position
* number
* ranking_id
* sport_id
* team_id

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to belongs_to:sport

*Sport*
* name

$ rails g resource Sport name:string

*Team*
$ rails g resource Team city:string name:string year:integer

###########################**********************#############################
###########################**********************#############################
###########################**********************#############################

# Scalability

              @user      @sneaker   
                |           V         
                ^           |         
@category -< @ranking -< @player >- @sport
                            |          |
                            ^          ^
                          @team     @league

# Added Associations
category has_many :rankings
category has_many :users, :rankings

ranking belongs_to :user
ranking belongs_to :category
ranking has_many :players

user has_many :rankings
user has_many :categories, through: :rankings

ranking belongs_to :user
ranking belongs_to :category
ranking has_many :players
ranking has_many :sports, through: :players

player belongs_to :ranking
player belongs_to :sport
player belongs_to :team

sport has_many :players
sport has_many :rankings, through: :players

# Added Attributes

*User*
* username
* email
* password_digest

$ rails g resource User username:string email:string password_digest:string fav_sport:string fav_team:string fav_player:string

*Category*
* title

$ rails g resource Category title:string

*Ranking*
* description
* user_id
* category_id

$ rails g resource Ranking description:text user_id:integer category_id:integer user:belongs_to category:belongs_to

*Player*
* first_name
* last_name
* position
* number
* ranking_id
* sport_id
* team_id

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to belongs_to:sport

*Sport*
* name

$ rails g resource Sport name:string

*Team*
$ rails g resource Team city:string name:string year:integer
