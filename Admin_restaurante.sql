-- Crear la base de datos Restaurante
CREATE DATABASE A_RestauranteF;
GO

-- Usar la base de datos Restaurante
USE A_RestauranteF;
GO

-- Crear tabla Categoria
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL
);

-- Crear tabla Subcategoria (relacionada con Categoria)
CREATE TABLE Subcategoria (
    SubcategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    CategoriaID INT NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID) ON DELETE CASCADE
);

-- Crear tabla Platos (relacionada con Subcategoria)
CREATE TABLE Platos (
    PlatoID INT PRIMARY KEY IDENTITY(1,1),
    SubcategoriaID INT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10,2) NOT NULL,
    TiempoDeEspera NVARCHAR(255),
    FOREIGN KEY (SubcategoriaID) REFERENCES Subcategoria(SubcategoriaID) ON DELETE CASCADE
);

-- Crear tabla Combos
CREATE TABLE Combos (
    ComboID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Precio DECIMAL(10,2) NOT NULL
);

-- Crear tabla ComboPlatos 
CREATE TABLE ComboPlatos (
    ComboID INT,
    PlatoID INT,
    PRIMARY KEY (ComboID, PlatoID),
    FOREIGN KEY (ComboID) REFERENCES Combos(ComboID) ON DELETE CASCADE,
    FOREIGN KEY (PlatoID) REFERENCES Platos(PlatoID) ON DELETE CASCADE
);

-- Crear tabla Promociones
CREATE TABLE Promociones (
    PromocionID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255),
    Descuento DECIMAL(5,2) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);

-- Crear tabla Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Rol NVARCHAR(50) NOT NULL,
    FechaContratacion DATE NOT NULL
);

-- Crear tabla Mesas
CREATE TABLE Mesas (
    MesaID INT PRIMARY KEY IDENTITY(1,1),
    NumeroMesa INT NOT NULL,
    Capacidad INT NOT NULL,
    Estado NVARCHAR(20) NOT NULL
);

-- Crear tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(15),
    Direccion NVARCHAR(255),
    UbicacionGeo NVARCHAR(100)
);

-- Crear tabla Menu 
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY IDENTITY(1,1),
    TipoID INT NULL,
    VentaLocal NVARCHAR(255),
    VentaEnlinea NVARCHAR(255),
    PlatoDelDia NVARCHAR(255)
);