CREATE TABLE if not exists test1(a1 INT);
CREATE TABLE if not exists test2(a2 INT);
CREATE TABLE if not exists test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE if not exists test4(
  a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  b4 INT DEFAULT 0
);

DROP trigger if exists testref;

delimiter |
CREATE TRIGGER testref AFTER INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
    DELETE FROM test3 WHERE a3 = NEW.a1;
    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
  END;
  |
  
INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);
  
INSERT INTO test1 VALUES 
    (1), (3), (1), (7), (1), (8), (4), (4);
    
SELECT * FROM test4;    