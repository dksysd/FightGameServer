-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: fight_game
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20250214043432_FixNullMatchRecordError','9.0.1'),('20250216234447_commandStringToJson','9.0.1'),('20250217014743_commandStringToJson2','9.0.1'),('20250217032442_userAddRole','9.0.1'),('20250513025541_AddDescriptionCharacter','9.0.1'),('20250513025742_AddDescriptionCharacter2','9.0.1');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `health` int NOT NULL DEFAULT '0',
  `strength` int NOT NULL DEFAULT '0',
  `dexterity` int NOT NULL DEFAULT '0',
  `intelligence` int NOT NULL DEFAULT '0',
  `move_speed` float NOT NULL DEFAULT '0',
  `attack_speed` float NOT NULL DEFAULT '0',
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_character_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,'c1',0,0,0,0,0,0,''),(2,'Naktis',100,10,10,20,20,15,'인간이 인체 실험으로 탄생시킨 최초의 하피로, 독수리의 강한 능력을 지닌다. 인간과 외계인을 모두 증오하지만, 하피의 개체 수가 적어 생존을 위해 완전한 적대는 피한다. 같은 하피들에게만 호의적이며, 기본적으로 고립된 삶을 산다.'),(3,'Kagetsu',200,20,20,15,15,10,'닌자 가문의 천재 후예로, 평범한 삶을 살다가 외계인이 침략을 하여 저항을 결심했다. 닌자의 수가 적어 조용히 반격을 준비한다. 외계인을 섬멸하기 위해 하피와 접촉했으나, 인간을 증오하는 나크티스에게 거절당했다.'),(4,'Vargon',300,15,15,10,10,5,'외계 군대의 간부로, 지구 침략이 진행되자 인간을 노예로 삼고 자원을 약탈하려 한다. 인간을 하찮게 여기지만 군인으로서 철저하며, 강한 하피는 부하로 삼을 가치가 있다고 본다. 반면, 닌자는 인간들의 폭동을 부추길 위험이 있어 제거하려 한다.');
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_command`
--

DROP TABLE IF EXISTS `custom_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_command` (
  `id` int NOT NULL AUTO_INCREMENT,
  `command` json NOT NULL,
  `player_id` int NOT NULL,
  `character_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_custom_command_character_id` (`character_id`),
  KEY `IX_custom_command_player_id_character_id_skill_id` (`player_id`,`character_id`,`skill_id`),
  KEY `IX_custom_command_skill_id` (`skill_id`),
  CONSTRAINT `FK_custom_command_character_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_custom_command_player_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_custom_command_skill_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_command`
--

LOCK TABLES `custom_command` WRITE;
/*!40000 ALTER TABLE `custom_command` DISABLE KEYS */;
INSERT INTO `custom_command` VALUES (3,'[\"string\"]',1,1,1),(18,'[\"string\"]',4,2,5),(19,'[\"string\"]',4,2,6),(391,'[\"UPARROW\", \"RIGHTARROW\", \"Z\"]',6,2,1),(392,'[\"DOWNARROW\", \"UPARROW\", \"Z\"]',6,2,2),(393,'[\"LEFTARROW\", \"RIGHTARROW\", \"Z\"]',6,2,5),(394,'[\"UPARROW\", \"UPARROW\", \"Z\"]',6,2,6),(395,'[\"RIGHTARROW\", \"RIGHTARROW\", \"Z\"]',6,3,11),(396,'[\"DOWNARROW\", \"RIGHTARROW\", \"Z\"]',6,3,12),(397,'[\"UPARROW\", \"UPARROW\", \"Z\"]',6,3,13),(398,'[\"LEFTARROW\", \"Z\"]',6,3,14),(399,'[\"DownArrow\", \"DownArrow\", \"Z\"]',6,4,7),(400,'[\"RightArrow\", \"RightArrow\", \"Z\"]',6,4,8),(401,'[\"DownArrow\", \"RightArrow\", \"Z\"]',6,4,9),(402,'[\"LeftArrow\", \"RightArrow\", \"Z\"]',6,4,10),(415,'[\"UPARROW\", \"Z\"]',8,2,1),(416,'[\"LEFTARROW\", \"RIGHTARROW\", \"Z\"]',8,2,2),(417,'[\"RIGHTARROW\", \"RIGHTARROW\", \"Z\"]',8,2,5),(418,'[\"DOWNARROW\", \"DOWNARROW\", \"Z\"]',8,2,6),(419,'[\"LeftArrow\", \"Z\"]',8,3,11),(420,'[\"RightArrow\", \"Z\"]',8,3,12),(421,'[\"RightArrow\", \"X\"]',8,3,13),(422,'[\"UpArrow\", \"RightArrow\", \"X\"]',8,3,14),(423,'[\"DownArrow\", \"DownArrow\", \"Z\"]',8,4,7),(424,'[\"RightArrow\", \"RightArrow\", \"Z\"]',8,4,8),(425,'[\"DownArrow\", \"RightArrow\", \"Z\"]',8,4,9),(426,'[\"LeftArrow\", \"RightArrow\", \"Z\"]',8,4,10),(439,'[\"UPARROW\", \"Z\"]',13,2,1),(440,'[\"LEFTARROW\", \"RIGHTARROW\", \"Z\"]',13,2,2),(441,'[\"DOWNARROW\", \"RIGHTARROW\", \"Z\"]',13,2,5),(442,'[\"DOWNARROW\", \"DOWNARROW\", \"Z\"]',13,2,6),(443,'[\"LeftArrow\", \"Z\"]',13,3,11),(444,'[\"RightArrow\", \"Z\"]',13,3,12),(445,'[\"RightArrow\", \"X\"]',13,3,13),(446,'[\"UpArrow\", \"RightArrow\", \"X\"]',13,3,14),(447,'[\"DownArrow\", \"DownArrow\", \"Z\"]',13,4,7),(448,'[\"RightArrow\", \"RightArrow\", \"Z\"]',13,4,8),(449,'[\"DownArrow\", \"RightArrow\", \"Z\"]',13,4,9),(450,'[\"LeftArrow\", \"RightArrow\", \"Z\"]',13,4,10);
/*!40000 ALTER TABLE `custom_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_record`
--

DROP TABLE IF EXISTS `match_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `started_at` timestamp NOT NULL,
  `ended_at` timestamp NOT NULL,
  `winner_player_id` int DEFAULT NULL,
  `winner_player_character_id` int DEFAULT NULL,
  `loser_player_id` int DEFAULT NULL,
  `loser_player_character_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_match_record_loser_player_character_id` (`loser_player_character_id`),
  KEY `IX_match_record_loser_player_id` (`loser_player_id`),
  KEY `IX_match_record_winner_player_character_id` (`winner_player_character_id`),
  KEY `IX_match_record_winner_player_id` (`winner_player_id`),
  CONSTRAINT `FK_match_record_character_loser_player_character_id` FOREIGN KEY (`loser_player_character_id`) REFERENCES `character` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_match_record_character_winner_player_character_id` FOREIGN KEY (`winner_player_character_id`) REFERENCES `character` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_match_record_player_loser_player_id` FOREIGN KEY (`loser_player_id`) REFERENCES `player` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_match_record_player_winner_player_id` FOREIGN KEY (`winner_player_id`) REFERENCES `player` (`id`) ON DELETE SET NULL,
  CONSTRAINT `CK_MatchRecord_EndedAtGreaterThanStartedAt` CHECK ((`ended_at` > `started_at`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_record`
--

LOCK TABLES `match_record` WRITE;
/*!40000 ALTER TABLE `match_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `experience_point` int NOT NULL DEFAULT '0',
  `match_count` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_player_name` (`name`),
  UNIQUE KEY `IX_player_user_id` (`user_id`),
  CONSTRAINT `FK_player_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'string',0,0,1),(4,'string2',0,0,2),(6,'rlarn',0,0,13),(7,'newOne',0,0,15),(8,'tempp',0,0,18),(9,'string1',0,0,21),(10,'dfdfdfdfdf',0,0,22),(11,'dfdfdfdfdfdfdf',0,0,23),(12,'dddddddddd',0,0,24),(13,'hihihi',0,0,25);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_passive` tinyint(1) NOT NULL DEFAULT '0',
  `cool_time` int NOT NULL,
  `range` int NOT NULL DEFAULT '0',
  `health_coefficient` float NOT NULL DEFAULT '0',
  `strength_coefficient` float NOT NULL DEFAULT '0',
  `dexterity_coefficient` float NOT NULL DEFAULT '0',
  `intelligence_coefficient` float NOT NULL DEFAULT '0',
  `move_speed_coefficient` float NOT NULL DEFAULT '0',
  `attack_speed_coefficient` float NOT NULL DEFAULT '0',
  `default_command` json NOT NULL,
  `character_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_skill_name` (`name`),
  KEY `IX_skill_character_id` (`character_id`),
  CONSTRAINT `FK_skill_character_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'바람강타','날개로 바람을 만들어 공격하는 원거리형 스킬이다. 땅에서는 직선, 비행 중엔 대각선으로 공격한다. 상대가 에어본 상태일 시 치명타가 적용된다.',0,0,0,0,0,0,0,0,0,'[\"RightArrow\", \"RightArrow\", \"Z\"]',2),(2,'할퀴기','손톱으로 2회 할퀸다. 비행 중엔 사용할 수 없다.',0,0,0,0,0,0,0,0,0,'[\"DownArrow\", \"Z\"]',2),(5,'어퍼윙','날개를 사용한 어퍼컷이다.',0,10,0,0,0,0,0,0,0,'[\"UpArrow\", \"RightArrow\", \"Z\"]',2),(6,'비행','스킬 사용 시 비행상태가 된다. 비행 상태에서 방향키(→, ←, ↓, ↑)로 자유롭게 이동 가능하다. 일정 높이 이상에서 재사용 시 하강 공격으로 상대를 에어본 상태로 만들고, 데미지를 준다. 피격 시 즉시 추락한다.',0,15,0,0,0,0,0,0,0,'[\"UpArrow\", \"Z\"]',2),(7,'내려찍기','손이 커져 바닥 앞쪽을 내려찍는다. 상대를 띄우며 데미지를 준다.',0,10,0,0,0,0,0,0,0,'[\"DownArrow\", \"DownArrow\", \"Z\"]',4),(8,'돌진','가드 중일 때는 가드가 해제되며 데미지를 받지 않는다. 공격이 적중하면 상대는 뒤로 날아가며, 시전 시간이 길지만 높은 데미지를 준다.',0,10,0,0,0,0,0,0,0,'[\"RightArrow\", \"RightArrow\", \"Z\"]',4),(9,'웅크리기','몸을 웅크려 등의 가시로 범위 공격을 한다.',0,5,0,0,0,0,0,0,0,'[\"DownArrow\", \"RightArrow\", \"Z\"]',4),(10,'당기기','손이 커져 앞의 상대를 내 앞으로 데려온다.',0,5,0,0,0,0,0,0,0,'[\"LeftArrow\", \"RightArrow\", \"Z\"]',4),(11,'잡기','가드 불가 기술로, 가까운 적을 잡아 반대 방향으로 넘어뜨리며 에어본 상태로 만든다.',0,0,0,0,0,0,0,0,0,'[\"LeftArrow\", \"Z\"]',3),(12,'3단 베기','빠르게 3연속으로 적을 벤다. 3타는 에어본 공격이다.',0,0,0,0,0,0,0,0,0,'[\"RightArrow\", \"Z\"]',3),(13,'쿠나이','상대 거리에 따라 공격 방식이 달라진다. 멀리 있으면 쿠나이 2개를 던지고, 가까이 있으면 쿠나이로 베기 공격을 한다.',0,0,0,0,0,0,0,0,0,'[\"RightArrow\", \"X\"]',3),(14,'베기','표창 3개를 위로 던진 후 검으로 베며 공격한다. 동시에 표창이 떨어져 추가 피해를 주며, 데미지가 강하다.',0,0,0,0,0,0,0,0,0,'[\"UpArrow\", \"RightArrow\", \"X\"]',3);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IX_user_login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'string','4aAUqVmch22yhYOu4Dh/mY+48SA8oT5rRuOAIkEikQtiPHSAcXuKZtx261XOGPtV9cxUlgVWBqGS3F8EeYB2JZpqY86MWRm15XNuqwBAQx+eqRHXbr4r+kgEsQjmrjZb8jWrXEAsX4/WjFJwEvX2A9y+Y2UliUQdyVFFkPbl1mE=','WGGgewIzxOZrE61pmCimMVc9557C12ECz5j0cDPiTMdoOb8p1UQWcKJqkRwlRPvXV/I8hdsWynpPvGMlE0Wcmg==',0),(2,'string2','NFa5J+gBa1jVPRf0OOMSNc6im4x+h8fobpz95e8ty6TLKG38yMlr7YW8rWj2AAGjszSqEovZ5n2pkGemNX5ayvIhkOs57JJlMgEvkankLIedDyJADidQBXOBgfMSiM6QJJasCDk/bs1e8TJkDuO0luva/P8mWz9DtDn/hYlxg6A=','lrfxbDbdGvnFua8/rVNfQxLCQ/KFMvrILPojT89hFx5fuDaL6E97a5PXdRvICqhRbzUYNZQOZV5cBAKi5Ro6JA==',1),(13,'rlarn123','ScsV6/6Xuim0Qa/lnBeoKBx/Qn6HXJ4k5nt8TVwQ+j4P6VBzvGYAguntHz9BICZHwI/G1ac2DqL6cuagFe5e7o0mam5sgkcLnkGo5NzWiTJamPvB6dnq7aqTOudCp6qMNDmDOPWI8n+eefLz8MIDMLB8cn256RBLQrdVuuNjfCY=','YBn7myH90+p8jXenp2wc8Y3S2e4DbgaZNHvempbz5/+Dl9Ei5gUbqJ5RLvhMvWYJSQgvbRYGyfQljNeFNjYs7Q==',1),(14,'asdf123','HZdVcua02fuXbYqFKCLr9wFtdXPqOhWlrx6V/zpLR1uqhcsYonVLzqI7nr9IVBvrH+uM8JjtHFywlMAx2pqKzJ/M2BosJ2syYxNSe864WZeKZ3iR4SEixGuSa2AUxRGM9ZbxIdS13zR9Uf9BuauDbSlFAv1KkWzgHiTNgVf5CxM=','zGLYdmILBsQE7/3Yvvjl5uzeCqwGo79QtQAQ0ta6Vz2gV11z55AVQZHAD7v26Hxtiu3B5lcPm8D/qJ0HvsaguA==',1),(15,'asdf1234','EZVy4AqUXu+y0XOvVrimeyoGu4d95FVaDxAIZBP18TyHVZsvjfFOVmYHlZJqbD+yXjZmKMbWUgubeLiIAY4zFcMM9Rfa0lQbKndqENlxxsyCK/xRmNBye9pQ23ViyIKiw7/io1vNDnXUex9HWtXU1ZXyPF10O4JGngZwOO7QOcs=','S7MS853fPyl2brj572xAkwzJ3DBEvJzShrqu47tyilDJ9isuEWrJbWvvHH3zDrZK8VKxVZBI0usaUclZZ1uDCg==',1),(16,'test1','9iBvmkSYukHmQhUUDy3kMw65zPht+7RlOZ9tlUzqcQoJymU3B15kyHpSw6y5GDSXYiqabnqy/iMzZREIsRRJ/zw1BNyPVZCJ7Nj0UkOKAIwmwP/dcvM4m3seDlNZpnlzOnZ1effm1l9J7qkui2ajaoB8P6N1Pr/9dBZgndPfPg4=','PJLtvqZ2GBE3kBUWrCDrjm3H8ynxCvuAybz90NnXyDp1TvKkNLDfJvnJfK/78ZdTo22XyUMZWCN/RTOdzJZYMg==',1),(17,'ghldnjsrkdl','i5KT9eyCC/erH/2eLg7hiE7O5m6g8D5EJIdGuREIy46FRuiO1k0jJjRFtDX3bJGf+QpjVGpMKVmamuEjNvG3ZARLlq+8DjHdSg0eyvm/ZlzkzY7792RVkjR1pS30amy/z4V72Hwaam7j3f64zRI0hUGrw85JKMwAtSFysdKyKAc=','2B0TvllXTrlpv6CvKPSb+3gc4L/n8LgQEEPkLHaMufspAeHKipcXP3hhcJ1nDRnXx6TOKjida9Mu4CzcknK6ng==',1),(18,'rlarn1234','RAVckYkLJBpH/Ezn9MrgUZ49ww01Xv4eEN1Uvymek30Zsz/n+ULtN7v/QaRlO4AlY5gonRzApTSUKBkRivZz+XzErSf4oILdFjg5pEZrNK4z4E7z8ymslCgmRJaXRYv/ClFUefFpW5bTzMHijzZoZD154j383ZdhLdtBF0hxyTY=','cR8OjisPhVGsrL+oaO06zlBwJu9JHwj2EJoWflMVw3Hzb21tfPrix8YCGguHty4il12AinpWCRoL9sp+KJPuSw==',1),(19,'newIdId','KHHFIKdOISZrzbHU8Kt8IpYeICKSU+FSmf7nRbnvPrHD6xIpawOIfiMyOxaC4UgsDFg49sIo7ICgAxWwfKxVtERY046UuCNi3PyMUrZlVU5LeE0FV3sGYINLynrRmYl+S8koLIn9TgOrsvQevJFZNAl8hGyccKK18ucmx/h+rjo=','sVP2znIkPs1j/yYj0FkTD/HrDDAdUwDpQ0IKWGyHzrdn69hm5ctLNtCiwpItFbJRacyIKCTQRkXhhIobTne4DQ==',1),(20,'ij8337','AkWj3kFAUJIHLsxvzcABzHlVGfxBlKRm0m4kpdiFMM9JRrtNsg8PsDGmSAQOgzAESPysu08N+T3ghmwgkOhkSZ9TQTbAv3TMMOJ0nBKUGaQAsMS4omarElSjBgwkpxEfaioBTpPAEAEEYsWRjROF7551JDvFZcWTMEDRNZF7huc=','awgSysXjkCdJE2FSpXTCMPelXSena60Yz499BfAbuj/th1GqapliktVUI99VgEyb+AEwmUYT9p7fGwZEWs1vVA==',1),(21,'string1','96sawUwiv6/QozuZMDrzPOJrabCUa2adqEa33CjWItWjxuoCTycBT1IJnEB8nn+bmxaVsGf9CRbTFjkht9Cxagyp/6nGmJOc+yVkeRIL2eH+8jAPQ63AetRiR84+d8M43vxMBW4Au9CqFCPX/qyn1tXfZxSLeOEdwmrI6Ujx03E=','2HzbqFn7Cd54PLJxpqsSQMrHy7lYfz6oSMwea9tH1uz4Ji+JUYNNdOGjeNG6xpck74vfug3RI1ckpTZGxKx4pQ==',1),(22,'afbasdgsasdhn','KTOfkfHB/vpZrOqb6qZJfrxpGEr/OebZ+tboJ1w7G7YRhSaDBoYE10P4oV2qLGwphmpoIEV35X8lNpplWmaM9IR4u5l4W6kSQHrL0qhJcybjF7gOgwXTB2b+LPnA/HfRacUEVDq7ef0vTZ3JynG6wx6iqIzgxJrVzPDgMTEqtH8=','BaWP0k37ml9sOC4CTRJQugZvk1dbdZC38NmCcX+F7o+a0rd37YF/WfUVSZB4ue3q01BfUU0ikSgjibC9hgEgHg==',1),(23,'addfdgsdgsf','uL7A1/rj0bulEEyHM2A2ouersl14UaZqga/yEEE0qg4/TiRq4nDWGZn4TwRORrHfYlHekTPcPHkmrfJAiuO2h9LksYckRsTqf8pZAtG0v+MtIAZbvn+JZoLWvmbpHWrMd4iFZiN6jMy/AmYx/ZRWc8d6xw25PLT7L7INU/8ehJU=','zT09dgvxtRK/PjFCQ2gjHO63VLXElkSTMYtJYqngbY1rK6aA3b9ix7a5LuAJO3nOc2VO88wrU4h7lWUp+QXklg==',1),(24,'dkfhdfkdjbdkfjdfk','C6mVyx9QeauVKar6szIFfMzmHZ7Q4urcJA5dBgpFZidHzY3ao6nTSXOoiuAFLGVr3SyBTx4cK0NajEI7FbTHo6Npb4Y4vNiQ4v6mKqygDnLytTbkz9pQLLsIcF2p6PVen3fdFIdgmoDVV8LjyCV+cMc/HjiAWLhoAE4jxrk4+0o=','Gf2n5+Un5D3tgtrdaJW7GoMNkfp+ljIYJvjLI4qxQQ+uZ4OzSwDGXFQTA5CxBX2IN3Fs0aWOJaaMje20ywjCJg==',1),(25,'dkssudgktpdy','igy+5fKlrzQGZnYW7CCd0lfVlI42b600B1j2ZnIfj231LOQbDfNmJgCuTQlWL55MULMfWF6d86189503l1Jnk0BsrfDrpgWSt2oSX66F/KiMpwMuyik4y6chnZ13dC7luHKph5DZr8JT1+ohbOx82ouI0ErUAZJGNC5nyo1Vfhk=','47KqDt67VF33ty8DQIn9zq2j/DRFRRnOZpdRaFSqkV6AxnO+00ZuotRfO87EUXhZO5ZUX9hefmn38a9GkX+euQ==',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11  2:47:12
