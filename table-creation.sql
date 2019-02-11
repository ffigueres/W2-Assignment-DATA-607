#Lines 44 onwards must be run after the data has been loaded


CREATE DATABASE movie_lens;

CREATE TABLE ratingsdata ( 
   userid INT, 
   itemid INT, 
   rating INT, 
   timestamp INT, 
   PRIMARY KEY (userid, itemid));
   
   CREATE TABLE items ( 
   itemid INT PRIMARY KEY, 
   title TEXT, 
   date DATE, 
   videodate DATE, 
   imdb TEXT, 
   unknown BOOLEAN, 
   action BOOLEAN, 
   adventure BOOLEAN, 
   animation BOOLEAN, 
   childrens BOOLEAN, 
   comedy BOOLEAN, 
   crime BOOLEAN, 
   documentary BOOLEAN, 
   drama BOOLEAN, 
   fantasy BOOLEAN, 
   noir BOOLEAN, 
   horror BOOLEAN, 
   musical BOOLEAN, 
   mystery BOOLEAN, 
   romance BOOLEAN, 
   scifi BOOLEAN, 
   thriller BOOLEAN, 
   war BOOLEAN, 
   western BOOLEAN); 
 
CREATE TABLE users ( 
   userid INT PRIMARY KEY, 
   age INT, 
   gender CHAR, 
   occupation TEXT, 
   zip TEXT); 

#This step must be done after the ratingsdata table data has been loaded
ALTER TABLE ratingsdata ADD COLUMN reviewdatetime DATETIME AFTER rating;
UPDATE ratingsdata SET ratingsdata.reviewdatetime = from_unixtime(timestamp) where userid > 0;
