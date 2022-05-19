/*gender : 0 is male, 1 is female 
  status : 0 is inactive (delete) , 1 is active
  status ( IN APPOINTMENT TABLE) : 0 is cancel, 1 is pending, 2 is confirm
  status ( IN INVOICE TABLE ) : 0 is unpaid, 1 is paid
  payment_method : 0 is offline, 1 is online
*/
CREATE DATABASE DentistBooking
GO

USE DentistBooking
GO

CREATE TABLE Customers  
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	age tinyint, /* tinyint: 0-255 */
	address varchar(150),
	phone_number varchar(10) NOT NULL,
	email varchar(50) ,
	gender bit NOT NULL,
	status bit NOT NULL

)

GO

CREATE TABLE Dentists
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	rate float NOT NULL,
	gender bit NOT NULL,
	status bit NOT NULL
	

)

GO

CREATE TABLE DentistAvailiableTime
(
	dentist_id varchar(10) NOT NULL,
	slot tinyint NOT NULL, /* tinyint: 0-255 */
	day_of_week varchar(20) NOT NULL,
	CONSTRAINT fk_DentostAvailiableTime_Dentists_id FOREIGN KEY(dentist_id) REFERENCES Dentists(id),
	CONSTRAINT pk_DentistAvailiableTime PRIMARY KEY(dentist_id,slot)
)

GO

CREATE TABLE Services
(
	id varchar(10) NOT NULL PRIMARY KEY,
	service_name varchar(30) NOT NULL,
	promotion_id varchar(10) NOT NULL,
	short_description varchar(600) NOT NULL,
	long_description varchar(1000) NOT NULL,
	price int NOT NULL,
	image varchar(200) NOT NULL,
	status bit NOT NULL,
)

GO

CREATE TABLE Promotions
(
	id varchar(10) NOT NULL,
	service_id varchar(10) NOT NULL,
	long_description varchar(600) NOT NULL,
	short_description varchar(1000) NOT NULL,
	image varchar(200) NOT NULL,
	discount_percentage float NOT NULL,
	status bit NOT NULL,
	CONSTRAINT fk_Promotion_Services_id FOREIGN KEY(service_id) REFERENCES Services(id),
	CONSTRAINT pk_Promotion PRIMARY KEY(id,service_id)
)

GO

CREATE TABLE Appointments
(
	id varchar(10) NOT NULL PRIMARY KEY,
	dentist_id varchar(10) NOT NULL,
	customer_id varchar(10) NOT NULL,
	service_id varchar(10) NOT NULL,
	meeting_date date NOT NULL,
	dentist_note varchar(600),
	customer_symptom varchar(500),
	slot tinyint NOT NULL, /* tinyint: 0-255 */
	status tinyint NOT NULL, /* tinyint: 0-255 */
	CONSTRAINT fk_Appointments_Services_id FOREIGN KEY(service_id) REFERENCES Services(id),
	CONSTRAINT fk_Appointments_Dentists_id FOREIGN KEY(dentist_id) REFERENCES Dentists(id),
	CONSTRAINT fk_Appointments_Customers_id FOREIGN KEY(customer_id) REFERENCES Customers(id),

)

GO

CREATE TABLE AppointmentDetail
(
	id varchar(10) NOT NULL,
	service_id varchar(10) NOT NULL,
	CONSTRAINT pk_AppointmentDetail PRIMARY KEY(id,service_id)
)

GO


CREATE TABLE Feedbacks
(
	id varchar(10) NOT NULL PRIMARY KEY,
	appointment_id varchar(10) NOT NULL,
	dentist_rating float NOT NULL,
	dentist_message varchar(200) NOT NULL,
	meeting_date date NOT NULL,
	status bit NOT NULL,
	CONSTRAINT fk_Feedbacks_Appointments_id FOREIGN KEY (appointment_id) REFERENCES Appointments(id)
)

GO

CREATE TABLE Employees
(
	id varchar(10) NOT NULL PRIMARY KEY,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	role varchar(10) NOT NULL,
	personal_name varchar(30) NOT NULL,
	phone_number varchar(10) NOT NULL,
	email varchar(50) NOT NULL

)

GO

CREATE TABLE Invoices
(
	id varchar(10) NOT NULL,
	appointment_id varchar(10) NOT NULL,
	employee_id varchar(10) NOT NULL,
	price int NOT NULL,
	payment_method bit NOT NULL,
	creditcard_inf varchar(30) NOT NULL,
	status bit NOT NULL,
	CONSTRAINT fk_Invoice_Appointments_id FOREIGN KEY(appointment_id) REFERENCES Appointments(id),
	CONSTRAINT fk_Invoice_Employees_id FOREIGN KEY(employee_id) REFERENCES Employees(id)

)

GO


INSERT Customers ([id], [username], [password], [role], [personal_name], [age], [address], [phone_number], [email], [gender], [status])
VALUES	('US0', 'hoangminhan', '123an', 'USER', 'Hoang Minh An', 19, '135 Nam Ki Khoi Nghia street, district 1, Ho Chi Minh City', '0902746375','hoangminhan@gmail.com',0,1),
		('US1', 'luugiavinh', '123vinh', 'USER', 'Luu Gia Vinh', 19, '720 Dien Bien Phu street, Binh Thanh district, Ho Chi Minh City', '0905647289', 'luugiavinh@gmail.com',0,1),
		('US2', 'nguyentrunghieu', '123hieu', 'USER', 'Nguyen Trung Hieu', 21, '7 Cong Truong Lam Son street, district 1, Ho Chi Minh City', '0903748264', 'nguyentrunghieu@gmail.com',0,1),
		('US3', 'nguyenhaidang', '123dang', 'USER', 'Nguyen Hai Dang', 20, '1 Nguyen Tat Thanh street, district 4, Ho Chi Minh City', '0903748627', 'nguyenhaidang@gmail.com',0,1),
		('US4', 'tranminhkhang', '123khang', 'USER', 'Tran Minh Khang', 20, '3 Hoa Binh street, district 11, Ho Chi Minh City', '0902736581', 'tranminhkhang@gmail.com',0,1)

GO


INSERT Dentists ([id], [username], [password], [role], [personal_name], [rate], [gender], [status])
VALUES	('DT0', 'legiahuy', '123huy', 'DENTIST', 'Le Gia Huy', 5, 0, 1),
		('DT1', 'nguyenkhanhduy', '123duy', 'DENTIST', 'Nguyen Khanh Duy', 4.9, 0, 1),
		('DT2', 'tranthuytan', '123tan', 'DENTIST', 'Tran Thuy Tan', 4.9, 0, 1),
		('DT3', 'caotronghieu', '123hieu', 'DENTIST', 'Cao Trong Hieu', 4.8, 0, 1),
		('DT4', 'nguyenminhtri', '123tri', 'DENTIST', 'Nguyen Minh Tri', 4.8, 0, 1)

GO


INSERT DentistAvailiableTime ([dentist_id], [slot], [day_of_week]) 
VALUES	(N'DT0', 1, N'Monday '),
		(N'DT0', 2, N'Tuesday'),
		(N'DT1', 3, N'Wednesday'),
		(N'DT2', 2, N'Friday'),
		(N'DT2', 3, N'Thursday'),
		(N'DT3', 5, N'Friday'),
		(N'DT4', 6, N'Saturday')

GO


INSERT Employees ([id], [username], [password], [role], [personal_name], [phone_number], [email]) 
VALUES	(N'EP0', N'minhan', N'123', N'STAFF', N'Minh An', N'123456789', N'minhan@gmail.com'),
		(N'EP1', N'giavinh', N'123', N'STAFF', N'Gia Vinh', N'123456789', N'giavinh@gmail.com'),
		(N'EP2', N'haidang', N'123', N'STAFF', N'Hai Dang', N'123456789', N'haidang@gmail.com'),
		(N'EP3', N'trunghieu', N'123', N'STAFF', N'Trung Hieu', N'123456789', N'trunghieu@gmail.com')


/* ------------------- INSERT SERVICE------------------------- */

/*Service 0*/
DECLARE @SV0_short_description AS varchar(600);
DECLARE @SV0_long_description AS varchar(1000);
SET @SV0_short_description = 'If you have crooked teethand/or a misaligned bite (an underbite or overbite), there are a variety of treatments that can help straighten teeth, including braces and retainers. '
							  + 'Many general dentists are doing basic alignment and orthodontics, but orthodontists specialize in correcting irregularities of the teeth.';
SET @SV0_long_description = 'The dentist or orthodontist you choose will ask questions about your health, conduct a clinical exam, take impressions of your teeth, take photos of your face and teeth, and order X-rays of the mouth and head. An appropriate treatment plan is made based on analysis of the gathered information. '
							  + 'In some cases, a removable retainer will be all that�s necessary. If braces are indeed the solution for you, the dentist or orthodontist will prescribe an appliance specific for your needs. The braces may consist of bands, wires, and other fixed or removable corrective appliances. No one method works for everyone. '
							  + 'Braces work by applying continuous pressure over a period of time to slowly move teeth in a specific direction. As the teeth move, the bone changes shape as pressure is applied.';
									
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV0', 'Dental Braces And Retainers', 'promotion', @SV0_short_description, @SV0_long_description, 500, 'image', 1)


/*Service 1*/
DECLARE @SV1_short_description AS varchar(600);
DECLARE @SV1_long_description AS varchar(1000);
SET @SV1_short_description = 'Everybody wants a great smile, but a lot of us need help getting there. More and more people are having success with clear orthodontic devices called aligners. '
							 + 'Your orthodontist or dentist will help you decide what�s best for you.'
SET @SV1_long_description= 'Clear orthodontic aligners are typically used for patients who have mild or moderately crowded teeth, or have minor spacing issues. Patients who have severe crowding or spacing problems � or severe underbites, overbites, or crossbites � may need more complex treatment.'
							 + 'Once a dentist or orthodontist decides how to correct your bite, they�ll make a plan for moving your teeth. If you get the clear aligners, you�ll be fitted for several versions that make slight adjustments to move your teeth over the treatment time.'
							 + 'They�re made from a clear plastic or acrylic material and fit tightly over the teeth, but can be removed for eating, brushing, and flossing. You�ll get a new aligner every few weeks to continue moving the teeth into the desired position. Treatment usually takes between 10 and 24 months.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV1', 'Invisible Aligners For Teeth', 'promotion', @SV1_short_description, @SV1_long_description, 700, 'image', 1)


/*Service 2*/
DECLARE @SV2_short_description AS varchar(600);
DECLARE @SV2_long_description AS varchar(1000);
SET @SV2_short_description = 'Wisdom tooth (or tooth number 8) is the 3rd largest molar tooth of human teeth, grows last on the arch and is located deep in the corner of the jaw, usually we have up to 4 wisdom teeth.'
							 + 'Usually grows in adulthood (18-25 years old) is the age that indicates the growth of a person should be called wisdom teeth.'
							 + 'However, most wisdom teeth are harmful because they cause many complications.';
SET @SV2_long_description= 'Difficulty of wisdom tooth extraction depends on: Tooth shape, Anatomy of teeth ,Tooth axis: tilted near, horizontal, vertical, far inclined, Depth of underground teeth ,Bone stiffness, The extent of the patients open mouththe distance between teeth and branches on the lower jaw bone
							'
							 + '1. STEP PREPARATION BEFORE YOU DRY TOOL: Examination on mouth, Take a panoramic movie and check (take CT movie if necessary), Blood test (As directed by your doctor), Clean teeth, scrape tartar
							 '
							 + '2. PROCESS OF DISPOSING 1 MISCELLANEOUS AT UCARE:Disinfect in place according to aseptic procedure of minor surgery, Anesthetize, Slitting the gums, Dissecting gums and bones, Sharpening and cutting bone around teeth, revealing underground teeth, Split teeth, remove teeth, Scraping granulation tissue and bone fragments, Toothpaste flushing pump, Stitch hemostasis'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV2', 'Wisdom Tooth Extraction', 'promotion', @SV2_short_description, @SV2_long_description, 200, 'image', 1)


/*Service 3*/
DECLARE @SV3_short_description AS varchar(600);
DECLARE @SV3_long_description AS varchar(1000);
SET @SV3_short_description = 'When we lose one or more even permanent teeth and we do not restore those teeth by denture methods, they will have local and general consequences, affecting dental health and quality. amount of life.'
							 + 'there are many methods of dentures such as Implant implants, prosthetic fixed bridges and removable dentures.';
SET @SV3_long_description= 'In the removable function there are 2 types: Partial removable jaw (the patient still has many teeth in the arch of the jaw) is usually metal or also called the jaw frame, Full removable jaw (when the patient loses all teeth) is usually made of plastic
							'
							 + 'The jaw frame is a semi-removable prosthesis with the main part being a metal frame, the whole alloy structure of the frame (hook, saddle, connecting rod) is molded together into one block. Replacement teeth are attached to acrylic restorations.
							 '
					 		 + 'Material made of metal frame jaw so high gloss, high gloss prevents oral fluids from getting into the denture convenient for cleaning. Compared with fixed dental porcelain prostheses, the jaw frame does not have to be sharpened and costs less, not to interfere with some intact teeth (root canal) to make prosthetic.'
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV3', 'Removable Dentures', 'promotion', @SV3_short_description, @SV3_long_description, 200, 'image', 1)


/*Service 4 */
DECLARE @SV4_short_description AS varchar(600);
DECLARE @SV4_long_description AS varchar(1000);
SET @SV4_short_description = 'A root canal is a tooth treatment that attempts to save a decayed or infected tooth. The nerve and pulp of the tooth is removed and the area is sealed to prevent an abscess. '
							 + 'Your tooth or teeth may be damaged due to tooth injury or filling problems, or because of other things. Symptoms of problems that may require a root canal include severe toothache, swelling, discoloration, tooth sensitivity, and more. '
							 + 'Your dentist will explain how to care for your teeth following the procedure.';
SET @SV4_long_description= 'Root canal treatment (also called a root canal) is done when decay will likely damage or has already killed a tooth. During a root canal, a dentist or endodontist removes the pulp from the center of a tooth and fills the pulp cavity. '
							 + 'This can prevent the development of a painful infection in the pulp that may spread to other teeth. A root canal can also treat an infection that has developed into an abscessed tooth. This procedure can relieve toothache, stop infection, and promote healing.
							 '
							 + 'After the root canal, a permanent filling or crown (cap) is often needed. If a crown is needed, the dentist removes the decay and then makes an impression of the tooth. A technician uses the impression to make a crown that perfectly matches the drilled tooth. '
							 + 'The tooth may be fitted with a temporary crown until the permanent crown is made and cemented into place. ';
INSERT Services ([id], [service_name], [promotion_id], [short_description], [long_description], [price], [image], [status])
VALUES ('SV4', 'Root Canal Treatment', 'promotion', @SV4_short_description, @SV4_long_description, 200, 'image', 1)


/* ------------------- INSERT SERVICE------------------------- */

GO


INSERT Promotions ([id], [service_id], [long_description], [short_description], [image], [discount_percentage], [status])
VALUES	(N'PR0', N'SV0', N'We are welcome to serve you as one of our newest members to the clinic', N'New Customer', N'Image', 0.25, 1),
		(N'PR0', N'SV1', N'We are welcome to serve you as one of our newest members to the clinic', N'New Customer', N'Image', 0.25, 1),
		(N'PR0', N'SV2', N'We are welcome to serve you as one of our newest members to the clinic', N'New Customer', N'Image', 0.25, 1),
		(N'PR0', N'SV3', N'We are welcome to serve you as one of our newest members to the clinic', N'New Customer', N'Image', 0.25, 1),
		(N'PR0', N'SV4', N'We are welcome to serve you as one of our newest members to the clinic', N'New Customer', N'Image ', 0.25, 1),
		(N'PR1', N'SV2', N'If you are under 18 while using the service, you will get a discount', N'Under 18', N'Image', 0.4, 1),
		(N'PR2', N'SV4', N'If you are over 60 while using the service, you will get a discount', N'Over 60', N'Image', 0.3, 1)

GO





