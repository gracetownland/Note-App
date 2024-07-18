const express = require('express')
const mongoose = require('mongoose')
var app = express()
var Data = require('./noteSchema')

mongoose.connect("mongodb://localhost/newDB")

mongoose.connection.once("open", () =>{

    console.log("Connected to DB!!!")

}).on("error", (error)=>{

    console.log("failed to connect "+ error)

})

//CRUD 

//create
//POST request

app.post("/create", (req,res)=>{
    

    var note = new Data({

        note: req.get("note"),
        title: req.get("title"),
        date:   req.get("date")

    })

    note.save().then(()=>{

        if(note.isNew == false){
            console.log("Saved Data!")
            res.send("saved data!")

        }
        else {

            console.log("Failed to save data.")

        }

    })

})
//http://192.168.0.179:8081/create
//http://128.189.83.3:8081/create
var server = app.listen(8081, "192.168.0.179", () => {

    console.log("server is running!!!!!")

})



//delete
//POST request (sending the data to be deleted)
// Delete a note (DELETE)
app.post('/delete', async (req, res) => {
    try {
        const result = await Data.findOneAndDelete({ _id : req.get("id") });
        if (result) {
            res.send("Deleted!!");
        } else {
            res.status(404).send("Document not found");
        }
    } catch (err) {
        console.log("FAILED LMAO " + err);
        res.status(500).send("Failed to delete!!");
    }
});


//update
//POST request 
// Update a note (PUT)
app.post("/update", async (req, res) => {
    try {
        const updatedNote = await Data.findByIdAndUpdate(
            req.get("id"),
            {
                note: req.get("note"),
                title: req.get("title"),
                date: req.get("date")
            },
            { new: true }
        );
        if (!updatedNote) {
            return res.send("Note not found");
        }
        res.send("Updated note");
    } catch (error) {
        res.send("Error updating note: " + error);
    }
});
//fetch all
//GET request
app.get('/fetch', (req,res)=>{
    Data.find({}).then((DBitems)=>{
        res.send(DBitems)
    })
})