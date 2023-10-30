module.exports = (sequelize, DataTypes) => {
  const Tipo = sequelize.define(
    "Tipo",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      nombre: {
        type: DataTypes.STRING,
      },
    },
    {
      tableName: "Tipo", // Nombre de la tabla en la base de datos
      timestamps: false, // No se utilizarán marcas de tiempo
    }
  );

  Tipo.associate = (models) => {
    // Asociación con el modelo Producto (Un tipo tiene muchos productos)
    Tipo.hasMany(models.Producto, {
      as: "productos",
      foreignKey: "tipoId",
    });
  };

  return Tipo;
};