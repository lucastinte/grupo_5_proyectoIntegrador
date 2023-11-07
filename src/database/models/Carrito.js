module.exports = (sequelize, DataTypes) => {
  const Carrito = sequelize.define(
    "Carrito",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      usuarioId: {
        type: DataTypes.INTEGER,
      },
      cantidad: {
        type: DataTypes.INTEGER,
      },
      total: {
        type: DataTypes.DECIMAL(10, 2),
      },
    },
    {
      tableName: "Carrito",
      timestamps: false,
    }
  );

  Carrito.associate = (models) => {
    Carrito.belongsTo(models.Usuario, {
      as: "usuario",
      foreignKey: "usuarioId",
    });
    // Asociación con el modelo Producto (Un carrito contiene productos a través de ProductoCarrito)
    Carrito.belongsToMany(models.Producto, {
      as: "productos",
      through: models.ProductoCarrito,
      foreignKey: "carritoId",
      otherKey: "productoId",
    });
  };

  return Carrito;
};
