show dbs

use people

db.people.insert([
    {
        user_id: "abc123",
        age: 55,
        status: "A"
    },
    {
        user_id: "def456",
        age: 66,
        status: "B"
    },
    {
        user_id: "ghi789",
        age: 77,
        status: "C"
    },{
        user_id: "jkl111",
        status: "A",
        age: 50 
    }
]);
 
// Add a join_date field
db.people.updateMany(
    { },
    { $set: { join_date: new Date() } }
)

db.people.find().pretty()

// Drop join_date field
db.people.updateMany(
    { },
    { $unset: { "join_date": "" } }
)

db.people.find().pretty()

// Select id,userid and status
db.people.find(
    {},
    {
        user_id: true,
        status: true
    }
)

// Select userid and status
db.people.find(
    {},
    {
        _id: false,
        user_id: true,
        status: true
    }
).pretty()


// Select where status is A
db.people.find(
    { status: "A" }
)

db.people.find(
    { status: "A" },
    {_id: false,age: true}
).pretty()

// Select where status not equal to A
db.people.find(
    {status: {$ne: "A"}}
)

// Where status A and age 50
db.people.find(
    { 
        status: "A",
        age: 50 
    }
)

// Status A or age 50
db.people.find(
    { $or: [{status: "A"},{age: 50}] }
)

// Where age>25
db.people.find(
    { age: {$gt: 25} }   //Similarly replace gt with gte,lte,ne,lt
)

// Where userid like %bc%
db.people.find( { user_id: /bc/ } )

// Where userid like bc%
db.people.find( { user_id: /^bc/ } )

// Where status A order by userid ascending
db.people.find( { status: "A" } ).sort( { user_id: 1 } )

// Select count(*)
db.people.count()

// Select count(userid)
db.people.count( { user_id: { $exists: true } } )

// Update people set status as C where age gt 25
db.people.updateMany(
   { age: { $gt: 25 } },
   { $set: { status: "C" } }
)

// To increment age by 3 where status A
db.people.updateMany(
   { status: "A" } ,
   { $inc: { age: 3 } }
)