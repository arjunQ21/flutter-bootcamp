const express = require("express");
const { body } = require("express-validator");

const handleValidationErrors = require("./handleValidationErrors");
const app = express();
const port = 3000;
const cors = require("cors")
const fs = require("fs");
app.use(cors())
app.use(express.json());
app.use(require("./customErrorLayer"));

app.get("/", (req, res) => {
  res.send("Hello Sumit!");
});

app.post(
  "/submit-log",
  function(req, res, next){
    console.log("New request received\nmessage: " + req.body.message);
    return next() ;
  },
  [
    body("message")
      .exists()
      .isLength({ min: 5, max: 200 })
      .withMessage("5 to 200 characters expected."),
  ],
  handleValidationErrors(),
  function (req, res) {

    const oldContent = fs.readFileSync("./logs.txt", "utf8");

    fs.writeFile("./logs.txt", ( +new Date()) + ": " + req.body.message + "\n"+ oldContent , (err) => {
      if (err) {
        return res.json({ status: "error", message: err.message });
      }
      return res.json({ status: "success", message: "submitted successfully" });
    });
  },
);

app.get("/submissions", function(req, res){
  const oldContent = fs.readFileSync("./logs.txt", "utf8");

return res.json({status: "success", data: {"messages": oldContent.split("\n")}})

})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
