CREATE database ventas_import;
USE ventas_import;

CREATE TABLE  telefono (
  idtelefono INT NOT NULL,
  movil1 VARCHAR(45) NULL,
  movil2 VARCHAR(45) NULL,
  fijo VARCHAR(45) NULL,
  PRIMARY KEY (idtelefono)
)
 ENGINE = InnoDB;

CREATE TABLE  direccion (
  iddireccion INT NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  calle VARCHAR(45) NULL,
  numero INT NULL,
  comuna VARCHAR(45) NULL,
  PRIMARY KEY (iddireccion)
)
 ENGINE = InnoDB;

CREATE TABLE categoria (
  idcategoria INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NOT NULL,
  idproducto INT NOT NULL,
  PRIMARY KEY (idcategoria)
)
ENGINE = InnoDB;

CREATE TABLE  clientes (
  id_nipcliente INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  idtelefono INT NOT NULL,
  iddireccion INT NOT NULL,
  PRIMARY KEY (id_nipcliente),
  CONSTRAINT idtelefono
    FOREIGN KEY (idtelefono)
    REFERENCES telefono (idtelefono),
  CONSTRAINT iddireccion
    FOREIGN KEY (iddireccion)
    REFERENCES direccion (iddireccion)
   )
ENGINE = InnoDB;

CREATE TABLE  venta (
  nfactura INT NOT NULL,
  fecha DATE NOT NULL,
  descuento DECIMAL NULL,
  montofinal DECIMAL NOT NULL,
  id_nipcliente INT NOT NULL,
  PRIMARY KEY (nfactura),
CONSTRAINT id_nipcliente
    FOREIGN KEY (id_nipcliente)
    REFERENCES clientes (id_nipcliente)
)
ENGINE = InnoDB;

CREATE TABLE proveedor (
  nip_proveedor INT NOT NULL,
  nit INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  web VARCHAR(45) NULL,
  idtelefono_fk INT NOT NULL,
  iddireccion_fk INT NOT NULL,
   PRIMARY KEY (nip_proveedor),
  CONSTRAINT idtelefono_fk
    FOREIGN KEY (idtelefono_fk)
    REFERENCES telefono (idtelefono),
  CONSTRAINT iddireccion_fk
    FOREIGN KEY (iddireccion_fk)
    REFERENCES direccion (iddireccion)
)
ENGINE = InnoDB;

CREATE TABLE  producto (
  idproducto INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  precio DECIMAL NOT NULL,
  stock INT NOT NULL,
  idcategoria_fk INT NOT NULL,
  nip_proveedor_fk INT NOT NULL,
  PRIMARY KEY (idproducto),
  CONSTRAINT idcategoria_fk
    FOREIGN KEY (idcategoria_fk)
    REFERENCES categoria (idcategoria),
  CONSTRAINT nip_proveedor_fk
    FOREIGN KEY (nip_proveedor_fk)
    REFERENCES proveedor(nip_proveedor)
)
ENGINE = InnoDB;

CREATE TABLE  venta_producto (
  idproducto INT NOT NULL,
  nfactura INT NOT NULL,
  cantidadunidad INT NOT NULL,
  ventaunidad INT NOT NULL,
  montototal DECIMAL NOT NULL,
  PRIMARY KEY (idproducto, nfactura),
  CONSTRAINT idproducto
    FOREIGN KEY (idproducto)
    REFERENCES producto (idproducto),
  CONSTRAINT nfactura
    FOREIGN KEY (nfactura)
    REFERENCES venta (nfactura)
    )
ENGINE = InnoDB;