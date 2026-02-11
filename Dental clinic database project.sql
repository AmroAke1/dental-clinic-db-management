Create database Dental_clinic; 

Create table patients ( 
patient_id int primary key, 
first_name varchar(50), 
last_name varchar(50), 
gender varchar(10),
date_of_birth DATE, 
ID_num varchar(50) unique, 
mobile_num varchar(20) unique
); 

Create table staff ( 
staff_id int primary key,
full_name varchar(50), 
speciality varchar(50), 
mobile_num varchar(20)
);

Create table appointments ( 
app_id int primary key, 
app_date_time DATETIME, 
reason text, 
status varchar(20),

patient_id int,
staff_id int,

foreign key (patient_id) references patients(patient_id),
foreign key (staff_id) references staff(staff_id)
);

Create table services ( 
service_id int primary key, 
name varchar(100),
price decimal(10,2)
);

Create table treatment_records ( 
record_id int primary key, 
app_id int, 
service_id int,

foreign key (app_id) references appointments(app_id),
foreign key (service_id) references services(service_id)
);

Create table Billing ( 
Bill_id int primary key, 
record_id int, 
bill_date DATE, 
total_amount decimal(10,2), 
status varchar(20),

foreign key (record_id) references treatment_records(record_id)
);

Create table availability (
ava_id int primary key, 
start_time TIME, 
end_time TIME, 
staff_id int, 

foreign key (staff_id) references staff(staff_id)
); 

insert into Patients (patient_ID, first_name, last_name, gender, date_of_birth, ID_num, mobile_num) VALUES 
(101, 'Mehmet', 'oglu', 'Male', '2005-05-15', '52837061990', '505-345-2445'),
(102, 'John', 'Smith', 'Male', '1990-11-20', '35736223584', '554-576-4435'),
(103, 'Rose', 'oglu', 'Female', '2001-08-01', '35392931038', '539-901-3453'),
(104, 'Emre', 'aslan', 'Male', '2000-08-12', '87467377470', '534-718-3601'),
(105, 'Micheal', 'williams', 'Male', '2006-11-20', '60476117350', '555-654-7009'),
(106, 'lily', 'jones', 'Female', '1980-10-20', '18372409666', '537-102-8354'),
(107, 'Edward', 'davis', 'Male', '2003-10-13', '53293708412', '055-993-4721'),
(108, 'Kai', 'cenat', 'Male', '1997-03-20', '62979307306', '234-325-1190'),
(109, 'Amelia', 'Davis', 'Female', '1999-05-17', '65504848268', '545-580-0042'),
(110, 'Jack', 'Miller', 'Male', '1970-12-15', '55154539760', '530-467-9103');


INSERT into Staff (staff_id, full_name, speciality, mobile_num) VALUES
(201, 'Dr. Elif oglu', 'Dentist', '505-890-5421'),
(202, 'Dr. Alex Lee', 'Orthodontist', '556-321-7890'),
(203, 'Maria Sanchez', 'Hygienist', '505-890-5421'),
(204, 'Dr. Ben Demir', 'Dentist', '556-321-7890'),         
(205, 'Jessica Ali', 'Dental Assistant', '521-654-0372'),   
(206, 'Charles Kim', 'Office Manager', '570-109-8833'),     
(207, 'Dr. Lena Kaya', 'Pediatric Dentist', '588-201-6148'), 
(208, 'Omar Khan', 'Hygienist', '549-934-1907'),           
(209, 'Sarah Finn', 'Front Desk', '534-582-3560'),   
(210, 'Dr. Ivan Petrov', 'Periodontist', '591-043-9785');   

insert into Services (service_id, name, price) VALUES
(301, 'Routine Check-up', 75.50),
(302, 'Teeth Cleaning', 99.99),
(303, 'Amalgam Filling', 149.99),
(304, 'Composite Filling', 199.99),
(305, 'Simple Tooth Extraction', 179.99),
(306, 'Surgical Wisdom Tooth Extraction', 449.99),
(307, 'Root Canal Treatment (Molar)', 949.99),
(308, 'Porcelain Crown', 1199.00),
(309, 'In-Office Teeth Whitening', 349.00),
(310, 'X-Ray (Full Mouth Series)', 84.99),
(311, 'Veneers', 1500.00);


INSERT INTO Availability (ava_id, staff_id, day_of_week, start_time, end_time) VALUES
(401, 201, 'Monday', '09:00:00', '17:00:00'),   -- Dr. Elif, Monday
(402, 204, 'Tuesday', '08:00:00', '16:00:00'),  -- Dr. Ben, Tuesday
(403, 203, 'Wednesday', '10:00:00', '18:00:00'), -- Maria, Wednesday
(404, 201, 'Friday', '09:00:00', '14:00:00'),   -- Dr. Elif, Friday 
(405, 207, 'Thursday', '11:00:00', '19:00:00'), -- Dr. Lena, Thursday
(406, 202, 'Monday', '10:00:00', '18:00:00'),   -- Dr. Alex, Monday
(407, 208, 'Tuesday', '09:00:00', '17:00:00'),  -- Omar, Tuesday
(408, 204, 'Wednesday', '08:00:00', '16:00:00'), -- Dr. Ben, Wednesday
(409, 210, 'Friday', '10:00:00', '17:00:00'),   -- Dr. Ivan, Friday
(410, 203, 'Friday', '08:00:00', '16:00:00');  -- Maria, Friday 

insert into Appointments (app_id, app_date_time, reason, status, patient_id, staff_id) VALUES
(501, '2025-11-25 10:00:00', 'Routine check-up', 'Completed', 101, 203), -- Patient 101 with Hygienist 203
(502, '2025-11-25 14:30:00', 'Emergency toothache examination', 'Completed', 104, 201), -- Patient 104 with Dentist 201
(503, '2025-11-26 09:00:00', 'Filling procedure', 'Completed', 107, 204), -- Patient 107 with Dentist 204
(504, '2025-11-27 11:30:00', 'Brace adjustment', 'Scheduled', 102, 202), -- Patient 102 with Orthodontist 202
(505, '2025-11-28 15:00:00', 'Consultation for whitening', 'Completed', 110, 201), -- Patient 110 with Dentist 201
(506, '2025-12-01 08:30:00', 'Follow-up cleaning', 'Scheduled', 103, 208), -- Patient 103 with Hygienist 208
(507, '2025-12-01 16:00:00', 'Wisdom tooth consultation', 'Scheduled', 105, 207), -- Patient 105 with Pediatric Dentist 207
(508, '2025-12-02 10:00:00', 'Root canal (initial stage)', 'Completed', 106, 204), -- Patient 106 with Dentist 204
(509, '2025-12-03 13:00:00', 'Dental implant placement', 'Scheduled', 108, 210), -- Patient 108 with Periodontist 210
(510, '2025-12-05 10:00:00', 'Crown fitting', 'Scheduled', 109, 201); -- Patient 109 with Dentist 201

INSERT INTO Treatment_Records (record_id, app_id, service_id) VALUES
(601, 501, 301),
(602, 501, 302),
(603, 502, 310),
(604, 502, 305),
(605, 503, 304),
(606, 503, 310),
(607, 505, 301),
(608, 505, 309),
(609, 508, 307),
(610, 508, 310),
(611, 508, 301),
(612, 502, 301),
(613, 503, 302),
(614, 501, 310),
(615, 505, 302);

INSERT INTO Billing (Bill_id, record_id, bill_date, total_amount, status) VALUES
(701, 601, '2025-11-25', 75.00, 'Paid'),
(702, 602, '2025-11-25', 120.50, 'Paid'),
(703, 604, '2025-11-25', 180.00, 'Paid'),
(704, 605, '2025-11-26', 200.00, 'Paid'),
(705, 608, '2025-11-28', 350.00, 'Paid'),
(706, 609, '2025-12-01', 950.00, 'Pending'),
(707, 603, '2025-11-25', 85.00, 'Pending'),
(708, 606, '2025-11-26', 85.00, 'Paid'),
(709, 610, '2025-12-01', 85.00, 'Pending'),
(710, 615, '2025-11-28', 120.50, 'Paid');

