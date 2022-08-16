
CREATE TABLE patients  (
    id SERIAL,
    name VARCHAR(100),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories  (
    id SERIAL NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE treatments  (
    id SERIAL NOT NULL,
    type VARCHAR(100),
    name VARCHAR(150),
    PRIMARY KEY (id)
);

CREATE TABLE invoices  (
    id SERIAL NOT NULL,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items  (
    id SERIAL NOT NULL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY (id)
);