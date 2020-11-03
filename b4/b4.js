use b4_31155;



//SYNTAX - mapReduce

        // db.collection.mapReduce(
        //     function() {emit(key, value);},
        //    //Define map function
        //     function(key,values) {return reduceFunction}, {
        //    //Define reduce function
        //     out: collection,
        //     query: document,
        //     sort: document,
        //     limit: number
        //     }
        //    )

// AUTHOR

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

// • Select all the active books,
// • Group them together on the basis of author_name and
// • Then count the number of books by each author 


db.author.mapReduce(
    function(){emit(this.author_name,1)},
    function(key,values){
        return Array.sum(values)
    },
    {
        query: {status: "active"}, out:"author_total"
    }
);

db.author_total.find().pretty();


//STUD

db.stud.insert({ Name: "Amit", Marks:80 });
db.stud.insert({ Name: "Amit", Marks:90 });
db.stud.insert({ Name: "Shreya", Marks:40 });
db.stud.insert({ Name: "Neha", Marks:80 });
db.stud.insert({ Name: "Neha", Marks:35});

db.stud.mapReduce(
    function(){emit(this.Name, 1)},
    function(key,values){
        return Array.sum(values)
    },
    {
        out: "Name_Total"
    }
);

db.Name_Total.find().pretty();

db.stud.mapReduce(
    function(){ emit(this.Name,1)},
    function(key, values) {
    return Array.sum(values)
    },
    {
        out: "Name_Total"
    }
);


db.Name_Total.find().sort().pretty();


db.stud.mapReduce(
    function() { emit(this.Name,this.Marks) },
    function(key, values) {
        return Array.sum(values)
    },
    {
        out: "Total_Marks" 
    }
)

db.Total_Marks.find().sort({_id: 1}).pretty();
db.Total_Marks.find().sort({value: -1}).pretty();

db.stud.mapReduce(
    function(){ emit(this.Name,1)},
    function(key, values) {
        return Array.sum(values)
    },
    {
        query:{Marks:{$gt:70}},out: 'Greater_than_70'
    }
);

db.Greater_than_70.find().pretty();