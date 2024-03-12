/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS opt_ion;
CREATE TABLE `opt_ion` (
  `q_id` int(11) DEFAULT NULL,
  `option_text` varchar(20) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS question;
CREATE TABLE `question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS relation;
CREATE TABLE `relation` (
  `q_id` int(11) DEFAULT NULL,
  `opt_id` int(11) DEFAULT NULL,
  `next_ques` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP TABLE IF EXISTS response;
CREATE TABLE `response` (
  `user_id` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `cloth` varchar(10) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO opt_ion(q_id,option_text,opt_id) VALUES('1','\'Male\'','1'),('1','\'Female\'','2'),('2','\'Winter Wear\'','1'),('2','\'Summer Wear\'','2'),('3','\'T-shirt\'','1'),('3','\'cap\'','2'),('3','\'Shirt\'','3'),('3','\'Jeans\'','4'),('4','\'Black\'','1'),('4','\'White\'','2'),('4','\'Blue\'','3'),('4','\'Brown\'','4'),('5','\'Jacket\'','1'),('5','\'Long coat\'','2'),('5','\'Hoodies\'','3'),('5','\'Woolen cap\'','4'),('6','\'S\'','1'),('6','\'M\'','2'),('6','\'L\'','3'),('6','\'XL\'','4');

INSERT INTO question(q_id,q_text) VALUES('1','\'What is Your Gender?\''),('2','\'What you want to wear?\''),('3','\'What you want to  buy?\''),('4','\'Which color?\''),('5','\'What To want?\''),('6','\'Select Size\'');

INSERT INTO relation(q_id,opt_id,next_ques) VALUES('1','1','2'),('1','2','2'),('2','2','3'),('2','1','5'),('3','1','4'),('5','1','4'),('5','2','4'),('5','3','4'),('5','4','4'),('4','1','6'),('4','2','6'),('4','3','6'),('4','4','6'),('3','2','4'),('3','3','4'),('3','4','4');
INSERT INTO response(user_id,gender,category,cloth,color,size) VALUES('\'1710262539691\'','\'Male\'','\'Summer Wear\'','\'T-shirt\'','\'Blue\'','\'M\'');