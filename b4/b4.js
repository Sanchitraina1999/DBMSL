use b4_31155;

db.author.save({
    "book_title" : "MongoDB Tutorial", "author_name" : "aparajita",
    "status" : "active", "publish_year": "2016" 
});
db.author.save({
    "book_title" : "Software Testing Tutorial", "author_name" : "aparajita",
    "status" : "active", "publish_year": "2015" 
});
db.author.save({
    "book_title" : "Node.js Tutorial", "author_name" : "Kritika",
    "status" : "active", "publish_year": "2015" 
});
db.author.save({
    "book_title" : "PHP7 Tutorial", "author_name" : "aparajita",
    "status" : "passive", "publish_year": "2016" 
});

db.author.find().pretty();

// Now, use the mapReduce function
// • To select all the active books,
// • Group them together on the basis of author_name and
// • Then count the number of books by each author by using the
// following code in MongoDB.

db.author.mapReduce()