PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "accounts_subscription" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "plan_id" integer NOT NULL, "plan_name" varchar(255) NOT NULL, "project_create" integer NOT NULL, "add_files" integer NOT NULL, "file_size" integer NOT NULL, "multifields" varchar(255) NOT NULL, "chart_plots" varchar(255) NOT NULL, "color_selection" bool NOT NULL, "custom_theme" bool NOT NULL, "graph_limit" integer NOT NULL, "logs" bool NOT NULL, "chart_download" varchar(255) NOT NULL, "shares" integer NOT NULL, "pdf_download" bool NOT NULL);
INSERT INTO accounts_subscription VALUES(1,1,'Basic',1,2,5,'','','','',6,'','',1,'');
INSERT INTO accounts_subscription VALUES(2,2,'Standard',5,15,20,'','','','',150,'','',5,'');
INSERT INTO accounts_subscription VALUES(3,3,'Premium',10,1000,1000,'','','','',1000,'','',10,'');
COMMIT;
