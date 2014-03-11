#SurveyApp

##Environment setup:

Create a `database.yml` by copying it from example:

```shell
cp config/database.yml.example config/database.yml
```

Installing gems:
```shell
bundle
```

Initialize database scheme and initial data using:
```shell
bundle exec rake db:setup
```

This will create a test user:
```shell
user@test.com / password
```

By default the application uses Mailhopper gem for sending emails in background.
To run email worker do:
```shell
bundle exec rake jobs:work
```


Initial requirements can be found in (REQUIREMNETS.md)[https://github.com/k-rudy/coding-test-1-konstantin-rudy/blob/master/README.md]
