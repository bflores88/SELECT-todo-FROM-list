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

INSERT INTO tasks (id, title, description, created_at, updated_at, completed_at)
VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

select *
FROM tasks
WHERE completed_at is NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

select title, description
from tasks
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

delete
FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;