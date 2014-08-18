# Kitter

A Twitter for cats. 

Giving cats a safe place to chat without their owners, since 2013.


My first Ruby on Rails project, and my Project 1 for my [General Assembly WDI Course](https://generalassemb.ly/education/web-development-immersive). Featuring optional passwordless login, custom hashtag and username filtering methods, and tweet media support (photos and videos!). I did not use the twitter-rails gem, everything was hand-rolled.

This project was conceptualized, scoped and developed in one week.

## Installation

1. `git clone git@github.com:trinityXmontoya/kitter.git`
2. `cd kitter`
3. Run `bundle`
4. Run `touch .env` from your terminal or create a `.env` file.
5. Add `.env` to your `.gitignore` file
  This app requires a `.env` file to store your environment variables. The `dotenv-rails gem` will load the variables from your `.env` file into the app when it is first loaded.
6. You will need to declare a variable for your email configuration (the email account that will send out the passwordless login link to users).

  Your `.env` file should look as follows:

  ```
  EMAIL_USERNAME=XXXX
  EMAIL_PASSWORD=XXXX
  ```
7. run `rails s`
The app will now be running at [localhost:3000](http://localhost:3000)
