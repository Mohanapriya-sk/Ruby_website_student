PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
INSERT INTO schema_migrations VALUES('20240430181012');
INSERT INTO schema_migrations VALUES('20240430220549');
INSERT INTO schema_migrations VALUES('20240501051510');
INSERT INTO schema_migrations VALUES('20240501051514');
INSERT INTO schema_migrations VALUES('20240501115552');
INSERT INTO schema_migrations VALUES('20240501235759');
INSERT INTO schema_migrations VALUES('20240502044636');
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO ar_internal_metadata VALUES('environment','development','2024-04-30 18:56:01.861808','2024-04-30 18:56:01.861811');
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar, "password_digest" varchar, "name" varchar, "country" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "password" varchar, "password_reset_token" varchar, "password_reset_sent_at" datetime(6));
INSERT INTO users VALUES(2,'mohanapriyas123.mca@gmail.com','$2a$12$yzU40i4LSaLgxunoUMJi/eK4eFH5eqItp46WSJIZpDFVoRzglWM.y','mona','USA','2024-04-30 22:54:37.711526','2024-04-30 22:54:37.711526','123456',NULL,NULL);
INSERT INTO users VALUES(3,'mm@gmail.com','$2a$12$50Bauk2e1f0EaWz1.T7CnONOgWdTCKBm06GVrAOlGRVyjkzxhNcvW','mona','USA','2024-05-02 03:15:01.342258','2024-05-02 03:15:01.342258',NULL,NULL,NULL);
CREATE TABLE IF NOT EXISTS "expense_categories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "color" varchar, "enabled" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO expense_categories VALUES(1,'Food','Expenses related to food items','#FFA500',1,'2024-05-01 14:29:08','2024-05-01 14:29:08');
INSERT INTO expense_categories VALUES(2,'Transportation','Expenses related to transportation','#008000',1,'2024-05-01 14:29:08','2024-05-01 14:29:08');
INSERT INTO expense_categories VALUES(3,'Entertainment','Expenses related to entertainment','#FF0000',1,'2024-05-01 14:29:08','2024-05-01 14:29:08');
INSERT INTO expense_categories VALUES(5,'sdf','dfs','asdas',0,'2024-05-01 23:18:01.715327','2024-05-01 23:18:01.715327');
INSERT INTO expense_categories VALUES(6,'asd','asd','asd',0,'2024-05-01 23:18:51.377795','2024-05-01 23:18:51.377795');
INSERT INTO expense_categories VALUES(7,'das','dasd','asd',1,'2024-05-01 23:27:32.241089','2024-05-01 23:27:32.241089');
INSERT INTO expense_categories VALUES(8,'sd333','333','333',1,'2024-05-01 23:32:39.683925','2024-05-01 23:32:39.683925');
INSERT INTO expense_categories VALUES(9,'asf','asd','sdf',0,'2024-05-01 23:34:51.982302','2024-05-01 23:34:51.982302');
CREATE TABLE IF NOT EXISTS "expenses" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar DEFAULT NULL, "expense_category_id" integer DEFAULT NULL, "currency" varchar DEFAULT NULL, "total" decimal DEFAULT NULL, "description" text DEFAULT NULL, "ref" varchar DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "user_id" integer NOT NULL, CONSTRAINT "fk_rails_c3ee69df61"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
INSERT INTO expenses VALUES(3,'rty6',2,'JPY',46,'56','rt6','2024-05-01 16:01:46.731187','2024-05-01 20:22:44.959407',2);
INSERT INTO expenses VALUES(4,'def',1,'USD',0,'dfsd','sdf','2024-05-01 16:02:24.517695','2024-05-01 16:02:24.517695',2);
INSERT INTO expenses VALUES(5,'asd',1,'EUR',5,'sdf','df','2024-05-01 16:05:37.747701','2024-05-01 16:05:37.747701',2);
INSERT INTO expenses VALUES(6,'asd',1,'EUR',5,'sdf','df','2024-05-01 16:05:41.970669','2024-05-01 16:05:41.970669',2);
INSERT INTO expenses VALUES(7,'adtttt',1,'USD',123,'tt','ttt','2024-05-01 16:22:32.730640','2024-05-01 16:22:32.730640',2);
INSERT INTO expenses VALUES(8,'rrrr',1,'USD',0,'rrr','rr','2024-05-01 16:23:46.390710','2024-05-01 16:23:46.390710',2);
INSERT INTO expenses VALUES(9,'rrr',1,'USD',0,'rrr','rrr','2024-05-01 16:24:10.711736','2024-05-01 16:24:10.711736',2);
INSERT INTO expenses VALUES(10,'Meena',1,'USD',0,'asd','asd','2024-05-01 16:25:31.728870','2024-05-01 16:25:31.728870',2);
CREATE TABLE IF NOT EXISTS "admins" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar, "last_name" varchar, "email" varchar, "branch" varchar, "password_digest" varchar, "role" varchar, "enabled" boolean, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO admins VALUES(1,'mohana','priya','mohana@gmail.com','Main','$2a$12$MuxO3fEQQQ9bBKJAx7Cs3.zvGYtNd8gUsBD..otsesqGTp2zNZjWu','Manager',1,'2024-05-02 02:18:58.059946','2024-05-02 02:18:58.059946');
INSERT INTO admins VALUES(3,'dfs','sd','sdf@asd.asd','Main','$2a$12$HWraeom3PwOQ.7SF.6dGf.hT6Hs9KTGEp5xXzGQeZl0m6rd66gR7K','Account Owner',0,'2024-05-02 02:38:19.860376','2024-05-02 02:38:19.860376');
INSERT INTO admins VALUES(4,'mohanaa','jj','hgjhgh@jhbj.ad','Main','$2a$12$u0L09iy1fw94hK7dwdDg4uJoFnHZL5nj7k6RtafOq9l.SGQD5C5GG','Employee',0,'2024-05-02 02:40:05.258735','2024-05-02 02:40:05.258735');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('users',3);
INSERT INTO sqlite_sequence VALUES('expenses',10);
INSERT INTO sqlite_sequence VALUES('expense_categories',9);
INSERT INTO sqlite_sequence VALUES('admins',4);
CREATE INDEX "index_expenses_on_user_id" ON "expenses" ("user_id");
CREATE INDEX "index_users_on_password_reset_token" ON "users" ("password_reset_token");
COMMIT;