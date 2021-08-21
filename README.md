![](https://img.shields.io/badge/Microverse-blueviolet)

# Project: COURSE BINGO API

> This is an API of a frontend mobile web application where you can find online courses about programming in different programming languages. The API was built using Ruby on Rails.


## Live demo

You can visit the deployed version of the API [this link](https://coursebingo.herokuapp.com/api/courses)

## Built With

- Ruby on rails

## Getting Started

To get a local copy up and running follow these simple example steps:

- Clone the repository as indicated by the Setup section below

### Prerequisites

- Text editor
- GitHub
- Git
- ruby
- ruby on rails

### Setup

Clone repository from GitHub to your local drive by following these steps:

- Go to the main page of the repository
- Above the listed files, click the green Code button
- You can clone the repository using:
  - GitHub CLI: gh repo `$ git clone github.com/barackm/coursebingo-api `.
  - SSH:`$ git clone git@github.com:barackm/coursebingo-api.git`.
  - HTTPS:`$ git clone https://github.com/barackm/coursebingo-api `.
- Open Terminal
- Change the current working directory to the location you want the cloned directory
- Type one of the git clone commands listed above.
- Press Enter to create your local clone
- Remember: Yarn packages need to be installed by running the command <code>yarn install</code> for local setup. Otherwise, the app generates an error.
- Install all the available gems with the command `bundle install`
- Create a database by typing in the terminal <code>rails db:create</code> and then <code>rails db:migrate</code> to define changes to your database schema
- Open your terminal and type <code>rails s</code>. After that join to localhost at `http://localhost:3000/`

### Available Routes

- `GET: /courses` -> To get the list of all the available courses, it doesn't require authentication.
- `GET: /courses/1` -> To get a specific course, it doesn't require authentication.
- `POST: /courses` -> To create a course, it requires to be authenticated and have the admin role.
- `DELETE: /courses/1` -> To delete a specific course, it requires to be authenticated and have the admin role.
- `GET: /favourites/1` -> To get the favorite courses for a specif user, it requires to be authenticated.
- `DELETE: /favourite/1` -> To delete a specific favorite from the favourites table, it requires to be authenticated.
- `GET: /users` ->  To get the list of all the users, it requires to be authenticated and have the admin role.
- `GET: /users/1` -> To get a specific user, it requires to be authenticated.
- `DELETE: /users/1` -> To delete a specific user, it requires to be authenticated and have the admin role
- `POST: /users` -> To create a new user, it doesn't require to be authenticated.
- `PUT: /users/1` -> To update a specific user, it requires to be authenticated.
- `POST: /sessions/` -> To log in and receive the auth token, it requires to be authenticated.

### Install

- Install Atom or Microsoft Visual Studio text editor to view the code on your local machine.
- Install Git.
- Install ruby
- Install ruby on rails

### Tests

- This project includes unit tests and integration tests, to run the tests you will just need to run the following command in the terminal from the root of the project
  `$ rails db:migrate RAILS_ENV=test`
  `$ bundle exec rspec`


## Author

👤 **Barack Mukelenga**

- GitHub: [@barackm](https://github.com/barackm)
- Twitter: [@BarackMukelenga](https://twitter.com/BarackMukelenga)
- LinkedIn: [Barack Mukelenga](https://www.linkedin.com/in/baraka-mukelenga/)
- Portfolio: [Barackm](https://barackm.me)

## Contributing

Contributions, [issues](https://github.com/barackm/coursebingo-api/issues), and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

Copyright (c) 2021 [Baraka Mukelenga](https://barackm.me)