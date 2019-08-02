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
ranking has_many :sports, :players

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
* fav_sport
* fav_team
* fav_player

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
* year
* ranking_id
* sport_id
* team_id

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to belongs_to:sport

*Sport*
* name

$ rails g resource Sport name:string

*Team*
* city
* name
* year

$ rails g resource Team city:string name:string year:integer

###########################**********************#############################
###########################**********************#############################
###########################**********************#############################

# Scalability: NEEDS EDITING


              @user      @sneaker   
                |           V         
                ^           |         
@category -< @ranking -< @player >- @sport
                V           |          |
                |           ^          ^
            @comment      @team     @league


# Added Associations
user has_many :comments, through: :rankings

ranking belongs_to :comment

comment has_many :rankings
comment has_many :users, through: :rankings

player has_many :sneakers

sneaker belongs_to :player

sport has_many :leagues

league belongs_to :sport


# Added Attributes
*Ranking*
* comment_id

$ rails g migration addCommentIdToRankingsTable comment_id:integer comment:belongs_to

$ rails g resource Player first_name:string last_name:string position:string number:integer ranking:belongs_to team:belongs_to belongs_to:sport

*League*
* name
* sport_id

$ rails g resource League name:string sport_id:integer

*Team*
* city
* name
* year

$ rails g resource Team city:string name:string year:integer
