CREATE TABLE public.brand
(
    id serial NOT NULL,
    name character varying(30),
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.brand
    OWNER to postgres;
    
CREATE TABLE public.product_type
(
    id serial NOT NULL,
    type character varying(30) NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.product_type
    OWNER to postgres;
    
CREATE TABLE public."user"
(
    id serial NOT NULL,
    administrator boolean NOT NULL DEFAULT false,
    name character varying(30) NOT NULL,
    email character varying(50),
    phone character varying(15) NOT NULL,
    password character varying(100) NOT NULL,
    data_time_registration timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."user"
    OWNER to postgres;
    
CREATE TABLE public.promo_cod
(
    id serial NOT NULL,
    code character varying(30) NOT NULL,
    discount smallint NOT NULL,
    PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.promo_cod
    OWNER to postgres;
    
CREATE TABLE public.product
(
    id serial NOT NULL,
    brand_id integer NOT NULL,
    product_type_id integer NOT NULL,
    description text,
    quantity integer NOT NULL,
    warranty smallint,
    available boolean NOT NULL DEFAULT false,
    price double precision NOT NULL,
    promo_cod_id integer NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT brand_id FOREIGN KEY (brand_id)
        REFERENCES public.brand (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_type_id FOREIGN KEY (product_type_id)
        REFERENCES public.product_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT promo_cod FOREIGN KEY (promo_cod_id)
        REFERENCES public.promo_cod (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.product
    OWNER to postgres;
    
CREATE TABLE public.cart
(
    id serial NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    paid boolean NOT NULL DEFAULT false,
    is_closed boolean NOT NULL DEFAULT false,
    order_date timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_id FOREIGN KEY (product_id)
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public.cart
    OWNER to postgres;
