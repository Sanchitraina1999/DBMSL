show dbs

use b2_31155

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

db.votes.find();
db.votes.find().pretty();