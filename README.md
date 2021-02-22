# README

This is a sample job posting app. Users can post jobs, and other users can apply to those jobs. 

To check it out, do the following: 

1. Clone this repository
2. Open project in code editor 
3. Run 'bundle install'
4. Run 'yarn install'
5. Create a file 'credentials.yml' in '/config' folder
6. In file, add the following

github: <br />
  app_id: you will need to create an oauth app with github and replace this line with the id <br />
  app_secret: see above <br />

gmail: <br />
  email: any gmail address that you want to send all application outgoing emails from <br />
  password: gmail password <br />

secret_key_base: your secret key base <br />

7. Run 'rails db:reset' It might take a minute to seed. 
8. Start a local server with 'rails s'
9. Navigate to "http://localhost:3000"
10. Test it out



