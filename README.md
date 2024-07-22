# How to get started

## Step1:

clone the repository using the following command

```
git clone https://github.com/syed-emad/MindValley-Assingment.git
```

### Running The Database

Open command prompt

To run Postgress database run this command

```
docker-compose up
```

This will start a configured docker container for postgres database in detached mode

**Note: You will need docker desktop to run the docker image, incase you dont have it follow the steps in the link below**

https://www.docker.com/products/docker-desktop/

To check if database is running you can open docker desktop or type in the follow command

```
docker ps
```

![1721615035335](image/README/1721615035335.png)

### Running the Backend

To run the backend please make sure you have Elixir and Erland installed in you device

Follow the steps here in order to setup Elixir: https://elixir-lang.org/install.html

Once you have Elixir setup.

Check if Elixir is installed properly by running

```
elixir -v
```

#### Run the following commands to start Frontend

Install dependencies

```
mix deps.get
```

Create tables in the database

```
mix ecto.migrate
```

Seed the database

```
mix run priv/repo/seeds.exs
```

Start the server

```
mix phx.server
```

Server will run on port 4000

![1721615055459](image/README/1721615055459.png)

### Running the Frontend

Go to frontend folder/shoppin-cart-app

open command promp

#### Run the following commands to start Backend

Install dependencies:

```
npm i
```

Start the project

```
npm run dev
```

Project will output the acceible url for example

```
http://localhost:5173/
```

#### Running Test

Frontend test checks that UI elements have loaded properly in screen and actionable elements are working fine or not.

```
npm test
```

![1721613717019](image/README/1721613717019.png)
