drop table if exists tasks;

CREATE TABLE tasks (
  id  SERIAL PRIMARY KEY,
  title  character varying (255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT null default now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL default false
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks
ADD COLUMN completed_at timestamp NULL default NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at
SET NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at
SET default now();

INSERT INTO tasks
VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;