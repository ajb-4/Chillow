# README

Hello, and welcome to Chillow, a full-stack clone of Zillow built with Postgre(database), Rails(backend), and Javascript/React(frontend). AWS was used for cloud storage of images.

The application is hosted on Render and can be found here: 
<a href="https://chillow-xur2.onrender.com/">Chillow Live Site</a>

## Features
In addition to user authentication, I have implemented 4 MVP features. 

#### User-Authentication
Users can click on the "Sign in" button on the splash page to render a modal. A user can sign-up with a valid email and password or login if they already have an account (otherwise, they are given appropriate error messages). 

<img width="1732" alt="Login Screenshot" src="https://github.com/ajb-4/Chillow/assets/114460756/3cc2bd37-e46c-47d3-86e9-38d313a454b4">


#### Home Listings
First, I built index and show pages for home listings. On the splash page, an index of home listings appears with arrows to scroll through the items. On each listing item, users can toggle through a carousel of images from the property and see basic details. Upon clicking on a listing item, users are brought to the home's show page where they can see more details about the home.

<img width="1338" alt="Home Index SS" src="https://github.com/ajb-4/Chillow/assets/114460756/c6c82744-4d8d-4f68-bc8e-93e4854cd8cf">

<img width="1323" alt="Screenshot 2024-01-08 at 6 31 28 PM" src="https://github.com/ajb-4/Chillow/assets/114460756/113fc285-8300-4d24-bf54-2a91257abea2">

#### Search Filters
After clicking away from a home show page, users are brought to a search page where a "create search" form is fixed at the top of the page. After filling in values, users can createa and save these search filters by clicking "Save search" and view their "Saved searches" in the dropdown under the profile button. Inside each user's "Saved searches" index page, users can also view, update and delete each of these search filters.


<img width="1301" alt="Screenshot 2024-01-08 at 6 32 18 PM" src="https://github.com/ajb-4/Chillow/assets/114460756/154ff4c3-93b9-40f4-a184-7315ef746734">

#### Google Maps
Google Maps API allows users to view and search by location using map window. Pins were given prices of each property and can be clicked to visit the home's show page.

<img width="1868" alt="Screenshot 2024-01-08 at 6 33 04 PM" src="https://github.com/ajb-4/Chillow/assets/114460756/04a2266d-bfc7-4af8-9003-5be167d187ae">

#### Likes
Signed-in users are able to save homes by toggled the heart in the top right of a listing card or on the home's show page. They can then visit their saved home's list by clicking on their profile icon at any time.

<img width="1287" alt="Screenshot 2024-01-08 at 6 34 19 PM" src="https://github.com/ajb-4/Chillow/assets/114460756/31dac821-f420-4d27-b2a9-62b5a43f9f6d">
