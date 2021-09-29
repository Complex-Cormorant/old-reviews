-- are IDs going to be given in the data or is the db expected to assing them? (int or serial?)

CREATE SCHEMA IF NOT EXISTS reviews
  CREATE TABLE review_results(
    review_id INT NOT NULL,
    product_id SERIAL NOT NULL,
    summary VARCHAR(500),
    recommended BOOLEAN,
    PRIMARY KEY(review_id),
    rating INT,
    -- this is null in atelier
    response null,
    body VARCHAR(500),
    date DATE,
    reviewer_name VARCHAR(5000),
    email VARCHAR(50),
    helpfulness SERIAL,
    reported BOOLEAN,
    photos INT REFERENCES photos (id),
    ratings INT REFERENCES ratings (id)
  )
  CREATE TABLE photos(
    id SERIAL NOT NULL,
    url VARCHAR(200),
    PRIMARY KEY (id)
  )

  CREATE TYPE characteristics AS ENUM ('fit', 'length', 'size', 'width', 'comfort', 'quality')

  CREATE TABLE characteristics(
    characteristic_id INT NOT NULL PRIMARY KEY,
    characteristic characteristics,
  )

  CREATE TABLE review_characteristics(
    review_id INT REFERENCES review_results (review_id),
    characteristic_id INT REFERENCES characteristics (characteristic_id),
    value INT
  )


-- use tables already in existed
-- CREATE SCHEMA IF NOT EXISTS meta

--   CREATE TABLE recommended(
--     id SERIAL NOT NULL,
--     true INT,
--     false INT,
--     PRIMARY KEY(id)
--   )
  -- move into results schema, add name & enum
  -- CREATE TABLE characteristics(
  --   id SERIAL NOT NULL,
  --   fit INT REFERENCES characteristic_values(id),
  --   length INT REFERENCES characteristic_values(id),
  --   size INT REFERENCES characteristic_values(id),
  --   width INT REFERENCES characteristic_values(id),
  --   comfort INT REFERENCES characteristic_values(id),
  --   quality INT REFERENCES characteristic_values(id),
  --   PRIMARY KEY(id)
  -- )
  -- CREATE TABLE characteristic_values(
  --   id SERIAL NOT NULL,
  --   value SMALLINT,
  --   PRIMARY KEY(id)
  -- )

  -- CREATE TABLE product_reviews(
  --   -- already has ID, move into reviews table

  --   -- int or smallint?
  --   page INT,
  --   -- default or limit, handle on query
  --   count INT,
  --   -- to do
  --   results INT REFERENCES review_results (review_id)
  --   PRIMARY KEY(product_id)
  -- )

  -- CREATE TABLE ratings(
  --   id SERIAL NOT NULL,
  --   1 INT,
  --   2 INT,
  --   3 INT,
  --   4 INT,
  --   5 INT,
  --   PRIMARY KEY(id)
  -- )