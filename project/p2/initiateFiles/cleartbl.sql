-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.
DELETE FROM Institute;
DELETE FROM Midwife;
DELETE FROM Birthingcenter;
DELETE FROM CommunityClinic;
DELETE FROM Mother;
DELETE FROM Father;
DELETE FROM Couple;
DELETE FROM Technician;
DELETE FROM Pregnancy;
DELETE FROM Baby;
DELETE FROM Tests;
DELETE FROM InfoSession;
DELETE FROM Appointment;
DELETE FROM InfoSessionRegistration;
DELETE FROM Notes;


