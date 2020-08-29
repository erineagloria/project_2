# SEI Project 2: My first Full-Stack Application
## loopd | Client Event Engine

Visit <a href="https://boiling-temple-92123.herokuapp.com/">loopd</a>

<img src="https://github.com/erineagloria/project_2/blob/master/Loopd%20Final%20Design.png?raw=true" alt="loopd-final-design">
 
I've built a client event database targeted towards an events company's return clients to assist them in keeping track of the events they have hosted the event company over the years. I've leaned into my events and sales experience to create this app. Even though a company may have hosted events with us in the past, the main contact/event organiser may have changed over the years resulting in a loss of valuable information, client notes and feedback. 

## Project Summary 

Loopd is a full Ruby CRUD application, complete with a login feature using bcrypt, user sessions, images added via Cloudinary API and a PSQL database with two tables joined togeter. 

## Technologies used:
* Whimsical (used to make the wireframe)
* Trello (used to make to-do lists)
* HTML5
* CSS
* Ruby
* PostgreSQL
* Sinatra
* Heroku (to host my website)
* BCrypt (password encryption)
* Cloudinary API (to create the logo and add images)

## App Features:

loopd is built for existing clients. Upon loading the website the user will be asked to enter their login details(company name & password) right away. The app is designed so that a client will be provided login details from the business, they will not be able to sign up for an account. 

Below the login details there is a feed of previous events that have taken place for inspiration. When the images are when clicked it will give a few event details. The client will be anonymous of course!

Upon logging in, the user will have access to their dashboard with a record of their events listed in order with the latest/upcoming events at the top and the oldest events at the bottom. Clients can submit and delete a request to host a new event. They can update details of their upcoming events. They can also add notes/feedback to previous events; however, all other details will be locked. 

The app will allow them to draw inspiration from other clients' events and keep a record of their events with our business. 

## Planning Process

#### Screenshots of the planning process

<img src="https://raw.githubusercontent.com/erineagloria/project_2/master/wireframes/Wireframe%20-%20Home%20Page%3ALogin.png" alt="home-page-design">

<img src="https://github.com/erineagloria/project_2/blob/master/wireframes/Wireframe%20-%20Client%20Event%20Details.png?raw=true" alt="company-page-design">

<img src="https://github.com/erineagloria/project_2/blob/master/wireframes/Trello%20-%20To%20Do%20List.jpg?raw=true" alt="to-do-list">

<img src="https://github.com/erineagloria/project_2/blob/master/Loopd%20Routing%20Table.png?raw=true" alt="routing-table">

### Improvements:
* Revise the nav bar - add hover features and css to the buttons.
* Re-adjust the alignment of the input fields. 
* Add a 'Business Administrator account' to create new users (companies) and close accounts. 
* Add a feature for clients to like/comment other client's events.
