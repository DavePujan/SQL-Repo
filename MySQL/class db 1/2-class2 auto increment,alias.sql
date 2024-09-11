USE school_db;
CREATE TABLE class2(id INT PRIMARY KEY auto_increment,sname VARCHAR(15) NOT NULL,student_type VARCHAR(15) DEFAULT 'REGULAR');
SELECT * FROM class2;

INSERT INTO class2 (sname) VALUE ("poojan"),("harsh"),("bhavy");
INSERT INTO class2 (id,sname) VALUE (1001,"shyam");
INSERT INTO class2 (sname) VALUE ("krips");

-- alias
SELECT id AS STD_ID FROM class2;