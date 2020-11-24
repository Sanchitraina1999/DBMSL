// CRUD

show dbs

use b2_31155

// C - CREATE

db.createCollection("votes");

db.votes.insert({
    wardno: 1,
    name: "A",
    percent: 70,
});

db.votes.insertMany([
    {
        wardno: 2,
        name: "B",
        percent: 65,
    },
    {
        wardno: 3,
        name: "C",
        percent: 43,
    },
    {
        wardno: 4,
        name: "D",
        percent: 71,
    },
]);

// R - READ

db.votes.find();
db.votes.find().pretty();

// U - UPDATE 

//simple update
db.votes.update(
    {
        wardno: 4
    },
    {
        $set: {percent: 72}
    }    
);

//update without upsert
db.votes.update(
    {
        wardno: 5
    },
    {
        $set: {percent: 72}
    }
);

//update with upsert
db.votes.update(
    {
        wardno: 5
    },
    {
        $set: {percent: 72}
    },
    {
        upsert: true,
    }  
);

// D - DELETE

db.votes.remove({wardno: 5});

db.votes.remove({percent: 43});

db.votes.remove({});


// EMBEDDED DOCUMENTS

db.inventory.insertMany( [
    { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
    { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A" },
    { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
    { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
    { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" }
 ]);

 //select all document where { h: 14, w: 21, uom: "cm" }

 db.inventory.find({size:{h:14, w: 21, uom: "cm"}}).pretty();

 //it should be exact match of specified <value> document

 db.inventory.find({size:{ w: 21, h: 14, uom: "cm"}}).pretty();

// select all documents where the field uom nested in the size field equals "in"

db.inventory.find({"size.uom": "in"}).pretty();

// select all documents where the field h nested in the size field is less than 15

db.inventory.find({"size.h":{$lt: 15}}).pretty();

// select all documents where the nested field h is less than 15, the nested field 
// uom equals "in", and the status field equals "D"

db.inventory.find({"size.h": {$lt: 15}, "size.uom": "in", "status": "D"}).pretty();