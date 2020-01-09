require './config/environment'



use Rack::MethodOverride

use WishlistController
use GamesController
use UsersController
run ApplicationController
