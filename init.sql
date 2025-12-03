-- Nos conectamos a la base creada por Docker
\connect asesoriasdb;

----------------------------
-- 1. CREACIÓN DE ROLES (usuarios)
----------------------------

-- Solo creamos los usuarios que NO son admin
CREATE ROLE asesorias LOGIN PASSWORD 'asesorias_pass';
CREATE ROLE profesores LOGIN PASSWORD 'profesores_pass';
CREATE ROLE alumnos LOGIN PASSWORD 'alumnos_pass';
CREATE ROLE coordinadores LOGIN PASSWORD 'coordinadores_pass';
CREATE ROLE divisiones LOGIN PASSWORD 'divisiones_pass';

----------------------------
-- 2. CREACIÓN DE SCHEMAS
----------------------------

CREATE SCHEMA IF NOT EXISTS asesorias AUTHORIZATION asesorias;
CREATE SCHEMA IF NOT EXISTS admin AUTHORIZATION admin;   -- ESTE schema sí lo dejamos
CREATE SCHEMA IF NOT EXISTS profesores AUTHORIZATION profesores;
CREATE SCHEMA IF NOT EXISTS alumnos AUTHORIZATION alumnos;
CREATE SCHEMA IF NOT EXISTS coordinadores AUTHORIZATION coordinadores;
CREATE SCHEMA IF NOT EXISTS divisiones AUTHORIZATION divisiones;

----------------------------
-- 3. PERMISOS Y PRIVILEGIOS
----------------------------

-- Permisos base
GRANT USAGE ON SCHEMA asesorias TO asesorias;
GRANT USAGE ON SCHEMA admin TO admin;
GRANT USAGE ON SCHEMA profesores TO profesores;
GRANT USAGE ON SCHEMA alumnos TO alumnos;
GRANT USAGE ON SCHEMA coordinadores TO coordinadores;
GRANT USAGE ON SCHEMA divisiones TO divisiones;

GRANT CREATE ON SCHEMA asesorias TO asesorias;
GRANT CREATE ON SCHEMA admin TO admin;
GRANT CREATE ON SCHEMA profesores TO profesores;
GRANT CREATE ON SCHEMA alumnos TO alumnos;
GRANT CREATE ON SCHEMA coordinadores TO coordinadores;
GRANT CREATE ON SCHEMA divisiones TO divisiones;

----------------------------
-- 4. DEFAULT PRIVILEGES (Tablas)
----------------------------

ALTER DEFAULT PRIVILEGES FOR ROLE asesorias IN SCHEMA asesorias 
GRANT ALL ON TABLES TO asesorias;

ALTER DEFAULT PRIVILEGES FOR ROLE admin IN SCHEMA admin 
GRANT ALL ON TABLES TO admin;

ALTER DEFAULT PRIVILEGES FOR ROLE profesores IN SCHEMA profesores 
GRANT ALL ON TABLES TO profesores;

ALTER DEFAULT PRIVILEGES FOR ROLE alumnos IN SCHEMA alumnos 
GRANT ALL ON TABLES TO alumnos;

ALTER DEFAULT PRIVILEGES FOR ROLE coordinadores IN SCHEMA coordinadores 
GRANT ALL ON TABLES TO coordinadores;

ALTER DEFAULT PRIVILEGES FOR ROLE divisiones IN SCHEMA divisiones 
GRANT ALL ON TABLES TO divisiones;

----------------------------
-- 5. DEFAULT PRIVILEGES (Secuencias)
----------------------------

ALTER DEFAULT PRIVILEGES FOR ROLE asesorias IN SCHEMA asesorias 
GRANT ALL ON SEQUENCES TO asesorias;

ALTER DEFAULT PRIVILEGES FOR ROLE admin IN SCHEMA admin 
GRANT ALL ON SEQUENCES TO admin;

ALTER DEFAULT PRIVILEGES FOR ROLE profesores IN SCHEMA profesores 
GRANT ALL ON SEQUENCES TO profesores;

ALTER DEFAULT PRIVILEGES FOR ROLE alumnos IN SCHEMA alumnos 
GRANT ALL ON SEQUENCES TO alumnos;

ALTER DEFAULT PRIVILEGES FOR ROLE coordinadores IN SCHEMA coordinadores 
GRANT ALL ON SEQUENCES TO coordinadores;

ALTER DEFAULT PRIVILEGES FOR ROLE divisiones IN SCHEMA divisiones 
GRANT ALL ON SEQUENCES TO divisiones;

----------------------------
-- 6. Permisos sobre schema public
----------------------------

GRANT USAGE ON SCHEMA public 
TO asesorias, admin, profesores, alumnos, coordinadores, divisiones;

----------------------------
-- 7. SEARCH PATH por rol
----------------------------

ALTER ROLE asesorias SET search_path = asesorias, public;
ALTER ROLE admin SET search_path = admin, public;
ALTER ROLE profesores SET search_path = profesores, public;
ALTER ROLE alumnos SET search_path = alumnos, public;
ALTER ROLE coordinadores SET search_path = coordinadores, public;
ALTER ROLE divisiones SET search_path = divisiones, public;
