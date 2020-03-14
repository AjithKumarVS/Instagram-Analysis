


/*
source /home/ajithkumar/Downloads/Transfer/sample.sql
show tables;
*/

SELECT username OldestUsers,created_at DatedFrom FROM users ORDER BY created_at limit 5;

SELECT date PopularDate,count(date) Freq FROM (SELECT id,username,created_at,substr(created_at,1,10) AS date FROM users) AS p GROUP BY date ORDER BY Freq DESC,date DESC limit 1;

SELECT users.username UsersWithoutAnyPhotos FROM users LEFT JOIN photos ON users.id=photos.user_id WHERE photos.id is null;

SELECT id MostPopularPhotoID,user_id UserIDWhoPostedThisPicture FROM photos WHERE id=(SELECT photo_id FROM likes GROUP BY photo_id ORDER BY count(photo_id) DESC limit 1);

SELECT count(id)/count(DISTINCT user_id) Average FROM photos;

SELECT tags.tag_name TagName,count(tags.tag_name) Freq FROM photo_tags LEFT JOIN tags ON photo_tags.tag_id=tags.id GROUP BY tags.tag_name ORDER BY count(tags.tag_name) DESC limit 10; 

SELECT DISTINCT users.username UsersWhoLikedAllPictures FROM users INNER JOIN (SELECT user_id FROM (SELECT user_id,count(photo_id) AS freq FROM likes GROUP BY user_id) AS s WHERE s.freq=257) AS p ON users.id=p.user_id;
