
DROP TABLE IF EXISTS car CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS sales_transaction CASCADE;
DROP TABLE IF EXISTS service_history CASCADE;
DROP TABLE IF EXISTS supplier CASCADE;
DROP TABLE IF EXISTS transaction_id CASCADE;


CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    contact_person VARCHAR(256) NOT NULL,
    phone_number VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    address VARCHAR(256)
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    phone_number VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    address VARCHAR(256),
    purchase_history VARCHAR(256) NOT NULL
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    role VARCHAR(256) NOT NULL,
    phone_number VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL UNIQUE,
    position VARCHAR(256) NOT NULL
);

CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    supplier_id INTEGER NOT NULL,
    year_of_manufacture VARCHAR(256) NOT NULL,
    model VARCHAR(256) NOT NULL,
    brand VARCHAR(256) NOT NULL,
    price VARCHAR(256) NOT NULL,
    condition VARCHAR(256) NOT NULL,
    kilometrage VARCHAR(256) NOT NULL,
    availability_status VARCHAR(256) NOT NULL,
    sale_date VARCHAR(256),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id) ON DELETE CASCADE
);

CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,

    payment_date VARCHAR(256) NOT NULL,
    amount VARCHAR(256) NOT NULL,
    payment_method VARCHAR(256) NOT NULL,
    payment_status VARCHAR(256) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE sales_transaction (
    transaction_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    payment_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    sale_date VARCHAR(256) NOT NULL,
    final_price_paid VARCHAR(256) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE
);

CREATE TABLE service_history (
    service_id SERIAL PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    service_date VARCHAR(256) NOT NULL,
    service_cost VARCHAR(256) NOT NULL,
    service_description VARCHAR(256) NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES car(car_id) ON DELETE CASCADE
);


INSERT INTO supplier ( name, contact_person, phone_number, email, address)
VALUES
('AutoParts Co.', 'John Doe', '1234567890', 'contact@autoparts.com', '123 Main St'),
('MegaSupplies', 'Jane Smith', '9876543210', 'support@megasupplies.com', '456 Elm St'),
('Quality Motors', 'Mike Brown', '4561237890', 'info@qualitymotors.com', '789 Oak St'),
('Speedy Repairs', 'Anna Taylor', '3216549870', 'service@speedyrepairs.com', '321 Pine St'),
('Car Essentials', 'Bob White', '1112223334', 'sales@caressentials.com', '654 Maple St'),
('Vehicle Solutions', 'Clara Green', '4445556667', 'help@vehiclesolutions.com', '876 Cedar St'),
('Parts & More', 'Paul Gray', '7778889990', 'parts@partsandmore.com', '543 Walnut St'),
('Road Ready', 'Sara Black', '2223334445', 'ready@roadready.com', '345 Birch St'),
('AutoFix', 'Tom Silver', '8889990001', 'contact@autofix.com', '987 Chestnut St'),
('DriveTech', 'Emma Brown', '9990001112', 'info@drivetech.com', '111 Spruce St');


INSERT INTO customer (name, phone_number, email, address, purchase_history)
VALUES
('Alice Johnson', '5551234567', 'alice.johnson@example.com', '100 River St', '2 Cars'),
('Dastan', '5559876543', 'mister.dastan@example.com', '200 Forest St', '1 Car'),
('Charlie Davis', '5558765432', 'charlie.davis@example.com', '300 Lake St', '3 Cars'),
('Diana Martinez', '5557654321', 'diana.martinez@example.com', '400 Hill St', '1 Car'),
('Ethan Wilson', '5556543210', 'ethan.wilson@example.com', '500 Meadow St', '2 Cars'),
('Fiona Taylor', '5555432109', 'fiona.taylor@example.com', '600 Valley St', '1 Car'),
('George Anderson', '5554321098', 'george.anderson@example.com', '700 Ocean St', '3 Cars'),
('Hannah Thomas', '5553210987', 'hannah.thomas@example.com', '800 Sunset St', '2 Cars'),
('Ian Moore', '5552109876', 'ian.moore@example.com', '900 Sunrise St', '1 Car'),
('Julia White', '5551098765', 'julia.white@example.com', '1000 Horizon St', '4 Cars');


INSERT INTO employee (employee_id, name, role, phone_number, email, position)
VALUES
(1,'Liam Evans', 'Sales', '5551239876', 'liam.evans@example.com', 'Manager'),
(2,'Mia Johnson', 'Technician', '5559871234', 'mia.johnson@example.com', 'Engineer'),
(3,'Noah Wilson', 'Sales', '5556547890', 'noah.wilson@example.com', 'Associate'),
(4,'Olivia Brown', 'Service', '5554321987', 'olivia.brown@example.com', 'Supervisor'),
(5,'Sophia Harris', 'Technician', '5553219876', 'sophia.harris@example.com', 'Technician'),
(6,'James Green', 'Sales', '5557896543', 'james.green@example.com', 'Associate'),
(7,'Ava Walker', 'Service', '5558764321', 'ava.walker@example.com', 'Supervisor'),
(8,'Isabella Lee', 'Technician', '5552109874', 'isabella.lee@example.com', 'Technician'),
(9,'Lucas Young', 'Sales', '5558765432', 'lucas.young@example.com', 'Associate'),
(10,'Emma White', 'Service', '5555432108', 'emma.white@example.com', 'Supervisor');


INSERT INTO car (car_id, employee_id, supplier_id, year_of_manufacture, model, brand, price, condition, kilometrage, availability_status, sale_date)
VALUES
(1, 1, 1, '2023', 'Model 3', 'Tesla', '55000', 'New', '0', 'Available', NULL),
(2, 2, 2, '2022', 'Model S', 'Tesla', '65000', 'Used', '20000', 'Sold', '2023-11-15'),
(3, 3, 3, '2021', 'Mustang', 'Ford', '45000', 'New', '0', 'Available', NULL),
(4, 4, 4, '2022', 'Civic', 'Honda', '30000', 'New', '0', 'Available', NULL),
(5, 5, 5, '2021', 'Corolla', 'Toyota', '20000', 'Used', '15000', 'Available', NULL);


INSERT INTO payment (payment_id, customer_id, payment_date, amount, payment_method, payment_status)
VALUES
(1, 1,  '2023-11-01', '55000', 'Credit Card', 'Completed'),
(2, 2,  '2023-11-10', '65000', 'Bank Transfer', 'Completed');

INSERT INTO sales_transaction (transaction_id, employee_id, customer_id, payment_id, car_id, sale_date, final_price_paid)
VALUES
(1, 1, 1, 1, 1, '2023-11-01','55000'),
(2, 2, 2, 2, 2, '2023-11-10','65000');

INSERT INTO service_history (employee_id, car_id, service_date, service_cost, service_description)
VALUES
(2, 5, '2020-10-15', '1000', 'Adeed the fifth wheel'),
(8, 2,'2019-01-29', '500', 'whiped all windows');
