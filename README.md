# EzyCourse Social App

This app has been created as a task assesment for Appifylab. The application is made with CLEAN Architecture along with the BloC state management library. I tried my best to showcase the CLEAN Architecture design principals, with the few Api's that I was able to implement.

## Setup Instructions

1. Clone the repository:
   ```bash
   https://github.com/Amit-Aditaya/ezycourse_social_app.git

2. Open the project in Android Studio or VSCode.

3. Build and run the project on an emulator or a physical device.

## Download Link

Apk - https://drive.google.com/file/d/1URr5rKrDhn4DtgNqS68lZXsc2OthazUO/view?usp=sharing

## This App contains the following feature implementations:

- Loggin in of Authenticated User
- Watching community feed posts
- Creating posts
- Watching comments of posts 
- Commenting on posts

## Features not implemented due to time constraints (high work pressure on weekday)

#### From required tasks :-

- Replying to comments (api - https://iap.ezycourse.com/api/app/student/comment/createComment)   
- Reacting to posts (api - https://iap.ezycourse.com/api/app/teacher/community/createLike?=&=&=&=)
- Fetching post reactions (api - https://iap.ezycourse.com/api/app/teacher/community/getAllReactionType?feed_id=180370)
- logout - (api - https://iap.ezycourse.com/api/app/student/auth/logout)

#### Additional unimplemnted features :-

- Secure storage of auth token

  -Due to time cosntrainsts I was unable to save the token securely in local storage, henceforth, I was unable to distribute the ticket elegantly to the other apis.

- Pagination

  -Pagination for when we reach the end of the home screen has not been implemented

- Image optimization

  -Images on the feed has not been optimized for efficiency and thus may contain jank.

- Background color implementention

  -Background color for posts have not been implemented


