CREATETABLE BRANCH(
BRANCH_NO CHAR(4)NOTNULL,
STREET_NO CHAR(4)NOTNULL,
STREET CHAR(10)NOTNULL,
CITY CHAR(10)NOTNULL,
PROVINCE CHAR(2)NOTNULL,
POSTAL_CODE CHAR(6)NOTNULL,
MANAGER CHAR(4)NOTNULL,
PRIMARYKEY (BRANCH_NO),
CHECK (PROVINCE IN('AL','BC','MA','NB','NF','NT','NS','NU',
'ON','PE','QB','SA','YU')),
CHECK (('A'<=SUBSTRING(POSTAL_CODE,1,1)AND
SUBSTRING(POSTAL_CODE,1,1)<='Z')AND
('0'<=SUBSTRING(POSTAL_CODE,2,1)ANDSUBSTRING(POSTAL_CODE,2,1)<='9')
AND
('A'<=SUBSTRING(POSTAL_CODE,3,1)ANDSUBSTRING(POSTAL_CODE,3,1)<='Z')
AND
('0'<=SUBSTRING(POSTAL_CODE,4,1)ANDSUBSTRING(POSTAL_CODE,4,1)<='9')
AND
('A'<=SUBSTRING(POSTAL_CODE,5,1)ANDSUBSTRING(POSTAL_CODE,5,1)<='Z')
AND
('0'<=SUBSTRING(POSTAL_CODE,6,1)AND
SUBSTRING(POSTAL_CODE,6,1)<='9')),
UNIQUE(MANAGER)
)
CREATETABLE STAFF(
STAFF_NO CHAR(4)NOTNULL,
LAST_NAME CHAR(20)NOTNULL,
FIRST_NAME CHAR(10)NOTNULL,
MIDDLE_NAME CHAR(10),
STREET_NO CHAR(4)NOTNULL,
STREET CHAR(10)NOTNULL,
CITY CHAR(10)NOTNULL,
PROVINCE CHAR(2)NOTNULL,
POSTAL_CODE CHAR(6)NOTNULL,
SEX CHAR(1)NOTNULL,
SALARY DECIMAL(9,2)NOTNULL,
ALLOCATED_TO CHAR(4)NOTNULL,
PRIMARYKEY (STAFF_NO),
FOREIGNKEY (ALLOCATED_TO)REFERENCES BRANCH,
CHECK (PROVINCE IN('AL','BC','MA','NB','NF','NT','NS',
'NU','ON','PE','QB','SA','YU')),
CHECK (SEX IN('F','M','N')),
CHECK (SALARY > 0),
CHECK (('A'<=SUBSTRING(POSTAL_CODE,1,1)
ANDSUBSTRING(POSTAL_CODE,1,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,2,1)
ANDSUBSTRING(POSTAL_CODE,2,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,3,1)
ANDSUBSTRING(POSTAL_CODE,3,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,4,1)
ANDSUBSTRING(POSTAL_CODE,4,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,5,1)
ANDSUBSTRING(POSTAL_CODE,5,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,6,1)
ANDSUBSTRING(POSTAL_CODE,6,1)<='9'))
)
CREATETABLEOWNER (
OWNER_NO CHAR(4)NOTNULL,
NAME CHAR(20)NOTNULL,
FIRST_NAME CHAR(10),
MIDDLE_NAME CHAR(10),
STREET_NO CHAR(4)NOTNULL,
STREET CHAR(10)NOTNULL,
CITY CHAR(10)NOTNULL,
PROVINCE CHAR(2)NOTNULL,
POSTAL_CODE CHAR(6)NOTNULL,
TYPE_OF_BUSINESS CHAR(2),
PRIMARYKEY (OWNER_NO),
CHECK (PROVINCE IN('AL','BC','MA','NB','NF','NT','NS','NU',
'ON','PE','QB','SA','YU')),
CHECK (('A'<=SUBSTRING(POSTAL_CODE,1,1)ANDSUBSTRING(POSTAL_CODE,1,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,2,1)ANDSUBSTRING(POSTAL_CODE,2,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,3,1)ANDSUBSTRING(POSTAL_CODE,3,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,4,1)ANDSUBSTRING(POSTAL_CODE,4,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,5,1)ANDSUBSTRING(POSTAL_CODE,5,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,6,1)ANDSUBSTRING(POSTAL_CODE,6,1)<='9')),
CHECK(TYPE_OF_BUSINESS ISNULLOR(FIRST_NAME ISNULLAND MIDDLE_NAME
ISNULL))
)
CREATETABLE RENTER(
RENTER_NO CHAR(4)NOTNULL,
NAME CHAR(20)NOTNULL,
FIRST_NAME CHAR(10),
MIDDLE_NAME CHAR(10),
STREET_NO CHAR(4)NOTNULL,
STREET CHAR(10)NOTNULL,
CITY CHAR(10)NOTNULL,
PROVINCE CHAR(2)NOTNULL,
POSTAL_CODE CHAR(6)NOTNULL,
TYPE_OF_BUSINESS CHAR(2),
PRIMARYKEY (RENTER_NO),
CHECK (PROVINCE IN('AL','BC','MA','NB','NF','NT','NS','NU','ON',
'PE','QB','SA','YU')),
CHECK (('A'<=SUBSTRING(POSTAL_CODE,1,1)ANDSUBSTRING(POSTAL_CODE,1,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,2,1)ANDSUBSTRING(POSTAL_CODE,2,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,3,1)ANDSUBSTRING(POSTAL_CODE,3,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,4,1)ANDSUBSTRING(POSTAL_CODE,4,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,5,1)ANDSUBSTRING(POSTAL_CODE,5,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,6,1)ANDSUBSTRING(POSTAL_CODE,6,1)<='9')),
CHECK(TYPE_OF_BUSINESS ISNULLOR(FIRST_NAME ISNULLAND MIDDLE_NAME
ISNULL))
)
CREATETABLE PROPERTY(
PROPERTY_NO CHAR(4)NOTNULL,
STREET_NO CHAR(4)NOTNULL,
STREET CHAR(10)NOTNULL,
CITY CHAR(10)NOTNULL,
PROVINCE CHAR(2)NOTNULL,
POSTAL_CODE CHAR(6)NOTNULL,
OVERSEEN_BY CHAR(4)NOTNULL,
OWNED_BY CHAR(4)NOTNULL,
TYPECHAR(2)NOTNULL,
PRIMARYKEY (PROPERTY_NO),
FOREIGNKEY (OVERSEEN_BY)REFERENCES STAFF,
FOREIGNKEY (OWNED_BY)REFERENCESOWNER,
CHECK (PROVINCE IN('AL','BC','MA','NB','NF','NT','NS','NU','ON',
'PE','QB','SA','YU')),
CHECK (('A'<=SUBSTRING(POSTAL_CODE,1,1)ANDSUBSTRING(POSTAL_CODE,1,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,2,1)ANDSUBSTRING(POSTAL_CODE,2,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,3,1)ANDSUBSTRING(POSTAL_CODE,3,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,4,1)ANDSUBSTRING(POSTAL_CODE,4,1)<='9')
AND('A'<=SUBSTRING(POSTAL_CODE,5,1)ANDSUBSTRING(POSTAL_CODE,5,1)<='Z')
AND('0'<=SUBSTRING(POSTAL_CODE,6,1)ANDSUBSTRING(POSTAL_CODE,6,1)<='9'))
)
CREATETABLE RENTAL_AGREEMENT(
PROPERTY_NO CHAR(4)NOTNULL,
RENTAL_NO CHAR(4)NOTNULL,
SIGNING_DATE DATENOTNULL,
STARTING_DATE DATENOTNULL,
ENDING_DATE DATENOTNULL,
RENTER_NO CHAR(4)NOTNULL,
PRIMARYKEY (PROPERTY_NO,RENTAL_NO),
FOREIGNKEY (PROPERTY_NO)REFERENCES PROPERTY,
FOREIGNKEY (RENTER_NO)REFERENCES RENTER,
CHECK (SIGNING_DATE <= STARTING_DATE),
CHECK (STARTING_DATE <= ENDING_DATE)
)
CREATETABLE RENTER_EMAIL(
EMAIL_ADDR CHAR(20)NOTNULL,
RENTER_NO CHAR(4)NOTNULL,
PRIMARYKEY (EMAIL_ADDR,RENTER_NO),
FOREIGNKEY (RENTER_NO)REFERENCES RENTER
)
CREATETABLE STAFF_EMAIL(
EMAIL_ADDR CHAR(20)NOTNULL,
STAFF_NO CHAR(4)NOTNULL,
PRIMARYKEY (EMAIL_ADDR,STAFF_NO),
FOREIGNKEY (STAFF_NO)REFERENCES STAFF
)
CREATETABLE OWNER_EMAIL(
EMAIL_ADDR CHAR(20)NOTNULL,
OWNER_NO CHAR(4)NOTNULL,
PRIMARYKEY (EMAIL_ADDR,OWNER_NO),
FOREIGNKEY (OWNER_NO)REFERENCESOWNER
)
CREATETABLE BRANCH_EMAIL(
EMAIL_ADDR CHAR(20)NOTNULL,
BRANCH_NO CHAR(4)NOTNULL,
PRIMARYKEY (EMAIL_ADDR,BRANCH_NO),
FOREIGNKEY (BRANCH_NO)REFERENCES BRANCH
)
CREATETABLE RENTER_PHONE(
AREA_CODE CHAR(3)NOTNULL,
PHONE_NO CHAR(7)NOTNULL,
EXTENSION VARCHAR(5),
RENTER_NO CHAR(4)NOTNULL,
PRIMARYKEY (AREA_CODE,PHONE_NO,RENTER_NO),
FOREIGNKEY (RENTER_NO)REFERENCES RENTER,
CHECK(('0'<=SUBSTRING(AREA_CODE,1,1)ANDSUBSTRING(AREA_CODE,1,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,2,1)ANDSUBSTRING(AREA_CODE,2,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,3,1)ANDSUBSTRING(AREA_CODE,3,1)<='9')),
CHECK(('0'<=SUBSTRING(PHONE_NO,1,1)ANDSUBSTRING(PHONE_NO,1,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,2,1)ANDSUBSTRING(PHONE_NO,2,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,3,1)ANDSUBSTRING(PHONE_NO,3,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,4,1)ANDSUBSTRING(PHONE_NO,4,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,5,1)ANDSUBSTRING(PHONE_NO,5,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,6,1)ANDSUBSTRING(PHONE_NO,6,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,7,1)ANDSUBSTRING(PHONE_NO,7,1)<='9'))
)
CREATETABLE STAFF_PHONE(
AREA_CODE CHAR(3)NOTNULL,
PHONE_NO CHAR(7)NOTNULL,
EXTENSION VARCHAR(5),
STAFF_NO CHAR(4)NOTNULL,
PRIMARYKEY (AREA_CODE,PHONE_NO,STAFF_NO),
FOREIGNKEY (STAFF_NO)REFERENCES STAFF,
CHECK(('0'<=SUBSTRING(AREA_CODE,1,1)ANDSUBSTRING(AREA_CODE,1,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,2,1)ANDSUBSTRING(AREA_CODE,2,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,3,1)ANDSUBSTRING(AREA_CODE,3,1)<='9')),
CHECK(('0'<=SUBSTRING(PHONE_NO,1,1)ANDSUBSTRING(PHONE_NO,1,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,2,1)ANDSUBSTRING(PHONE_NO,2,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,3,1)ANDSUBSTRING(PHONE_NO,3,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,4,1)ANDSUBSTRING(PHONE_NO,4,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,5,1)ANDSUBSTRING(PHONE_NO,5,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,6,1)ANDSUBSTRING(PHONE_NO,6,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,7,1)ANDSUBSTRING(PHONE_NO,7,1)<='9'))
)
CREATETABLE OWNER_PHONE(
AREA_CODE CHAR(3)NOTNULL,
PHONE_NO CHAR(7)NOTNULL,
EXTENSION VARCHAR(5),
OWNER_NO CHAR(4)NOTNULL,
PRIMARYKEY (AREA_CODE,PHONE_NO,OWNER_NO),
FOREIGNKEY (OWNER_NO)REFERENCESOWNER,
CHECK(('0'<=SUBSTRING(AREA_CODE,1,1)ANDSUBSTRING(AREA_CODE,1,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,2,1)ANDSUBSTRING(AREA_CODE,2,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,3,1)ANDSUBSTRING(AREA_CODE,3,1)<='9')),
CHECK(('0'<=SUBSTRING(PHONE_NO,1,1)ANDSUBSTRING(PHONE_NO,1,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,2,1)ANDSUBSTRING(PHONE_NO,2,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,3,1)ANDSUBSTRING(PHONE_NO,3,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,4,1)ANDSUBSTRING(PHONE_NO,4,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,5,1)ANDSUBSTRING(PHONE_NO,5,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,6,1)ANDSUBSTRING(PHONE_NO,6,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,7,1)ANDSUBSTRING(PHONE_NO,7,1)<='9'))
)
CREATETABLE BRANCH_PHONE(
AREA_CODE CHAR(3)NOTNULL,
PHONE_NO CHAR(7)NOTNULL,
EXTENSION VARCHAR(5),
BRANCH_NO CHAR(4)NOTNULL,
PRIMARYKEY (AREA_CODE,PHONE_NO,BRANCH_NO),
FOREIGNKEY (BRANCH_NO)REFERENCES BRANCH,
CHECK(('0'<=SUBSTRING(AREA_CODE,1,1)ANDSUBSTRING(AREA_CODE,1,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,2,1)ANDSUBSTRING(AREA_CODE,2,1)<='9')
AND('0'<=SUBSTRING(AREA_CODE,3,1)ANDSUBSTRING(AREA_CODE,3,1)<='9')),
CHECK(('0'<=SUBSTRING(PHONE_NO,1,1)ANDSUBSTRING(PHONE_NO,1,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,2,1)ANDSUBSTRING(PHONE_NO,2,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,3,1)ANDSUBSTRING(PHONE_NO,3,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,4,1)ANDSUBSTRING(PHONE_NO,4,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,5,1)ANDSUBSTRING(PHONE_NO,5,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,6,1)ANDSUBSTRING(PHONE_NO,6,1)<='9')
AND('0'<=SUBSTRING(PHONE_NO,7,1)ANDSUBSTRING(PHONE_NO,7,1)<='9'))
)
CREATETABLE VIEWING(
PROPERTY_NO CHAR(4)NOTNULL,
RENTER_NO CHAR(4)NOTNULL,
VIEWING_DATE DATENOTNULL,
PRIMARYKEY (PROPERTY_NO,VIEWING_DATE,RENTER_NO),
FOREIGNKEY (PROPERTY_NO)REFERENCES PROPERTY,
FOREIGNKEY (RENTER_NO)REFERENCES RENTER
)
CREATETABLE NEWSPAPER(
PAPER_NAME CHAR(20)NOTNULL,
PRIMARYKEY (PAPER_NAME)
)
CREATETABLE ADVERTISEMENT(
PAPER_NAME CHAR(20)NOTNULL,
AD_NO CHAR(4)NOTNULL,
AD_DATE DATENOTNULL,
PROPERTY_NO CHAR(4)NOTNULL,
PRIMARYKEY (PAPER_NAME,AD_NO),
FOREIGNKEY (PAPER_NAME)REFERENCES NEWSPAPER,
FOREIGNKEY (PROPERTY_NO)REFERENCES PROPERTY
)
ALTERTABLE BRANCH
ADDCONSTRAINT MANAGER_CNST FOREIGNKEY (MANAGER)REFERENCES
STAFF(STAFF_NO)