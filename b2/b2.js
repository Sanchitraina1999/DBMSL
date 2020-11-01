CRUD

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
)

//update without upsert
db.votes.update(
    {
        wardno: 5
    },
    {
        $set: {percent: 72}
    }
)

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
)

// D - DELETE

db.votes.remove({wardno: 5});

db.votes.remove({percent: 43})

db.votes.remove({})