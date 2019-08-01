# Association Model

                        @user
                          |
                          ^
@sport -< @category -< @ranking -< @player >- @team

sport has_many :categories

category belongs_to :sport
category has_many :rankings
<!-- category has_many :users, :rankings -->

<!-- user has_many :rankings -->
<!-- user has_many :categories, through: :rankings -->

<!-- ranking belongs_to :user -->
ranking belongs_to :category
ranking has_many :players

player belongs_to :rankings
player belongs_to :team

team has_many :players
team has_many :rankings, through: :players

# Attributes

*Sport*
* name

$ rails g resource Sport name:string

*Category*
* title
* sport_id

$ rails g resource Category title:string sport_id:integer sport:belongs_to

*User*
* username
* email
* password_digest

$ rails g resource User username:string email:string password_digest:string fav_sport:string fav_team:string fav_player:string

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
* team_id

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to

*Team*
* city
* name
* year

$ rails g resource Team city:string name:string year:integer

###########################**********************#############################
###########################**********************#############################
###########################**********************#############################

# Scalability
                                    @user
                                      |
                                      ^
@league >- @sport -< @category -< @ranking -< @player >- @team -< @coach
                                      v          |
                                      |          ^   
                                  @comment    @sneaker

# Added Associations

league belongs_to :sport

<!-- sport has_many :categories -->
sport has_many :leagues

<!-- category belongs_to :sport -->
<!-- category has_many :rankings -->

<!-- user has_many :rankings -->
<!-- user has_many :categories, through: :rankings -->
user has_many :comments, through: :rankings

<!-- ranking belongs_to :user -->
<!-- ranking belongs_to :category -->
ranking belongs_to :comment

player belongs_to :ranking
player belongs_to :team

team has_many :players
team has_many :coaches

# Attributes

*League*
* sport_id

*Sport*
<!-- * name -->
* gender

$ rails g resource Sport name:string

*Category*
* title
* sport_id

$ rails g resource Category title:string sport_id:integer sport:belongs_to

*User*
* username
* email
* password_digest

$ rails g resource User username:string email:string password_digest:string fav_sport:string fav_team:string fav_player:string

*Ranking*
* description

$ rails g resource Ranking description:text user_id:integer category_id:integer user:belongs_to category:belongs_to

*Player*
* first_name
* last_name
* position
* number
* ranking_id
* team_id

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to

*Team*
* city
* name
* year

#########################################################################

              @user
                |
                ^
@category -< @ranking -< @sport -< @player >- @team
