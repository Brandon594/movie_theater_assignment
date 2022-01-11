CREATE TABLE "public.salesperson" (
	"first_name" TEXT(255) NOT NULL,
	"last_name" TEXT(255) NOT NULL,
	"employee_id" serial NOT NULL,
	"email" varchar(255) NOT NULL,
	"phone_number" DECIMAL NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ticket" (
	"transaction_id" serial NOT NULL,
	"price" DECIMAL NOT NULL,
	"seller" varchar(255) NOT NULL,
	"buyer" varchar(255) NOT NULL,
	"film_showing" varchar(255) NOT NULL,
	"date" bigint NOT NULL,
	"time" bigint NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.film" (
	"screening_id" varchar(255) NOT NULL,
	"time" TIMESTAMP NOT NULL,
	"film" TEXT NOT NULL,
	"price" DECIMAL NOT NULL,
	"date" DATE NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customer" (
	"first_name" TEXT NOT NULL,
	"last_name" TEXT NOT NULL,
	"email" varchar(255) NOT NULL,
	"customer_id" serial NOT NULL,
	"phone_number" DECIMAL NOT NULL,
	"consessions" bigint NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.concessions" (
	"item_purchased" bigint NOT NULL,
	"price" bigint NOT NULL,
	"item_serial" serial NOT NULL
) WITH (
  OIDS=FALSE
);




ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("seller") REFERENCES "salesperson"("employee_id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk1" FOREIGN KEY ("buyer") REFERENCES "customer"("customer_id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk2" FOREIGN KEY ("film_showing") REFERENCES "film"("screening_id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk3" FOREIGN KEY ("date") REFERENCES "film"("date");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk4" FOREIGN KEY ("time") REFERENCES "film"("time");


ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("consessions") REFERENCES "concessions"("item_serial");







