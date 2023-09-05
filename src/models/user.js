//Guardar al usuario en la db
//Buscar al usuario que se quiera logear con su email
//Buscar al usuario por su id
//Editar informacion de un usuario
//Eliminar un usuario

const fs = require("fs");

const UserModels = {
  fileName: "./data/users.json",

  getData: function () {
    return JSON.parse(fs.readFileSync(this.fileName, "utf-8"));
  },
  findAll: function () {
    return this.getData();
  },
  generateId: function () {
    let allUsers = this.findAll();
    let lastUser = allUsers.pop();
    if (lastUser) {
      return lastUser.id + 1;
    }
    return 1;
  },
  findByPk: function (id) {
    let allUsers = this.findAll();
    let userFound = allUsers.find((oneUser) => oneUser.id === id);
    return userFound;
  },
  findByField: function (field, text) {
    let allUsers = this.findAll();
    let userFound = allUsers.find((oneUser) => oneUser[field] === text);
    return userFound;
  },
  create: function (userData) {
    let allUsers = this.findAll();
    let newUser = {
      id: this.generateId(),
      ...userData,
    };
    allUsers.push(newUser);
    fs.writeFileSync(this.fileName, JSON.stringify(allUsers, null, 2));
    return newUser;
  },
  delete: function (id) {
    let allUsers = this.findAll();
    let finalUsers = allUsers.filter((oneUser) => oneUser.id !== id);
    fs.writeFileSync(this.fileName, JSON.stringify(finalUsers, null, 2));
  },
};
module.exports = UserModels;
