# Restful routes - a mapping between HTTP verb + URL path and an action/response
  # resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # standardizes our crud actions

# View
  # the client facing portion of rails
  # comprises the multiple types of responses from the controller
    # e.g. webpage (HTML) vs web service(JSON, XML, etc.)
  # Web Page or Template Composition
    # HTML 
    # CSS
    # JavaScript

# Controller Rendering
  # Rendering 
    # Views -JSON, HTML
    # Syntax: render <template>
    # Example: render :show
      # Rails knows to look here: "/app/views/users/show.html.erb"
  render :edit
  render template: "books/edit"
  render template: "books/edit.html.erb"

# When Rendering Views
  # Renders the specified template within application.html.erb
    # Sepcifically at yield - yields to any template that the controllers are rendering

# Embedded Ruby (ERB)
  # HTML templates are augmented
  # <% Ruby code here %> - execute Ruby code without a return value
  # <%= Ruby code here %> - executes Ruby code with a return value to be embedded into the template
  # File name example: show.html.erb

# Things to remember about ERB code
  # ERB code is NOT visible to the client/browser
  # Do not try to run puts or print
  # Comment out by also inserting # inmmediately after the first %
    # ex: <%# Ruby comment %>
  # use insteance variables from your controllers

# Debugging
  # Good ol' byebug
    # Keep in mind, you dont have to require gems manually anymore, just bundle install
    # Stack trace
    # binding_of_caller and better_errors gem


#----------------------------------------[Demo]----------------------------------------
# BlueBird Demo First ERB and Partial

# completed: schema

# add to routes:
resources :users do
  resources :chirps, only: [:index]

# users_controller.rb
  # start rails server in terminal (rails s)
  # navigate to /users
  # navigate to /users/1 
  # update show 
    render :show
      # check this in local host, should be erroring that show has no corresponding template

# in views folder -> applicationi.html.erb
  # is the main html page 
  # automatically has yield in it
  # create a users folder in views

# in views -> users folder
  # make show.html.erb
  # write show html:
    <ul>
      <li><%= @user.username %></li>
      <li><%= @user.age %></li>
      <li><%= @user.email %></li>
    </ul>
# in users_controller.rb (under controllers)
  def show
    @user = User.find_by(id: params[:id])
    render: show
  end

  # change index in same file
  def index
    @users = User.all
    render :index
  end

# in users
  # make index.html.erb file
  <h1>Here are all of our Users!</h1>
  <ul>
    <% @users.each do |user| %>
      <li>
        <ul>
          <li><%= @user.username%></li>
          <li><%= @user.age%></li>
          <li><%= @user.email%></li>
        </ul>
      </li>
    <% end %>
  </ul>

  # making a partial in users
  # _user.html.erb * always name with underscore first
      # do not use instance variables in partials
  <ul>
      <li><%= user.username%></li>
      <li><%= user.age%></li>
      <li><%= user.email%></li>
  </ul>

# change show.html.erb now that we have a partial
  <%= render "user",  user: @user %>

# back in index.html we change it:
  <ul>
    <% @users.each do |user| %>
      <li>
          <li><%= render 'user', user: user %></li>
      </li>
    <% end %>
  </ul>

# back in _user.html.erb to add links
  <% if action == 'show' %>
    <a href="" <%= users_url %>>Users Index Link</a>
  <% else %>
    <a href ="" <%= users_url(user.id)%>>User Show Page</a>
  <% end %>

  <ul>
      <li><%= user.username%></li>
      <li><%= user.age%></li>
      <li><%= user.email%></li>
  </ul>

# back in show.html.erb
<% render "user", user: @user, action: 'show' %>

# back in index.html.erb
<ul>
    <% @users.each do |user| %>
      <li>
          <li><%= render 'user', user: user, action: 'index' %></li>
      </li>
    <% end %>
  </ul>
# ----------------------------------------------------------
# The new and edit routes
  # HTML/ERB template to create or update an instance of data
  # They simply render templates that contain forms!
  # All they do is render a form!
  # New and edit are both gets

# Form Anatomy!
  # 1) action (aka path/rails helper)
  # 2) HTTP method (ex: POST)
  # 3) inputs with labels (optional)
  # 4) submit button

# Controller Redirecting
  # Redirecting
    # Ends current request / response cycle and initializes a second
    # Syntax: redirect_to <Rails URL Helper>
    # Example:
       redirect_to user_url(@user)
    # Use the prefeixes provided to you by rails routes

#----------------------------[Back in Demo]------------------------------
# in users_controller.rb
def new 
  # common patter to have access to a blank User instance
  @user = User.new
  # this is optional, Rails will know what template you want to render
  render :new
end

# now create a new.html.erb file to make a form
<h1> New User Form </h1>

<form action="<% users_url %>" method="POST">
  <label>Username:
    <input type="text" name="user[username]" value="<% @user.username %>">
  </label>
  <label>Age:
    <input type="text" name="user[age]" value="<% @user.age %>">
  </label>
  <label>Email:
    <input type="text" name="user[email]" value="<% @user.email %>">
  </label>

  <input type="submit" value="Create User">
</form>
# can test this using /users/new 
# need to put @user in our create method after this.
def create
  if user.save
    redirect_to user_url(@user.id)
  else
    render :new
  end
end

# now  edit in users_controller.rb
def edit
  @user = User.find(params[:id])
  render :edit
end

# make corresponding edit.html.erb
  # can copy paste skeleton from new
  <h1>Edit User Form</h1>

<form action="<% user_url(@user) %>" method="POST">
  <input type="hidden" name="_method" value="patch"
  <label>Username:
    <input type="text" name="user[username]" value="<% @user.username %>">
  </label>
  <label>Age:
    <input type="text" name="user[age]" value="<% @user.age %>">
  </label>
  <label>Email:
    <input type="text" name="user[email]" value="<% @user.email %>">
  </label>

  <input type="submit" value="Edit User">
</form>

# write def update in users_controller.rb
def update
  @user = User.find_by(id: params[:id])
  # try to update user
  if @user.update(user_params)
    redirect_to user_url(user)
  else
    render :edit
  end
end

# make a file partial for form _form.html.erb
<% if type  == 'new' %>
  <% action_url = users_url %>
  <% button_text = 'Create User' %>
  
  <% else %>
  <% action_url = user_url(user) %>
  <% button_text = 'Edit User' %>
  <% end %>

<form action="<%= action_url %>" method="POST">
  <% if type == 'edit' %>


  <input type="hidden" name="_method" value="patch"
  <label>Username:
    <input type="text" name="user[username]" value="<% @user.username %>">
  </label>
  <label>Age:
    <input type="text" name="user[age]" value="<% @user.age %>">
  </label>
  <label>Email:
    <input type="text" name="user[email]" value="<% @user.email %>">
  </label>

  <input type="submit" value= "<% button_text%>" >
</form>

# edit in new.html.rb and edit.html.erb

# edit show.html.erb

# in users_controller.rb
def destroy 
  @user = User.find_by(id: params[:id])
  @user.destroy
  redirect_to users_url
end

# in show.html.erb
<%= render "user", user:@user, action: 'show'%>
<a href="<%= edit_user_url(@user)">Edit User</a>
<form action="<% user_url(@user)%>" method ="POST" 
  <input type="hidden" name="_method" value="DELETE"
  <input type="submit" value="Delete User">
</form>