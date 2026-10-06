const express = require("express");
const app = express();

let users = [
  {
    id: "1",
    name: "Kovács István",
    email: "kovacs.istvan@example.com",
  },
  {
    id: "2",
    name: "Nagy Anna",
    email: "nagy.anna@example.com",
  },
  {
    id: "3",
    name: "Tóth Bence",
    email: "toth.bence@example.com",
  },
];

app.use(express.json());

app.get("/api/users", (req, res) => {
  res.json(users);
});

app.get("/api/users/:id", (req, res) => {
  const id = req.params.id;
  const user = users.find((u) => u.id === id);

  if (!user) {
    return res.status(404).json({ message: "User not found" });
  }

  res.json(user);
});

app.listen(3000, () => {
  console.log("The app is running on port 3000!");
});