INSERT INTO public.brand
	(name)
VALUES
	('Intel'),
	('ASUS'),
	('A4'),
	('AMD'),
	('CRUCIAL'),
	('WD'),
	('SAMSUNG'),
	('KINGSTON');
	
INSERT INTO public.product_type
	(type)
VALUES
	('SSD'),
	('HDD'),
	('CPU'),
	('RAM');
	
INSERT INTO public.promo_cod(
	code,
	discount
) VALUES
	('NONE', 0),
	('SAVE', 150),
	('SHOT', 300);
	
INSERT INTO public.product(	
	brand_id,
	product_type_id,
	description,
	quantity,
	warranty,
	available,
	price,
	promo_cod_id
) VALUES
	(1, 1, 'SSD на 120Гб очень надёжен', 60, 36, true, 3300, 1),
	(5, 1, 'SSD на 120Гб отличное соотношение цена/качество', 10, 36, true, 2200, 1),
	(4, 3, 'Процессор AMD ryzen 5 2600', 5, 12, true, 12000, 1),
	(5, 4, 'Модуль памяти на 8Гб', 25, 60, true, 4500, 2),
	(6, 2, 'HDD на 1Тб со скоростью 7200', 100, 12, true, 3200, 1);
	
INSERT INTO public.user(	
	administrator,
	"name",
	email,
	phone,
	"password"
) VALUES
	(false, 'Olga', 'Olga@yandex.ru', '88002001001', 'fdrg543'),
	(false, 'Viktor', 'Viktor@yandex.ru', '88002001002', 'afdg3q4'),
	(true, 'Vlad', 'Vlad@yandex.ru', '88002001003', 'j6rsht'),
	(false, 'Dima', 'Dima@yandex.ru', '88002001004', 'q3543fq'),
	(false, 'Vova', 'Vova@yandex.ru', '88002001005', 'qf4q34f'),
	(false, 'Denis', 'Denis@yandex.ru', '88002001006', 'g465w45gq');
	
INSERT INTO public.cart(	
	user_id,
	product_id,
	paid,
	is_closed
) VALUES
	(1, 5, false, false),
	(2, 4, false, false),
	(5, 3, false, false),
	(3, 2, true, true),
	(4, 1, false, false),
	(6, 4, false, false);
	
