
* ...


Sweater Weather
----------------------------------------
### Matthew Kimball

![Ruby](https://img.shields.io/badge/Ruby-v2.7.2-red)
![Rails](https://img.shields.io/badge/Rails-v5.2.6-red)
---

Sweater Weather is a trip planning app that informs you of the weather at your destination for a trip. Perfect for knowing if you need to pack that extra sweater or not

## Architecture
This app uses a service-oriented architecture, but is only the backend of the application. The backend portion of Sweater Weather is respponsible for consuming endpoints of the following APIs and making the data available to the front end in a more efficient manner.

## Tools Used:
- Rails 5.2.6
- Ruby 2.7.2
- PostgreSQL
- RSpec
- Postman

## Setup

* Clone and/or Fork this repository.
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:{create,migrate}`
* Run the test suite with `bundle exec rspec`.
* Sign up for the necessary API keys (linked at the bottom of this README).
* Then, on the command line, run `bundle exec figaro install` to create an `application.yml` file which will also add it to your .gitignore (for keeping your API keys secret and safe).
* Add the following lines to your `application.yml` file, replaying {key} and {secret} with the information from your various APIs:
   ```
   open_weather_api:    {key}
   mapquest_api_key:    {key}
   unsplash_access_key: {key}
   ```
* Run `rails s` to see the app in action.

## Endpoints

The backend API base path is:

```
http://localhost:3000/api/v1/{query}
```
_{query}_ should be replaced with one of the following endpoints.

#### 1. Forecast

```ruby
   GET forecast?location={a location you would like forecast information for}
```   
Returns a collection of weather objects, including the current, hourly, and daily forecasts. Daily forecasts are limited to the next five days, and hourly forecasts are for the next eight hours.
Example:
```
   {
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "Wednesday, Jan 19",
                "sunrise": " 7:17 AM",
                "sunset": " 5:03 PM",
                "temperature": 25.99,
                "feels_like": 25.99,
                "humidity": 87,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "Wednesday, Jan 19",
                    "sunrise": " 7:17 AM",
                    "sunset": " 5:03 PM",
                    "max_temp": 35.85,
                    "min_temp": 25.99,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                  etc...
                }
            ],
            "hourly_weather": [
                {
                    "time": " 6:00 AM",
                    "temperature": 26.6,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": " 7:00 AM",
                    "temperature": 25.99,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                  etc...
                }
            ]
        }
    }
}
```
#### 2. Backgrounds

```ruby
   GET backgrounds?location={a location you would like an image for}
```   
Returns the first photo from Unplash's image search API using the query parameter provided. It includes the credit information required by Unsplash's terms of use.
Example response:
```
{
    "data": {
        "id": "null",
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver,co",
                "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTIzMDB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2NDI1NTA0NjA&ixlib=rb-1.2.1",
                "author": "Dillon Wanner",
                "author_profile": "https://unsplash.com/@dillydallying"
            }
        }
    }
}
```
#### 3. User Registration

```ruby
   POST users
   {
  "email": "test@test.com", (must be unique)
  "password": "password",
  "password_confirmation": "password"
   }

```   
Allows users to register with the app and generates a unique API key for them. User information must be received as JSON in the body of the request.
Example response:
```
{
    "data": {
        "type": "users",
        "id": 2,
        "attributes": {
            "email": "test@test.com",
            "api_key": "2pfAhjeC5QmvQfGQ8htLHwtt"
        }
    }
}
```
#### 4. User Login

```ruby
   POST sessions
   {
  "email": "test@test.com",
  "password": "password"
   }
```   
Verifies a users credentials and if they match, allows them to log in. The information must be received as JSON in the body of the request.
Example response:
```
{
    "data": {
        "type": "users",
        "id": 3,
        "attributes": {
            "email": "test@test.com",
            "api_key": "zEECyAemI2B1b47aLyZ3lAtt"
        }
    }
}
```
#### 5. Road Trip

```ruby
   POST road_trip
   {
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "9okGIqb8wPSdqlyOZhw2ngtt"
   }
```   
Returns the travel time from the origin to the destination. Also returns the forecasted weather, including temperature and conditions, for the arrival time. The origin, destination, and api_key must be passed in the body of the request and be JSON formatted.
Example response:
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Pueblo,CO",
            "travel_time": "1 hours",
            "weather_at_eta": {
                "temperature": 26.02,
                "conditions": "overcast clouds"
            }
        }
    }
}
```

## APIs

Three different APIs were used in this project. They are:
1. [Open Weather's One Call](https://openweathermap.org/api/one-call-api)
2. [Mapquest API](https://developer.mapquest.com/documentation/)
3. [Unsplash API](https://unsplash.com/documentation#getting-started)

All of the above require the use of API keys to function and can be acquired from the respective sites.
