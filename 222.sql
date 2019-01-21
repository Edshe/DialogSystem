/*
 Navicat Premium Data Transfer

 Source Server         : TestBot
 Source Server Type    : SQLite
 Source Server Version : 3021000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3021000
 File Encoding         : 65001

 Date: 22/01/2019 01:21:39
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "auth_group" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar(80) NOT NULL,
  UNIQUE ("name" ASC)
);

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "auth_group_permissions" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "group_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "auth_permission" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "content_type_id" integer NOT NULL,
  "codename" varchar(100) NOT NULL,
  "name" varchar(255) NOT NULL,
  FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO "auth_permission" VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO "auth_permission" VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO "auth_permission" VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO "auth_permission" VALUES (4, 2, 'add_group', 'Can add group');
INSERT INTO "auth_permission" VALUES (5, 2, 'change_group', 'Can change group');
INSERT INTO "auth_permission" VALUES (6, 2, 'delete_group', 'Can delete group');
INSERT INTO "auth_permission" VALUES (7, 3, 'add_permission', 'Can add permission');
INSERT INTO "auth_permission" VALUES (8, 3, 'change_permission', 'Can change permission');
INSERT INTO "auth_permission" VALUES (9, 3, 'delete_permission', 'Can delete permission');
INSERT INTO "auth_permission" VALUES (10, 4, 'add_contenttype', 'Can add content type');
INSERT INTO "auth_permission" VALUES (11, 4, 'change_contenttype', 'Can change content type');
INSERT INTO "auth_permission" VALUES (12, 4, 'delete_contenttype', 'Can delete content type');
INSERT INTO "auth_permission" VALUES (13, 5, 'add_session', 'Can add session');
INSERT INTO "auth_permission" VALUES (14, 5, 'change_session', 'Can change session');
INSERT INTO "auth_permission" VALUES (15, 5, 'delete_session', 'Can delete session');
INSERT INTO "auth_permission" VALUES (16, 6, 'add_user', 'Can add User');
INSERT INTO "auth_permission" VALUES (17, 6, 'change_user', 'Can change User');
INSERT INTO "auth_permission" VALUES (18, 6, 'delete_user', 'Can delete User');
INSERT INTO "auth_permission" VALUES (19, 7, 'add_useranswer', 'Can add user answer');
INSERT INTO "auth_permission" VALUES (20, 7, 'change_useranswer', 'Can change user answer');
INSERT INTO "auth_permission" VALUES (21, 7, 'delete_useranswer', 'Can delete user answer');
INSERT INTO "auth_permission" VALUES (22, 8, 'add_dialog', 'Can add dialog');
INSERT INTO "auth_permission" VALUES (23, 8, 'change_dialog', 'Can change dialog');
INSERT INTO "auth_permission" VALUES (24, 8, 'delete_dialog', 'Can delete dialog');
INSERT INTO "auth_permission" VALUES (25, 9, 'add_question', 'Can add question');
INSERT INTO "auth_permission" VALUES (26, 9, 'change_question', 'Can change question');
INSERT INTO "auth_permission" VALUES (27, 9, 'delete_question', 'Can delete question');
INSERT INTO "auth_permission" VALUES (28, 10, 'add_choice', 'Can add choice');
INSERT INTO "auth_permission" VALUES (29, 10, 'change_choice', 'Can change choice');
INSERT INTO "auth_permission" VALUES (30, 10, 'delete_choice', 'Can delete choice');
INSERT INTO "auth_permission" VALUES (31, 11, 'add_questionnaire', 'Can add questionnaire');
INSERT INTO "auth_permission" VALUES (32, 11, 'change_questionnaire', 'Can change questionnaire');
INSERT INTO "auth_permission" VALUES (33, 11, 'delete_questionnaire', 'Can delete questionnaire');
INSERT INTO "auth_permission" VALUES (34, 12, 'add_questionnairefinishtext', 'Can add questionnaire finish text');
INSERT INTO "auth_permission" VALUES (35, 12, 'change_questionnairefinishtext', 'Can change questionnaire finish text');
INSERT INTO "auth_permission" VALUES (36, 12, 'delete_questionnairefinishtext', 'Can delete questionnaire finish text');

-- ----------------------------
-- Table structure for dialogs_dialog
-- ----------------------------
DROP TABLE IF EXISTS "dialogs_dialog";
CREATE TABLE "dialogs_dialog" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "created" datetime NOT NULL,
  "questionnaire_id" integer NOT NULL,
  "user_id" integer,
  FOREIGN KEY ("questionnaire_id") REFERENCES "questionnaires_questionnaire" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("user_id") REFERENCES "users_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of dialogs_dialog
-- ----------------------------
INSERT INTO "dialogs_dialog" VALUES (79, '2019-01-21 22:58:12.631000', 13, NULL);
INSERT INTO "dialogs_dialog" VALUES (80, '2019-01-21 23:02:45.399000', 13, NULL);
INSERT INTO "dialogs_dialog" VALUES (81, '2019-01-21 23:10:30.699000', 13, 1);
INSERT INTO "dialogs_dialog" VALUES (82, '2019-01-21 23:10:34.444000', 13, 1);
INSERT INTO "dialogs_dialog" VALUES (83, '2019-01-21 23:12:29.056000', 13, 1);

-- ----------------------------
-- Table structure for dialogs_useranswer
-- ----------------------------
DROP TABLE IF EXISTS "dialogs_useranswer";
CREATE TABLE "dialogs_useranswer" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "choice_id" integer,
  "dialog_id" integer,
  FOREIGN KEY ("choice_id") REFERENCES "questionnaires_choice" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("dialog_id") REFERENCES "dialogs_dialog" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of dialogs_useranswer
-- ----------------------------
INSERT INTO "dialogs_useranswer" VALUES (135, 20, 74);
INSERT INTO "dialogs_useranswer" VALUES (136, 21, 75);
INSERT INTO "dialogs_useranswer" VALUES (137, 21, 75);
INSERT INTO "dialogs_useranswer" VALUES (138, 21, 76);
INSERT INTO "dialogs_useranswer" VALUES (139, 21, 77);
INSERT INTO "dialogs_useranswer" VALUES (140, 21, 77);
INSERT INTO "dialogs_useranswer" VALUES (141, 20, 77);
INSERT INTO "dialogs_useranswer" VALUES (142, 21, 78);
INSERT INTO "dialogs_useranswer" VALUES (143, 21, 78);
INSERT INTO "dialogs_useranswer" VALUES (144, 21, 79);
INSERT INTO "dialogs_useranswer" VALUES (145, 20, 79);
INSERT INTO "dialogs_useranswer" VALUES (146, 20, 80);
INSERT INTO "dialogs_useranswer" VALUES (147, 21, 81);
INSERT INTO "dialogs_useranswer" VALUES (148, 22, 81);
INSERT INTO "dialogs_useranswer" VALUES (149, 21, 82);
INSERT INTO "dialogs_useranswer" VALUES (150, 23, 82);
INSERT INTO "dialogs_useranswer" VALUES (151, 24, 82);
INSERT INTO "dialogs_useranswer" VALUES (152, 21, 83);
INSERT INTO "dialogs_useranswer" VALUES (153, 26, 83);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "django_admin_log" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "object_id" text,
  "object_repr" varchar(200) NOT NULL,
  "action_flag" smallint unsigned NOT NULL,
  "change_message" text NOT NULL,
  "content_type_id" integer,
  "user_id" integer NOT NULL,
  "action_time" datetime NOT NULL,
  FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("user_id") REFERENCES "users_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO "django_admin_log" VALUES (1, 1, '1: For hungry people', 1, '[{"added": {}}]', 11, 1, '2019-01-16 08:47:57.151000');
INSERT INTO "django_admin_log" VALUES (2, 2, '2: Something else', 1, '[{"added": {}}]', 11, 1, '2019-01-16 08:48:06.656000');
INSERT INTO "django_admin_log" VALUES (3, 1, '1: For hungry people', 2, '[{"added": {"object": "For hungry people: Are you hungry?", "name": "question"}}, {"added": {"object": "For hungry people: What would you like to eat?", "name": "question"}}, {"added": {"object": "For hungry people: Would you like pizza with mushrooms?", "name": "question"}}]', 11, 1, '2019-01-16 08:58:26.409000');
INSERT INTO "django_admin_log" VALUES (4, 1, 'QuestionnaireFinishText object', 1, '[{"added": {}}]', 12, 1, '2019-01-16 09:00:41.370000');
INSERT INTO "django_admin_log" VALUES (5, 1, 'For hungry people: Are you hungry?', 2, '[{"added": {"object": "Yes", "name": "choice"}}, {"added": {"object": "No", "name": "choice"}}]', 9, 1, '2019-01-16 09:03:08.324000');
INSERT INTO "django_admin_log" VALUES (6, 2, 'Nice, I will order a hamburger for you!', 1, '[{"added": {}}]', 12, 1, '2019-01-16 09:04:00.216000');
INSERT INTO "django_admin_log" VALUES (7, 3, 'Nice, I will order a pop corn for you!', 1, '[{"added": {}}]', 12, 1, '2019-01-16 09:04:46.895000');
INSERT INTO "django_admin_log" VALUES (8, 3, 'Nice, I will order a chicken for you!', 2, '[{"changed": {"fields": ["text"]}}]', 12, 1, '2019-01-16 09:05:06.354000');
INSERT INTO "django_admin_log" VALUES (9, 2, 'For hungry people: What would you like to eat?', 2, '[{"added": {"object": "Hamburger", "name": "choice"}}, {"added": {"object": "Pizza", "name": "choice"}}, {"added": {"object": "Chicken", "name": "choice"}}]', 9, 1, '2019-01-16 09:05:08.380000');
INSERT INTO "django_admin_log" VALUES (10, 4, 'Ok, I will order the best pizza in town for you', 1, '[{"added": {}}]', 12, 1, '2019-01-16 09:06:20.227000');
INSERT INTO "django_admin_log" VALUES (11, 5, 'No? Well... stay hungry then', 1, '[{"added": {}}]', 12, 1, '2019-01-16 09:06:49.830000');
INSERT INTO "django_admin_log" VALUES (12, 3, 'For hungry people: Would you like pizza with mushrooms?', 2, '[{"added": {"object": "Yes", "name": "choice"}}, {"added": {"object": "No", "name": "choice"}}]', 9, 1, '2019-01-16 09:06:54.689000');
INSERT INTO "django_admin_log" VALUES (13, 14, 'Nice, I will order a chicken for you!', 1, '[{"added": {}}]', 12, 1, '2019-01-21 23:12:20.021000');
INSERT INTO "django_admin_log" VALUES (14, 26, 'Chicken', 1, '[{"added": {}}]', 10, 1, '2019-01-21 23:12:23.134000');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "django_content_type" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "app_label" varchar(100) NOT NULL,
  "model" varchar(100) NOT NULL
);

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO "django_content_type" VALUES (1, 'admin', 'logentry');
INSERT INTO "django_content_type" VALUES (2, 'auth', 'group');
INSERT INTO "django_content_type" VALUES (3, 'auth', 'permission');
INSERT INTO "django_content_type" VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO "django_content_type" VALUES (5, 'sessions', 'session');
INSERT INTO "django_content_type" VALUES (6, 'users', 'user');
INSERT INTO "django_content_type" VALUES (7, 'dialogs', 'useranswer');
INSERT INTO "django_content_type" VALUES (8, 'dialogs', 'dialog');
INSERT INTO "django_content_type" VALUES (9, 'questionnaires', 'question');
INSERT INTO "django_content_type" VALUES (10, 'questionnaires', 'choice');
INSERT INTO "django_content_type" VALUES (11, 'questionnaires', 'questionnaire');
INSERT INTO "django_content_type" VALUES (12, 'questionnaires', 'questionnairefinishtext');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "django_migrations" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "app" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "applied" datetime NOT NULL
);

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO "django_migrations" VALUES (1, 'contenttypes', '0001_initial', '2019-01-15 11:26:25.160000');
INSERT INTO "django_migrations" VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2019-01-15 11:26:25.197000');
INSERT INTO "django_migrations" VALUES (3, 'auth', '0001_initial', '2019-01-15 11:26:25.244000');
INSERT INTO "django_migrations" VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2019-01-15 11:26:25.271000');
INSERT INTO "django_migrations" VALUES (5, 'auth', '0003_alter_user_email_max_length', '2019-01-15 11:26:25.286000');
INSERT INTO "django_migrations" VALUES (6, 'auth', '0004_alter_user_username_opts', '2019-01-15 11:26:25.302000');
INSERT INTO "django_migrations" VALUES (7, 'auth', '0005_alter_user_last_login_null', '2019-01-15 11:26:25.343000');
INSERT INTO "django_migrations" VALUES (8, 'auth', '0006_require_contenttypes_0002', '2019-01-15 11:26:25.356000');
INSERT INTO "django_migrations" VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2019-01-15 11:26:25.372000');
INSERT INTO "django_migrations" VALUES (10, 'auth', '0008_alter_user_username_max_length', '2019-01-15 11:26:25.389000');
INSERT INTO "django_migrations" VALUES (11, 'users', '0001_initial', '2019-01-15 11:26:25.418000');
INSERT INTO "django_migrations" VALUES (12, 'admin', '0001_initial', '2019-01-15 11:26:25.452000');
INSERT INTO "django_migrations" VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2019-01-15 11:26:25.486000');
INSERT INTO "django_migrations" VALUES (14, 'questionnaires', '0001_initial', '2019-01-15 11:26:25.533000');
INSERT INTO "django_migrations" VALUES (15, 'dialogs', '0001_initial', '2019-01-15 11:26:25.565000');
INSERT INTO "django_migrations" VALUES (16, 'dialogs', '0002_dialog_user', '2019-01-15 11:26:25.600000');
INSERT INTO "django_migrations" VALUES (17, 'sessions', '0001_initial', '2019-01-15 11:26:25.625000');
INSERT INTO "django_migrations" VALUES (18, 'questionnaires', '0002_question_position', '2019-01-16 08:46:16.146000');
INSERT INTO "django_migrations" VALUES (19, 'questionnaires', '0003_remove_questionnaire_is_finished', '2019-01-16 08:47:39.614000');
INSERT INTO "django_migrations" VALUES (20, 'dialogs', '0003_auto_20190116_1620', '2019-01-16 14:20:39.953000');
INSERT INTO "django_migrations" VALUES (21, 'questionnaires', '0004_auto_20190116_1620', '2019-01-16 14:20:40.011000');
INSERT INTO "django_migrations" VALUES (22, 'dialogs', '0004_auto_20190116_1811', '2019-01-16 16:11:58.638000');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS "django_session";
CREATE TABLE "django_session" (
  "session_key" varchar(40) NOT NULL,
  "session_data" text NOT NULL,
  "expire_date" datetime NOT NULL,
  PRIMARY KEY ("session_key")
);

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO "django_session" VALUES ('ahwcem50u01rjenwskm4kz72nocnlubq', 'Yzk5MDhhMzFlZjU1NzliOTc3YzJjZDBmOWNhYTQ1ZWFmNTZiYTZmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0ZDFiYjY0YTkzYjE4NTczMTdmMTQ5MDI5MWEzZTQ4NDViZGJhN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-01-31 00:43:54.034000');
INSERT INTO "django_session" VALUES ('nck7ztpg0ahg60yvgiu87mv8gcqj42f8', 'Yzk5MDhhMzFlZjU1NzliOTc3YzJjZDBmOWNhYTQ1ZWFmNTZiYTZmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImY0ZDFiYjY0YTkzYjE4NTczMTdmMTQ5MDI5MWEzZTQ4NDViZGJhN2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-02-04 23:09:25.074000');

-- ----------------------------
-- Table structure for questionnaires_choice
-- ----------------------------
DROP TABLE IF EXISTS "questionnaires_choice";
CREATE TABLE "questionnaires_choice" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "text" varchar(150) NOT NULL,
  "finish_id" integer,
  "question_id" integer NOT NULL,
  "next_question_id" integer,
  FOREIGN KEY ("finish_id") REFERENCES "questionnaires_questionnairefinishtext" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("question_id") REFERENCES "questionnaires_question" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("next_question_id") REFERENCES "questionnaires_question" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of questionnaires_choice
-- ----------------------------
INSERT INTO "questionnaires_choice" VALUES (20, 'No', 10, 21, NULL);
INSERT INTO "questionnaires_choice" VALUES (21, 'Yes', NULL, 21, 22);
INSERT INTO "questionnaires_choice" VALUES (22, 'Hamburger', 11, 22, NULL);
INSERT INTO "questionnaires_choice" VALUES (23, 'Piza', NULL, 22, 23);
INSERT INTO "questionnaires_choice" VALUES (24, 'Yes', 12, 23, NULL);
INSERT INTO "questionnaires_choice" VALUES (25, 'No', 13, 23, NULL);
INSERT INTO "questionnaires_choice" VALUES (26, 'Chicken', 14, 22, NULL);

-- ----------------------------
-- Table structure for questionnaires_question
-- ----------------------------
DROP TABLE IF EXISTS "questionnaires_question";
CREATE TABLE "questionnaires_question" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "text" varchar(100) NOT NULL,
  "questionnaire_id" integer NOT NULL,
  "position" smallint NOT NULL,
  FOREIGN KEY ("questionnaire_id") REFERENCES "questionnaires_questionnaire" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Records of questionnaires_question
-- ----------------------------
INSERT INTO "questionnaires_question" VALUES (21, 'Are u hungry?', 13, 1);
INSERT INTO "questionnaires_question" VALUES (22, 'What would you like to eat?', 13, 2);
INSERT INTO "questionnaires_question" VALUES (23, 'Would you like pizza with mushrooms?', 13, 3);

-- ----------------------------
-- Table structure for questionnaires_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS "questionnaires_questionnaire";
CREATE TABLE "questionnaires_questionnaire" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "name" varchar(50) NOT NULL
);

-- ----------------------------
-- Records of questionnaires_questionnaire
-- ----------------------------
INSERT INTO "questionnaires_questionnaire" VALUES (13, 'For hungry people');

-- ----------------------------
-- Table structure for questionnaires_questionnairefinishtext
-- ----------------------------
DROP TABLE IF EXISTS "questionnaires_questionnairefinishtext";
CREATE TABLE "questionnaires_questionnairefinishtext" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "text" varchar(150) NOT NULL
);

-- ----------------------------
-- Records of questionnaires_questionnairefinishtext
-- ----------------------------
INSERT INTO "questionnaires_questionnairefinishtext" VALUES (10, 'Ok. Call me when you''re hungry.');
INSERT INTO "questionnaires_questionnairefinishtext" VALUES (11, 'Nice, I will order a hamburger for you!');
INSERT INTO "questionnaires_questionnairefinishtext" VALUES (12, 'Ok, I will order the best pizza in town for you!');
INSERT INTO "questionnaires_questionnairefinishtext" VALUES (13, 'No? Well... stay hungry then');
INSERT INTO "questionnaires_questionnairefinishtext" VALUES (14, 'Nice, I will order a chicken for you!');



-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('django_migrations', 22);
INSERT INTO "sqlite_sequence" VALUES ('django_content_type', 12);
INSERT INTO "sqlite_sequence" VALUES ('auth_permission', 36);
INSERT INTO "sqlite_sequence" VALUES ('django_admin_log', 14);
INSERT INTO "sqlite_sequence" VALUES ('users_user', 1);
INSERT INTO "sqlite_sequence" VALUES ('questionnaires_question', 23);
INSERT INTO "sqlite_sequence" VALUES ('questionnaires_questionnaire', 13);
INSERT INTO "sqlite_sequence" VALUES ('questionnaires_questionnairefinishtext', 14);
INSERT INTO "sqlite_sequence" VALUES ('dialogs_dialog', 83);
INSERT INTO "sqlite_sequence" VALUES ('questionnaires_choice', 26);
INSERT INTO "sqlite_sequence" VALUES ('dialogs_useranswer', 153);

-- ----------------------------
-- Table structure for users_user
-- ----------------------------
DROP TABLE IF EXISTS "users_user";
CREATE TABLE "users_user" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "password" varchar(128) NOT NULL,
  "last_login" datetime,
  "is_superuser" bool NOT NULL,
  "email" varchar(254) NOT NULL,
  "is_staff" bool NOT NULL,
  "is_active" bool NOT NULL,
  "date_joined" datetime NOT NULL,
  UNIQUE ("email" ASC)
);

-- ----------------------------
-- Records of users_user
-- ----------------------------
INSERT INTO "users_user" VALUES (1, 'pbkdf2_sha256$36000$TsAEmoQWQ0JU$vN1zgksR3Ihs58XwL2QCyTK85EFan+RxbxZkpqPLJ0Y=', '2019-01-21 23:09:25.064000', 1, 'e.shemahov@gmail.com', 1, 1, '2019-01-16 08:36:34.734000');

-- ----------------------------
-- Table structure for users_user_groups
-- ----------------------------
DROP TABLE IF EXISTS "users_user_groups";
CREATE TABLE "users_user_groups" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" integer NOT NULL,
  "group_id" integer NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "users_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Table structure for users_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "users_user_user_permissions";
CREATE TABLE "users_user_user_permissions" (
  "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  "user_id" integer NOT NULL,
  "permission_id" integer NOT NULL,
  FOREIGN KEY ("user_id") REFERENCES "users_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- ----------------------------
-- Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX "auth_group_permissions_group_id_b120cbf9"
ON "auth_group_permissions" (
  "group_id" ASC
);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq"
ON "auth_group_permissions" (
  "group_id" ASC,
  "permission_id" ASC
);
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e"
ON "auth_group_permissions" (
  "permission_id" ASC
);

-- ----------------------------
-- Auto increment value for auth_permission
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 36 WHERE name = 'auth_permission';

-- ----------------------------
-- Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX "auth_permission_content_type_id_2f476e4b"
ON "auth_permission" (
  "content_type_id" ASC
);
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq"
ON "auth_permission" (
  "content_type_id" ASC,
  "codename" ASC
);

-- ----------------------------
-- Auto increment value for dialogs_dialog
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 83 WHERE name = 'dialogs_dialog';

-- ----------------------------
-- Indexes structure for table dialogs_dialog
-- ----------------------------
CREATE INDEX "dialogs_dialog_questionnaire_id_b85da7ed"
ON "dialogs_dialog" (
  "questionnaire_id" ASC
);
CREATE INDEX "dialogs_dialog_user_id_f55ae70f"
ON "dialogs_dialog" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for dialogs_useranswer
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 153 WHERE name = 'dialogs_useranswer';

-- ----------------------------
-- Indexes structure for table dialogs_useranswer
-- ----------------------------
CREATE INDEX "dialogs_useranswer_choice_id_ed9fdebc"
ON "dialogs_useranswer" (
  "choice_id" ASC
);
CREATE INDEX "dialogs_useranswer_dialog_id_20a40ed5"
ON "dialogs_useranswer" (
  "dialog_id" ASC
);

-- ----------------------------
-- Auto increment value for django_admin_log
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 14 WHERE name = 'django_admin_log';

-- ----------------------------
-- Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb"
ON "django_admin_log" (
  "content_type_id" ASC
);
CREATE INDEX "django_admin_log_user_id_c564eba6"
ON "django_admin_log" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for django_content_type
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 12 WHERE name = 'django_content_type';

-- ----------------------------
-- Indexes structure for table django_content_type
-- ----------------------------
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq"
ON "django_content_type" (
  "app_label" ASC,
  "model" ASC
);

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 22 WHERE name = 'django_migrations';

-- ----------------------------
-- Indexes structure for table django_session
-- ----------------------------
CREATE INDEX "django_session_expire_date_a5c62663"
ON "django_session" (
  "expire_date" ASC
);

-- ----------------------------
-- Auto increment value for questionnaires_choice
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 26 WHERE name = 'questionnaires_choice';

-- ----------------------------
-- Indexes structure for table questionnaires_choice
-- ----------------------------
CREATE INDEX "questionnaires_choice_finish_id_cb1b618c"
ON "questionnaires_choice" (
  "finish_id" ASC
);
CREATE INDEX "questionnaires_choice_next_question_id_7a494426"
ON "questionnaires_choice" (
  "next_question_id" ASC
);
CREATE INDEX "questionnaires_choice_question_id_59e2b84c"
ON "questionnaires_choice" (
  "question_id" ASC
);

-- ----------------------------
-- Auto increment value for questionnaires_question
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 23 WHERE name = 'questionnaires_question';

-- ----------------------------
-- Indexes structure for table questionnaires_question
-- ----------------------------
CREATE INDEX "questionnaires_question_questionnaire_id_df065d5a"
ON "questionnaires_question" (
  "questionnaire_id" ASC
);

-- ----------------------------
-- Auto increment value for questionnaires_questionnaire
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 13 WHERE name = 'questionnaires_questionnaire';

-- ----------------------------
-- Auto increment value for questionnaires_questionnairefinishtext
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 14 WHERE name = 'questionnaires_questionnairefinishtext';

-- ----------------------------
-- Auto increment value for users_user
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 1 WHERE name = 'users_user';

-- ----------------------------
-- Indexes structure for table users_user_groups
-- ----------------------------
CREATE INDEX "users_user_groups_group_id_9afc8d0e"
ON "users_user_groups" (
  "group_id" ASC
);
CREATE INDEX "users_user_groups_user_id_5f6f5a90"
ON "users_user_groups" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "users_user_groups_user_id_group_id_b88eab82_uniq"
ON "users_user_groups" (
  "user_id" ASC,
  "group_id" ASC
);

-- ----------------------------
-- Indexes structure for table users_user_user_permissions
-- ----------------------------
CREATE INDEX "users_user_user_permissions_permission_id_0b93982e"
ON "users_user_user_permissions" (
  "permission_id" ASC
);
CREATE INDEX "users_user_user_permissions_user_id_20aca447"
ON "users_user_user_permissions" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "users_user_user_permissions_user_id_permission_id_43338c45_uniq"
ON "users_user_user_permissions" (
  "user_id" ASC,
  "permission_id" ASC
);

PRAGMA foreign_keys = true;
