CREATE DATABASE "DjProject"
WITH
OWNER = postgres
ENCODING = 'UTF8'
LC_COLLATE = 'English_United States.1252'
LC_CTYPE = 'English_United States.1252'
TABLESPACE = pg_default
CONNECTION LIMIT = -1
IS_TEMPLATE = False;

CREATE TABLE IF NOT EXISTS public."Roles"
(
	"Id" integer NOT NULL,
	"Name" "char"[],
	CONSTRAINT "Roles_pkey" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Roles"
	OWNER to postgres;
		
CREATE TABLE IF NOT EXISTS public."Users"
(
	"Id" integer NOT NULL,
	"Phone" "char"[],
	"Password" "char"[],
	"Email" "char"[],
	"FirstName" "char"[],
	"LastName" "char"[],
	"Address" "char"[],
	CONSTRAINT "Users_pkey" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Users"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Authorities"
(
    "Id" integer NOT NULL,
    "UserId" integer,
    "RoleId" integer,
    CONSTRAINT "Authorities_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "RoleId" FOREIGN KEY ("RoleId")
        REFERENCES public."Roles" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "UserId" FOREIGN KEY ("UserId")
        REFERENCES public."Users" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Authorities"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Oders"
(
    "Id" integer NOT NULL,
    "OderDate" date,
    "TotalAmount" bigint,
    "UserId" integer,
    CONSTRAINT "Oders_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "UserId" FOREIGN KEY ("UserId")
        REFERENCES public."Users" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Oders"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Books"
(
    "Id" integer NOT NULL,
    "Title" "char"[],
    "Author" "char"[],
    "Price" money,
    "Description" "char"[],
    CONSTRAINT "Books_pkey" PRIMARY KEY ("Id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Books"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."OrderDetails"
(
    "Id" integer,
    "Quantity" integer,
    "Price" money,
    "OrderId" integer,
    "BooksId" integer,
    CONSTRAINT "BookId" FOREIGN KEY ("BooksId")
        REFERENCES public."Books" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "OrderId" FOREIGN KEY ("OrderId")
        REFERENCES public."Oders" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."OrderDetails"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Categories"
(
    "Id" integer NOT NULL,
    "CategoryName" "char"[],
    "Level" integer,
    "ParentId" integer,
    CONSTRAINT "Categories_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "ParentId" FOREIGN KEY ("ParentId")
        REFERENCES public."Categories" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Categories"
    OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public."Cat"
(
    "Id" integer NOT NULL,
    "CategoryId" integer,
    "BookId" integer,
    CONSTRAINT "Cat_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "BookId" FOREIGN KEY ("BookId")
        REFERENCES public."Books" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "CategoryId" FOREIGN KEY ("CategoryId")
        REFERENCES public."Categories" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Cat"
    OWNER to postgres;