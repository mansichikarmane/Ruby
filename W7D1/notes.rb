# Securely storing Passwords in DB
  # 1) Why can't we store plantext passwords in the DB?
  # 2) Why can't we store encoded/encrpyted passwords in the DB?
    # won't be secure, people can just see your password
    # it's one layer above saving passwords as plain text, but people can still use the keys of the hash to find someones password so it isn't safe enough
  # 3) What is the solution then?
    # Hashing

# Four Key Principles of Hashing
  #1) One way- given an input, we can easily produce the output but not vice-versa
  #2) Deterministic - same input produces same output every time
  #3) Uniform - reduce the amount of possible hash collisions (pigeon-hole problem or deerish)
    # if you have a fixed length and number of characters for a password 
    # you will still return the same value
  #4) Sensitive - a small change to the input results in an entirely different hash

# Rainbow table attack - hackers can figure out passwords people typically use, they have a table of commonly used passwords they try to run through
# ex: 123456, password, qwerty, baseball, dragon, football, etc.

# Salting - adds a level of randomness(entropy) to common passwords by pairing them with a random string(i.e the salt) and generating the hash from that
  # Makes it computationally unfeasible to brute force hashed password, or use a rainbow table, evn for the most common passwords
  # Need to store the salt along with the hash in the DB

# BCrypt
  # one-way hashing function
  # incorporates a salt to prevent hash/rainbow table attacks
  # slower relative to other hashing algorithms like HD5, SHA-1, SHA-2 (this is good)
  # Adaptive, sclaes with computational power, resistant to brute-force
  # Verifies if two hashes were created from the same input without needing to reveal them
  # Not exclusive to Ruby or Rails - many languages have implementations
  # Include the bcrypt gem in Gemfile to use in Ruby project

# User Schema - never add a password column, just a password_digest
# column name: password_digest, data type: string, details: not null
# column name: session_token, data type: string, details: not null, indexed, unique
# column name: username, data type: string, details: not null, indexed, unique
# column name: id, data type: integer, details: not null, primary key

# 3 Key Auth Functionalities
  # Sign up new users
  # Sign in existing users
  # Sign out existinig users

# Relevant Routes
  # Sign up
    # get '/users/new, to: 'users#new'
    # post '/users', to: 'users#create'
  # Log In
    # get '/session/new', to: 'session#new'
    # post '/session', to: 'session#create'
  # Log Out
    # delete '/session', to: 'session#destroy'

# Generating Auth Routes
  # resources :users, only: [:new, :create]
  # resource :session, only: [:new, :create, :destroy]

# New Gems
  # better_errors - different/nicer error page, full stack trace, source line in editor
  # binding_of_caller - enables extra features in better_errors, REPL on error page, local and instance variable inspection
    # we won't use this on its own, only with(better_errors)

# How do we 'Sign Up' a user?
  #1) Pass params(username, password) through a form
  #2) Create a new instance of a user with these params

# Steps
  # check gem file for binding_of_errors, better_errors and annotate
  # uncomment out bcrypt
  # create a database
  # do not create new table if you dont need to, just create new migration for adding/changing columns

# How do we 'Sign in' a user?
  # Database does not know anything about who is logged in
  # the 'logged in' status depedns on cookies
  # The controller modifies our cookies using the session
  # A user is logged in if
  user.session_token == session[:session_token]
  # Session is part of the cookies
  # session is a has being linked to session_token
  # when a user is logged out, the session token is set to nil on website server

# What is the session thing?
  # Hash-like object that we can add key-value pairs to, allowing for a nice interface to manage cookies on our site and allow data
    # to persist across request-response cycles (remember HTTP is stateless)
  # Created under the hood by ActionController::Base for every request that comes in (note that it is lazily loaded)
  # Sends cookies back down to the browser with each response (browser sends them back up with each request)
  # Only available in controllers and views

  
  




















