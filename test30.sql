-- 2016.04.28 ¿¹¾à
CREATE TABLE reserve(
    no NUMBER,
    id VARCHAR2(20) CONSTRAINT r_nn_id NOT NULL,
    title VARCHAR2(200) CONSTRAINT r_nn_title NOT NULL,
    theater VARCHAR2(200) CONSTRAINT r_nn_th NOT NULL,
    day VARCHAR2(20) CONSTRAINT r_nn_day NOT NULL,
    inwon NUMBER(1),
    price NUMBER,
    reserve_check NUMBER(1) DEFAULT 0,
    CONSTRAINT r_pk_no PRIMARY KEY(no)
);