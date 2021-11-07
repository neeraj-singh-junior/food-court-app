-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2021 at 11:21 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `sno` int(11) NOT NULL,
  `prname` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`sno`, `prname`, `qty`, `price`, `pic`) VALUES
(39, 'Gulab Jamun', 1, 80, 'media/rasgola.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(10) NOT NULL,
  `catname` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `catname`) VALUES
(1, 'Breakfast'),
(2, 'Chineese'),
(3, 'Non-Vegetarian'),
(4, 'Traditional'),
(5, 'Fast Food'),
(6, 'Sweets'),
(7, 'Beverages'),
(8, 'Ice-Creams'),
(9, 'Cakes'),
(10, 'Soups'),
(11, 'Italian'),
(12, 'Salads');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `uname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pno` int(10) NOT NULL,
  `message` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`uname`, `email`, `pno`, `message`) VALUES
('', '', 0, ''),
('ioiipip', 'abc@gmail.com', 323432432, 'errwr');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `uname` varchar(30) NOT NULL,
  `cid` int(20) NOT NULL,
  `phno` int(10) NOT NULL,
  `pincode` int(10) NOT NULL,
  `email` varchar(300) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `addr` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`uname`, `cid`, `phno`, `pincode`, `email`, `pwd`, `addr`) VALUES
('jyoti', 11, 2147483647, 110094, '0', '12', '0'),
('saisha', 12, 952368415, 110034, '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('as6di8g6popkreg21e4di922tl49m24g', 'ODRmZWQ4YWU4MjAyMTEwMTEyODczNzI1YTgzNjYxZjMyMjdmNjZjNTp7fQ==', '2021-07-02 11:20:12.405554'),
('jzuk9dddle64zikevxnj3l8m1if2rzl8', 'ODRmZWQ4YWU4MjAyMTEwMTEyODczNzI1YTgzNjYxZjMyMjdmNjZjNTp7fQ==', '2021-06-12 10:34:01.380502'),
('q8ouib4kjvtljme22r2q2kctcukc3fzw', 'ODRmZWQ4YWU4MjAyMTEwMTEyODczNzI1YTgzNjYxZjMyMjdmNjZjNTp7fQ==', '2021-06-19 10:54:14.633300');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `eemail` varchar(10) NOT NULL,
  `econtact` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `pwd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uname`, `pwd`) VALUES
(1, 'pooja', '1234'),
(2, 'mohan', '4567'),
(3, 'william', '89090'),
(9, 'komal', '5678');

-- --------------------------------------------------------

--
-- Table structure for table `ordertbl`
--

CREATE TABLE `ordertbl` (
  `ordid` int(20) NOT NULL,
  `custid` int(20) NOT NULL,
  `billamt` int(11) NOT NULL,
  `addr` varchar(300) NOT NULL,
  `phno` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `ord_date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertbl`
--

INSERT INTO `ordertbl` (`ordid`, `custid`, `billamt`, `addr`, `phno`, `pincode`, `ord_date`) VALUES
(1, 12, 330, 'rtyty', 123456, 65466, ''),
(2, 12, 330, 'rtyty', 123456, 65466, ''),
(11, 12, 280, 'rtyty', 565656, 343, '2021-06-18'),
(12, 12, 280, 'delhi', 12323434, 110089, '2021-06-18'),
(13, 12, 150, 'rtyty', 123456, 65466, '2021-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prid` int(20) NOT NULL,
  `prname` varchar(30) NOT NULL,
  `descp` varchar(100) NOT NULL,
  `pic` varchar(60) NOT NULL,
  `qty` int(25) NOT NULL,
  `price` int(50) NOT NULL,
  `catid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prid`, `prname`, `descp`, `pic`, `qty`, `price`, `catid`) VALUES
(1, 'French Toast', 'French toast is a dish made up of bread soaked in eggs and milk,then fried.', 'media/french_toast_aU0jzFz.jpeg', 1, 30, 1),
(2, 'Pea & Potato Sandwich', 'A sandwich which is stuffed with potatoes and peas.', 'media/pea-and-potato-sandwich-recipe.jpg', 1, 35, 1),
(3, 'Chowmein', 'Chowmein is a chineese dish that consist of fried noodles,cooked meat,and vegetables.', 'media/Chowmein.jpg', 1, 50, 2),
(4, 'Dumplings', 'Dumplings are small lumps of dough that are cooked and eaten with meat and vegetables.', 'media/dumplings.jpg', 1, 40, 2),
(5, 'Butter Chicken', 'Butter Chicken is a dish originated in India,of chicken in a mildly spiced tomato sauce. ', 'media/butter_chicken.jpg', 1, 250, 3),
(6, 'Fish Curry', 'Fish curry is prepared using fish fillets,salt,turmeric powder,tomatoes,yogurt,mustard etc.', 'media/fish_curry.jpg', 1, 150, 3),
(7, 'Shahi Paneer With Naan', 'Shahi panner is a delicious creamy gravy made with panner and it taste delicious to have it with naa', 'media/shahi_panner_with_naan.jpg', 1, 160, 4),
(8, 'Fried Rice', 'Fried rice is a dish which contains ingredients such as eggs,vegetables,sea food.', 'media/fried_rice.jpg', 1, 50, 4),
(9, 'Burger', 'Burger is a sandwich consisting of one or more cooked. patties usually placed inside a sliced bread ', 'media/burger_BC0nqDg.jpg', 1, 70, 5),
(10, 'Chilli Potato', 'Chilli Potato consist of fried potato fingers which are tossed in a sesame honey chilli sauce.', 'media/chilli_patatoo.jpg', 1, 40, 5),
(11, 'Gulab Jamun', 'Gulab Jamun are deep fried balls of milk powder, flour, Butter and cream or milk and then soaked in ', 'media/rasgola.jpg', 1, 80, 6),
(12, 'Rasmalai', 'Rasmalai consist of paneer balls immersed in chilled creamy milk.', 'media/RasMalai_with_dry_fruits.jpg', 2, 100, 6),
(13, 'Cola', 'Cola is a sweetened soft drink flavored with vanilla, citrus oils and other flavourings.', 'media/special_cola.jpg', 3, 20, 7),
(14, 'Coffee', 'Coffee is brewed drink prepared from roasted coffee beans.', 'media/special_coffee.jpg', 1, 50, 7),
(15, 'Mint IceCream', 'Mint icecream is an icecream flavour composed of icecream with small mint chocolate chips.', 'media/mint.jpg', 2, 55, 8),
(16, 'Chocolate Icecream', 'Chocolate icecream is  generally made up by blending cocoa powder along with eggs, creams, vanilla e', 'media/chocolate.jpg', 1, 60, 8),
(17, 'Cheery Cake', 'Cheery cake consist of glace cheeries evenly suspended within the madeira sponge.', 'media/18.jpg', 2, 300, 9),
(18, 'Vanilla Cake', 'Vanilla cake is a white cake uses egg whites ,cream, eggs etc.', 'media/vanilla.jpg', 1, 350, 9),
(19, 'Chicken Soup', 'Chicken soup is a soup made from chicken, simmered in water usually with various other ingredients.', 'media/chicken-soup.jpg', 1, 120, 10),
(20, 'Coconut Soup', 'Coconut soup is a fruit soup prepared using coconut milk and coconut fruit as a main ingredients.', 'media/coconut_soup.jpg', 1, 85, 10),
(21, 'Risotto', 'Risotto is a rice dish cooked with broth untill it reaches a creamy consistency.', 'media/risotto.jpg', 2, 310, 11),
(22, 'Truffle', 'A truffle is the fruiting body of a subterranean ascomycete fungus, predominantly one of the many sp', 'media/truffles.jpg', 1, 150, 11),
(23, 'Broccoli Salad', 'Broccoli slaw is a salad that is a variation of traditional coleslaw, prepared using shredded raw br', 'media/brochali_salad.png', 1, 100, 12),
(24, 'Kachumber Salad', 'Kachumber, or cachumber, is a salad dish in Indian cuisine consisting of fresh chopped tomatoes, cuc', 'media/Kachumber-Salad.jpg', 1, 200, 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertbl`
--
ALTER TABLE `ordertbl`
  ADD PRIMARY KEY (`ordid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `ordertbl`
--
ALTER TABLE `ordertbl`
  MODIFY `ordid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
