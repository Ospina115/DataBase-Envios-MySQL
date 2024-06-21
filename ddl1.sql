
DROP DATABASE IF EXISTS shipment_management;

CREATE DATABASE shipment_management;

USE shipment_management;


CREATE TABLE countries (
    id INT(3) AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_id_countries PRIMARY KEY (id),
    CONSTRAINT uk_name_countries UNIQUE (name)
);

CREATE TABLE addresses (
    id INT AUTO_INCREMENT,
    address VARCHAR(200),
    CONSTRAINT pk_id_addresses PRIMARY KEY (id)
);

CREATE TABLE phone_types (
    id INT(3) AUTO_INCREMENT,
    name VARCHAR(50),
    CONSTRAINT pk_id_phone_types PRIMARY KEY (id),
    CONSTRAINT uk_name_phone_types UNIQUE (name)
);


CREATE TABLE shipment_statuses (
    id INT(3) AUTO_INCREMENT,
    name VARCHAR(20),
    CONSTRAINT pk_id_shipment_statuses PRIMARY KEY (id),
    CONSTRAINT uk_name_shipment_statuses UNIQUE (name)
);


CREATE TABLE service_types (
    id INT(3) AUTO_INCREMENT,
    name VARCHAR(20),
    CONSTRAINT pk_id_service_types PRIMARY KEY (id),
    CONSTRAINT uk_name_service_types UNIQUE (name)
);


CREATE TABLE document_types (
    id INT(3) AUTO_INCREMENT,
    name VARCHAR(50),
    CONSTRAINT pk_id_document_types PRIMARY KEY (id)
);


CREATE TABLE customers (
    id INT AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    CONSTRAINT pk_id_customers PRIMARY KEY (id),
    CONSTRAINT  uk_email_customers UNIQUE (email)
);


CREATE TABLE recipients (
    id INT AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    CONSTRAINT pk_id_recipients PRIMARY KEY (id)
);


CREATE TABLE brands (
    id INT(5) AUTO_INCREMENT,
    name VARCHAR(30),
    CONSTRAINT pk_id_brands PRIMARY KEY (id)
);


CREATE TABLE cities (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    country_id INT(3),
    CONSTRAINT pk_id_cities PRIMARY KEY (id),
    CONSTRAINT fk_country_id_cities FOREIGN KEY (country_id)
        REFERENCES countries(id)
);

CREATE TABLE branches (
    id INT AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(200),
    city_id INT(11),
    CONSTRAINT pk_id_branches PRIMARY KEY (id),
    CONSTRAINT fk_city_id_branches FOREIGN KEY (city_id)
        REFERENCES cities(id)
);

CREATE TABLE routes (
    id INT AUTO_INCREMENT,
    description VARCHAR(200),
    CONSTRAINT pk_id_routes PRIMARY KEY (id)
);

CREATE TABLE branch_route (
    branch_id INT(11),
    route_id INT(11),
    CONSTRAINT pk_branch_route PRIMARY KEY (branch_id, route_id),
    CONSTRAINT fk_branch_id_branch_route FOREIGN KEY (branch_id)
        REFERENCES branches(id),
    CONSTRAINT fk_route_id_branch_route FOREIGN KEY (route_id)
        REFERENCES routes(id)
);

CREATE TABLE drivers (
    document VARCHAR(30),
    document_type_id INT(5),
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    CONSTRAINT pk_document_drivers PRIMARY KEY (document),
    CONSTRAINT fk_document_type_id_drivers FOREIGN KEY (document_type_id)
        REFERENCES document_types(id)
);

CREATE TABLE assistants (
    document VARCHAR(30),
    document_type_id INT(5),
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    CONSTRAINT pk_document_assistants PRIMARY KEY (document),
    CONSTRAINT fk_document_type_id_assistants FOREIGN KEY (document_type_id)
        REFERENCES document_types(id)
);

CREATE TABLE route_assistant (
    route_id INT(11),
    assistant_document VARCHAR(30),
    CONSTRAINT pk_route_assistant PRIMARY KEY (route_id, assistant_document),
    CONSTRAINT fk_route_id_route_assistant FOREIGN KEY (route_id)
        REFERENCES routes(id),
    CONSTRAINT fk_assistant_document_route_assistant FOREIGN KEY (assistant_document)
        REFERENCES assistants(document)
);

CREATE TABLE customer_phones (
    id INT AUTO_INCREMENT,
    number VARCHAR(20),
    customer_id INT(11),
    phone_type_id INT(3),
    CONSTRAINT pk_id_customer_phones PRIMARY
);

CREATE TABLE delivery_addresses (
    id INT AUTO_INCREMENT,
    address_id INT(11),
    recipient_id INT(11),
    CONSTRAINT pk_id_delivery_addresses PRIMARY KEY (id),
    CONSTRAINT fk_address_id FOREIGN KEY (address_id) 
        REFERENCES addresses(id),
    CONSTRAINT fk_recipient_id FOREIGN KEY (recipient_id) 
        REFERENCES recipients(id)
);

CREATE TABLE driver_phones (
    id INT AUTO_INCREMENT,
    number VARCHAR(20),
    driver_document VARCHAR(30),
    phone_type_id INT(3),
    CONSTRAINT pk_id_driver_phones PRIMARY KEY (id),
    CONSTRAINT fk_driver_document FOREIGN KEY (driver_document)
        REFERENCES drivers(document),
    CONSTRAINT fk_phone_type_id FOREIGN KEY (phone_type_id)
        REFERENCES phone_types(id),
    CONSTRAINT uk_number UNIQUE (number)
);

CREATE TABLE assistant_phones (
    id INT AUTO_INCREMENT,
    number VARCHAR(20),
    assistant_document VARCHAR(30),
    phone_type_id INT(3),
    CONSTRAINT pk_id_assistant_phones PRIMARY KEY (id),
    CONSTRAINT fk_assistant_document FOREIGN KEY (assistant_document)
        REFERENCES assistants(document),
    CONSTRAINT fk_phone_type_id FOREIGN KEY (phone_type_id)
        REFERENCES phone_types(id),
    CONSTRAINT uk_number UNIQUE (number)
);

CREATE TABLE packages (
    id INT AUTO_INCREMENT,
    tracking_number VARCHAR(50),
    weight DECIMAL(10, 2),
    dimensions VARCHAR(50),
    contents TEXT,
    declared_value DECIMAL(10, 2),
    service_type_id INT(3),
    CONSTRAINT pk_id_packages PRIMARY KEY (id),
    CONSTRAINT fk_service_type_id FOREIGN KEY (service_type_id)
        REFERENCES service_types(id),
    CONSTRAINT uk_tracking_number UNIQUE (tracking_number)
);

CREATE TABLE shipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT(11),
    delivery_address_id INT(11),
    package_id INT(11),
    shipment_date TIMESTAMP,
    route_id INT(11),
    origin_branch_id INT(11),
    destination_branch_id INT(11),
    shipment_status_id INT(3),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) 
        REFERENCES customers(id),
    CONSTRAINT fk_delivery_address_id FOREIGN KEY (delivery_address_id) 
        REFERENCES delivery_addresses(id),
    CONSTRAINT fk_package_id FOREIGN KEY (package_id) 
        REFERENCES packages(id),
    CONSTRAINT fk_route_id FOREIGN KEY (route_id) 
        REFERENCES routes(id),
    CONSTRAINT fk_origin_branch_id FOREIGN KEY (origin_branch_id) 
        REFERENCES branches(id),
    CONSTRAINT fk_destination_branch_id FOREIGN KEY (destination_branch_id) 
        REFERENCES branches(id),
    CONSTRAINT fk_shipment_status_id FOREIGN KEY (shipment_status_id) 
        REFERENCES shipment_statuses(id)
);

CREATE TABLE tracking (
    id INT AUTO_INCREMENT,
    package_id INT(11),
    location VARCHAR(200),
    timestamp TIMESTAMP,
    status_id INT(3),
    CONSTRAINT pk_id_tracking PRIMARY KEY (id),
    CONSTRAINT fk_package_id FOREIGN KEY (package_id)
        REFERENCES packages(id),
    CONSTRAINT fk_status_id FOREIGN KEY (status_id)
        REFERENCES shipment_statuses(id)
);

CREATE TABLE vehicle_models (
    id INT(5) AUTO_INCREMENT,
    name VARCHAR(30),
    brand_id INT(5),
    CONSTRAINT pk_id_vehicle_models PRIMARY KEY (id),
    CONSTRAINT fk_brand_id FOREIGN KEY (brand_id)
        REFERENCES brands(id)
);

CREATE TABLE vehicles (
    plate_number VARCHAR(50),
    capacity DECIMAL(10,2),
    model_id INT(5),
    branch_id INT(11),
    CONSTRAINT pk_plate_number PRIMARY KEY (plate_number),
    CONSTRAINT fk_model_id FOREIGN KEY (model_id)
        REFERENCES vehicle_models(id),
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id)
        REFERENCES branches(id)
);

CREATE TABLE driver_routes (
    driver_document VARCHAR(30),
    route_id INT(11),
    vehicle_plate_number VARCHAR(50),
    branch_id INT(11),
    CONSTRAINT pk_driver_routes PRIMARY KEY (driver_document, route_id),
    CONSTRAINT fk_driver_document FOREIGN KEY (driver_document)
        REFERENCES drivers(document),
    CONSTRAINT fk_route_id FOREIGN KEY (route_id)
        REFERENCES routes(id),
    CONSTRAINT fk_vehicle_plate_number FOREIGN KEY (vehicle_plate_number)
        REFERENCES vehicles(plate_number),
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id)
        REFERENCES branches(id)
);

DELIMITER //

CREATE TRIGGER update_shipment_status
AFTER INSERT ON tracking
FOR EACH ROW
BEGIN
    UPDATE shipments
    SET shipment_status_id = NEW.status_id
    WHERE package_id = NEW.package_id;
END;

//

