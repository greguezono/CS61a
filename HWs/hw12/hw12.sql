CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size FROM dogs AS d, sizes AS s
  WHERE s.min < d.height AND d.height <= s.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE parent_heights AS
  SELECT p.parent, p.child, d.height FROM parents AS p, dogs AS d 
  WHERE p.parent = d.name;

CREATE TABLE by_height AS
  SELECT d.name FROM dogs AS d, parent_heights AS ph
  WHERE d.name = ph.child ORDER BY ph.height DESC;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT DISTINCT a.child, a.parent, c.size FROM parents as a, parents as b, size_of_dogs as c 
  WHERE a.parent = b.parent AND a.child <> b.child AND a.child = c.name;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT a.child || ' and ' || b.child || ' are ' || a.size || ' siblings'
  FROM siblings as a, siblings as b
  WHERE a.parent = b.parent AND a.size = b.size AND a.child < b.child;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
INSERT INTO stacks_helper(dogs, stack_height, last_height) SELECT name , height, height FROM dogs;

INSERT INTO stacks_helper(dogs, stack_height, last_height)
  SELECT a.dogs || ', ' || b.name, a.stack_height + b.height, b.height FROM stacks_helper as a, dogs as b
  WHERE a.dogs <> b.name AND b.height > a.last_height;

INSERT INTO stacks_helper(dogs, stack_height, last_height)
  SELECT a.dogs || ', ' || b.name, a.stack_height + b.height, b.height FROM stacks_helper as a, dogs as b
  WHERE a.dogs <> b.name AND b.height > a.last_height;

INSERT INTO stacks_helper(dogs, stack_height, last_height)
  SELECT a.dogs || ', ' || b.name, a.stack_height + b.height, b.height FROM stacks_helper as a, dogs as b
  WHERE a.dogs <> b.name AND b.height > a.last_height;


CREATE TABLE stacks AS
  SELECT dogs, stack_height FROM stacks_helper WHERE stack_height > 170 ORDER BY stack_height;




