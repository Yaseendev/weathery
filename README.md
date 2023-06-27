# Weathery

## About this app

Weathery is a weather app for android and iOS made with Flutter

## Features

- Display your current location weather and detailed forecast
- Search for cities by name and display their forecast
- Handles and adapts to current location change 
- Offline support, if there is no internet you can still see the weather from the last time the app was opened 
- Multi-language support (currently English and Arabic)
- Light/Dark themes support
- Temperature unit conversion support 
- Page Transition animations

![Finished App](/Demo/WeatheryDemo.gif)

## Notes

- The weather api used in this app is openweathermap..if you want to clone this repository get your appid from openweathermap.org and use it with the api requests before you build the app
- The state management solution used in this app is Riverpod
- The database used is sqlite database with moor_flutter package
