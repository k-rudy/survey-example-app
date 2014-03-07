# Congrats!

If you're reading this, you have reached the next step of our recruitment process: our Coding Test.

In this test, we are asking you to build a simple application using Ruby on Rails and PostgreSQL (if you are using some contribs/extensions please tell us). We're providing the HTML to save you some time.

Please think of this app like if it was a real project, this kind of project could be your first mission with Leadformance.

Spending 4 hours or so should be enough for us to get a good idea of your coding style.

# About the application

It's an application allowing a user (the Admin) to send a survey to some users (the User) by email. What is sent to the User is actually just a link to a web page where they can fill the survey. The app has only 2 pages:

**1. The admin page**

This page allows the Admin to:

- Send surveys to a particular email address
- View all surveys that have been sent
- View the response to surveys when there was a response
- Filter the surveys on email addresses (optional, leave this out if you're running out of time)

We want to keep it simple so we don't worry about Admins management here. Using simple http authentication to restrict the access to this page is fine.

The text of the email sent to the User is:
<pre>
Hello, 
Please answer our survey at the following url: http://mydomain.com/survey/123abc 
Thanks for your time!
</pre>

**2. The survey form**

This page allows the User to:

- Enter a rating (stars)
- Enter a comment
- Submit his survey

# Bonus points if you 

- Think about preventing url forging and spam on the survey form
- Allow the Admin to filter surveys on keywords entered in the survey form comment field
- Think about performance optimization, what if this app had a lot of users?
- Do something fancy like a live search on the filter field of the admin page

# Code Delivery

Just issue a Pull Request ;) Please tell us how much time you spent building your app in the comments.

