CREATE TABLE tasks (
  id  SERIAL PRIMARY KEY,
  tite  character varying (255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT null default now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL default false
)

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp NULL default NULL;