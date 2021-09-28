CREATE SCHEMA IF NOT EXISTS reviews
  CREATE TABLE product_reviews(
    product_id SERIAL NOT NULL,
    -- int or smallint?
    page INT,
    count INT,
    -- to do
    results INT REFERENCES review_results (review_id)
    PRIMARY KEY(product_id)
  )
  CREATE TABLE review_results(
    review_id SERIAL NOT NULL,
    rating SMALLINT,
    summary VARCHAR(500),
    recommend BOOLEAN,
    PRIMARY KEY(review_id)
    -- this is null in atelier
    response ,
    body VARCHAR(500),
    date DATE,
    reviewer_name VARCHAR(5000),
    helpfulness SMALLINT,
    photos REFERENCES INT photos (id)
  )
  -- should this be a table or just an array value in photos?
  CREATE TABLE photos(
    id SERIAL PRIMARY KEY NOT NULL,
    url VARCHAR(200)
  )

CREATE SCHEMA IF NOT EXISTS meta
  CREATE TABLE ratings(
    -- this doesn't have a unique identifier in atelier?
    id NOT NULL,
    1 INT,
    2 INT,
    3 INT,
    4 INT,
    5 INT,
    PRIMARY KEY(id)
  )
  CREATE TABLE recommended(
    id SERIAL NOT NULL,
    true INT,
    false INT,
    PRIMARY KEY(id)
  )
  CREATE TABLE characteristics(
    id SERIAL NOT NULL,
    fit INT REFERENCES characteristic_values(id),
    length INT REFERENCES characteristic_values(id),
    size INT REFERENCES characteristic_values(id),
    width INT REFERENCES characteristic_values(id),
    comfort INT REFERENCES characteristic_values(id),
    quality INT REFERENCES characteristic_values(id),
    PRIMARY KEY(id)
  )
  CREATE TABLE characteristic_values(
    id SERIAL NOT NULL,
    value SMALLINT,
    PRIMARY KEY(id)
  )