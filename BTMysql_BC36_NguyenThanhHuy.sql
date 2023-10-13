/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amout` int DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `arr_sub_id` varchar(50) DEFAULT NULL,
  KEY `food_id` (`food_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amout` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(50) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pasta', 'pasta.jpg', 10.99, 'Delicious pasta dish', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Salad', 'salad.jpg', 5.99, 'Fresh salad', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Cheesecake', 'cheesecake.jpg', 7.99, 'Creamy cheesecake', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Pasta', 'pasta.jpg', 10.99, 'Delicious pasta dish', 1),
(5, 'Salad', 'salad.jpg', 5.99, 'Fresh salad', 2),
(6, 'Cheesecake', 'cheesecake.jpg', 7.99, 'Creamy cheesecake', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Main Course');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Appetizer');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Dessert');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Main Course'),
(5, 'Appetizer'),
(6, 'Dessert');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-10-14 12:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2023-10-14 13:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 1, '2023-10-14 14:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-10-14 14:30:00'),
(1, 1, '2023-10-14 14:30:00'),
(1, 1, '2023-10-14 12:30:00'),
(2, 2, '2023-10-14 13:30:00'),
(3, 1, '2023-10-14 14:30:00'),
(1, 1, '2023-10-14 14:30:00'),
(1, 1, '2023-10-14 14:30:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amout`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2');
INSERT INTO `orders` (`user_id`, `food_id`, `amout`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, 'ORDER456', '3');
INSERT INTO `orders` (`user_id`, `food_id`, `amout`, `code`, `arr_sub_id`) VALUES
(1, 3, 3, 'ORDER789', '1,2,3');
INSERT INTO `orders` (`user_id`, `food_id`, `amout`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORDER123', '1,2'),
(2, 2, 1, 'ORDER456', '3'),
(1, 3, 3, 'ORDER789', '1,2,3');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amout`, `date_rate`) VALUES
(1, 1, 5, '2023-10-14 12:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amout`, `date_rate`) VALUES
(2, 1, 4, '2023-10-14 13:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amout`, `date_rate`) VALUES
(3, 2, 5, '2023-10-14 14:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amout`, `date_rate`) VALUES
(1, 1, 5, '2023-10-14 12:00:00'),
(2, 1, 4, '2023-10-14 13:00:00'),
(3, 2, 5, '2023-10-14 14:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant A', 'restaurantA.jpg', 'A great place to dine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Restaurant B', 'restaurantB.jpg', 'Amazing food and service');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Restaurant A', 'restaurantA.jpg', 'A great place to dine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Restaurant B', 'restaurantB.jpg', 'Amazing food and service');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Alfredo Sauce', 2.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Caesar Dressing', 1.99, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Chocolate Drizzle', 1.49, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Alfredo Sauce', 2.99, 1),
(5, 'Caesar Dressing', 1.99, 2),
(6, 'Chocolate Drizzle', 1.49, 3);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyen Van A', 'nguyenvana@example.com', 'password123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Tran Thi B', 'tranthib@example.com', 'securepass');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Le Van C', 'levanc@example.com', 'strongpassword');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Tran Van D', 'tranvand@example.com', 'strongpassword');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Tìm 5 người like nhà hàng nhiều nhất

SELECT l.user_id, u.full_name, COUNT(*) AS like_count
FROM like_res l
JOIN user u ON l.user_id = u.user_id
GROUP BY l.user_id, u.full_name
ORDER BY like_count DESC
LIMIT 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất:

SELECT l.res_id, r.res_name, COUNT(*) AS like_count
FROM like_res l
JOIN restaurant r ON l.res_id = r.res_id
GROUP BY l.res_id, r.res_name
ORDER BY like_count DESC
LIMIT 2;


-- Tìm người đã đặt hàng nhiều nhất:

SELECT o.user_id, u.full_name, COUNT(*) AS order_count
FROM user u
JOIN orders o ON u.user_id = o.user_id
GROUP BY o.user_id, u.full_name
ORDER BY order_count DESC
LIMIT 1;


-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng):

SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN orders o ON u.user_id = o.user_id
LEFT JOIN like_res l ON u.user_id = l.user_id
LEFT JOIN rate_res r ON u.user_id = r.user_id
WHERE o.user_id IS NULL AND l.user_id IS NULL AND r.user_id IS NULL;
