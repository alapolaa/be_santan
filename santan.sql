-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 11, 2025 at 11:50 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `santan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `email`, `password`) VALUES
(1, 'Zainullah', 'admin@gmail.com', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `data_cuaca`
--

CREATE TABLE `data_cuaca` (
  `id_cuaca` int(11) NOT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `suhu` float DEFAULT NULL,
  `kelembapan` float DEFAULT NULL,
  `curah_hujan` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_cuaca`
--

INSERT INTO `data_cuaca` (`id_cuaca`, `id_wilayah`, `tanggal`, `suhu`, `kelembapan`, `curah_hujan`) VALUES
(1, 1, '2023-03-01', 25, 51, 152),
(2, 1, '2023-03-02', 26, 68, 175),
(3, 1, '2023-03-03', 26, 68, 112),
(4, 1, '2023-03-04', 27, 58, 185),
(5, 1, '2023-03-05', 26, 63, 98),
(6, 1, '2023-03-06', 26, 68, 118),
(7, 1, '2023-03-07', 25, 67, 119),
(8, 1, '2023-03-08', 25, 57, 144),
(9, 1, '2023-03-09', 27, 74, 154),
(10, 1, '2023-03-10', 26, 65, 107),
(11, 1, '2023-03-11', 26, 53, 181),
(12, 1, '2023-03-12', 25, 56, 158),
(13, 1, '2023-03-13', 25, 63, 172),
(14, 1, '2023-03-14', 27, 67, 185),
(15, 1, '2023-03-15', 27, 55, 120),
(16, 1, '2023-03-16', 27, 52, 121),
(17, 1, '2023-03-17', 25, 71, 142),
(18, 1, '2023-03-18', 26, 59, 75),
(19, 1, '2023-03-19', 25, 54, 128),
(20, 1, '2023-03-20', 27, 63, 111),
(21, 1, '2023-03-21', 25, 71, 179),
(22, 1, '2023-03-22', 27, 71, 159),
(23, 1, '2023-03-23', 27, 64, 80),
(24, 1, '2023-03-24', 26, 57, 198),
(25, 1, '2023-03-25', 25, 73, 73),
(26, 1, '2023-03-26', 25, 53, 132),
(27, 1, '2023-03-27', 27, 67, 172),
(28, 1, '2023-03-28', 25, 67, 164),
(29, 1, '2023-03-29', 27, 74, 180),
(30, 1, '2023-03-30', 27, 63, 222),
(31, 1, '2023-03-31', 26, 69, 84),
(32, 1, '2023-04-01', 27, 59, 84),
(33, 1, '2023-04-02', 27, 56, 117),
(34, 1, '2023-04-03', 26, 54, 157),
(35, 1, '2023-04-04', 25, 65, 122),
(36, 1, '2023-04-05', 25, 58, 124),
(37, 1, '2023-04-06', 27, 60, 174),
(38, 1, '2023-04-07', 26, 52, 190),
(39, 1, '2023-04-08', 25, 53, 205),
(40, 1, '2023-04-09', 25, 51, 102),
(41, 1, '2023-04-10', 27, 57, 97),
(42, 1, '2023-04-11', 25, 64, 185),
(43, 1, '2023-04-12', 27, 55, 207),
(44, 1, '2023-04-13', 27, 57, 74),
(45, 1, '2023-04-14', 25, 73, 88),
(46, 1, '2023-04-15', 27, 63, 116),
(47, 1, '2023-04-16', 25, 67, 223),
(48, 1, '2023-04-17', 27, 66, 63),
(49, 1, '2023-04-18', 27, 72, 82),
(50, 1, '2023-04-19', 25, 66, 204),
(51, 1, '2023-04-20', 26, 59, 196),
(52, 1, '2023-04-21', 25, 62, 92),
(53, 1, '2023-04-22', 26, 72, 218),
(54, 1, '2023-04-23', 25, 65, 89),
(55, 1, '2023-04-24', 26, 67, 79),
(56, 1, '2023-04-25', 27, 52, 73),
(57, 1, '2023-04-26', 26, 72, 86),
(58, 1, '2023-04-27', 25, 64, 191),
(59, 1, '2023-04-28', 27, 72, 122),
(60, 1, '2023-04-29', 27, 74, 77),
(61, 1, '2023-04-30', 27, 58, 126),
(62, 1, '2023-05-01', 27, 52, 146),
(63, 1, '2023-05-02', 26, 53, 72),
(64, 1, '2023-05-03', 25, 56, 91),
(65, 1, '2023-05-04', 27, 63, 113),
(66, 1, '2023-05-05', 25, 60, 70),
(67, 1, '2023-05-06', 26, 73, 77),
(68, 1, '2023-05-07', 26, 70, 68),
(69, 1, '2023-05-08', 27, 75, 162),
(70, 1, '2023-05-09', 25, 51, 192),
(71, 1, '2023-05-10', 25, 74, 150),
(72, 1, '2023-05-11', 27, 52, 197),
(73, 1, '2023-05-12', 26, 55, 224),
(74, 1, '2023-05-13', 26, 75, 94),
(75, 1, '2023-05-14', 27, 53, 162),
(76, 1, '2023-05-15', 25, 64, 129),
(77, 1, '2023-05-16', 26, 69, 119),
(78, 1, '2023-05-17', 27, 52, 91),
(79, 1, '2023-05-18', 27, 51, 160),
(80, 1, '2023-05-19', 25, 52, 107),
(81, 1, '2023-05-20', 25, 67, 152),
(82, 1, '2023-05-21', 26, 53, 106),
(83, 1, '2023-05-22', 26, 59, 121),
(84, 1, '2023-05-23', 27, 73, 130),
(85, 1, '2023-05-24', 25, 59, 78),
(86, 1, '2023-05-25', 27, 59, 91),
(87, 1, '2023-05-26', 27, 70, 180),
(88, 1, '2023-05-27', 27, 60, 141),
(89, 1, '2023-05-28', 27, 60, 182),
(90, 1, '2023-05-29', 26, 66, 80),
(91, 1, '2023-05-30', 27, 53, 155),
(92, 1, '2023-05-31', 26, 75, 213);

-- --------------------------------------------------------

--
-- Table structure for table `musim`
--

CREATE TABLE `musim` (
  `id_musim` int(11) NOT NULL,
  `nama_musim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `musim`
--

INSERT INTO `musim` (`id_musim`, `nama_musim`) VALUES
(1, 'Kemarau'),
(2, 'Penghujan');

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `id_tanaman` int(11) NOT NULL,
  `nama_tanaman` varchar(255) DEFAULT NULL,
  `deskripsi` text,
  `gambar` varchar(255) DEFAULT NULL,
  `id_musim` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tanaman`
--

INSERT INTO `tanaman` (`id_tanaman`, `nama_tanaman`, `deskripsi`, `gambar`, `id_musim`) VALUES
(4, 'Tembakau', 'Tembakau adalah tanaman pertanian yang daunnya digunakan sebagai bahan baku utama dalam produksi rokok dan cerutu. Tanaman ini tidak termasuk dalam kategori komoditas pangan, melainkan komoditas perkebunan. Produk tembakau dikonsumsi bukan untuk memenuhi kebutuhan nutrisi, tetapi sebagai bagian dari gaya hidup atau kebiasaan \"hiburan\". Selain rokok dan cerutu, tembakau juga dapat dikunyah.\r\n\r\nSejarah mencatat bahwa tembakau berasal dari benua Amerika. Ketika bangsa Eropa menjelajahi benua tersebut, mereka menemukan bahwa penduduk asli telah menggunakan tembakau selama ribuan tahun. Tembakau kemudian diperkenalkan ke Eropa pada abad ke-16 dan sejak itu, popularitasnya menyebar ke seluruh dunia. Terdapat berbagai jenis tembakau, masing-masing dengan karakteristik unik yang membedakannya, seperti Tembakau Virginia, Burley, Oriental, dan Cerutu.', 'tembakau.jpg', 1),
(5, 'Padi', 'Padi (Oryza sativa) adalah tanaman pangan yang menduduki posisi sentral dalam kehidupan masyarakat Indonesia dan sebagian besar Asia. Sebagai sumber karbohidrat utama, padi menyediakan energi yang vital bagi miliaran orang. Selain karbohidrat, padi juga mengandung protein, vitamin, dan mineral yang berkontribusi pada kesehatan dan gizi masyarakat. Padi tumbuh subur di berbagai kondisi lingkungan, mulai dari sawah yang tergenang air hingga ladang kering, menghasilkan beragam varietas dengan karakteristik unik.\r\n\r\nProses penanaman padi melibatkan beberapa tahapan, mulai dari persiapan lahan, penyemaian benih, penanaman bibit, perawatan intensif, hingga panen. Keberhasilan budidaya padi dipengaruhi oleh faktor-faktor seperti iklim, jenis tanah, ketersediaan air, serta serangan hama dan penyakit. Peningkatan produktivitas padi terus diupayakan melalui penggunaan benih unggul, teknik budidaya modern, dan pengelolaan sumber daya yang efisien, guna memenuhi kebutuhan pangan yang terus meningkat.', 'padi.jpeg', 2),
(6, 'Cabe', 'Cabai, atau lombok, adalah buah yang berasal dari tumbuhan anggota genus Capsicum. Ciri khas cabai adalah rasa pedasnya yang disebabkan oleh kandungan capsaicin.  Cabai tidak hanya digunakan sebagai bumbu dapur, tetapi juga memiliki nilai ekonomi tinggi dan diperdagangkan secara luas.  Varietas cabai sangat beragam, mulai dari cabai rawit yang kecil dan sangat pedas, hingga paprika yang besar dan manis.  Warna cabai pun bervariasi, mulai dari hijau, kuning, oranye, hingga merah, tergantung tingkat kematangan dan jenisnya.\r\n\r\nSelain memberikan rasa pedas yang khas pada masakan, cabai juga memiliki beberapa manfaat kesehatan.  Kandungan vitamin C dan antioksidan dalam cabai cukup tinggi.  Capsaicin, senyawa yang memberikan rasa pedas, juga memiliki potensi dalam mengurangi rasa sakit dan peradangan.  Meskipun demikian, konsumsi cabai yang berlebihan dapat menyebabkan masalah pencernaan.', 'cabe.jpg', 1),
(7, 'Bawang', 'Bawang adalah salah satu bahan masakan yang paling umum dan serbaguna di dunia. Umbi bawang, yang memiliki aroma dan rasa yang khas, digunakan sebagai bumbu dalam berbagai masakan untuk menambah cita rasa yang lezat. Bawang juga memiliki nilai gizi yang baik, mengandung vitamin C, kalium, dan serat. Selain digunakan dalam masakan, bawang juga memiliki sejarah panjang dalam pengobatan tradisional karena sifat antibakteri dan antioksidannya.\r\n\r\nTerdapat berbagai jenis bawang yang tersedia, masing-masing dengan karakteristik uniknya. Bawang merah adalah jenis bawang yang paling umum ditemukan dan digunakan dalam masakan sehari-hari. Bawang putih memiliki rasa yang lebih kuat dan sering digunakan dalam masakan Asia dan Mediterania. Bawang bombay, dengan ukurannya yang besar dan rasanya yang manis, sering digunakan dalam salad atau sebagai bahan utama dalam hidangan seperti sup bawang. Selain itu, ada juga jenis bawang lainnya seperti bawang daun, bawang kucai, dan bawang prei yang digunakan sebagai penambah aroma dan rasa pada masakan.', 'bawang.jpg', 1),
(8, 'Bayam', 'Bayam (Amaranthus spp.) adalah tumbuhan yang dikenal sebagai sayuran daun yang sangat populer. Bayam berasal dari wilayah tropis Amerika, namun kini telah tersebar dan dibudidayakan di seluruh dunia. Bayam memiliki daun berwarna hijau yang kaya akan nutrisi penting seperti vitamin, mineral, dan antioksidan. Selain itu, bayam juga mengandung serat yang baik untuk pencernaan. Bayam sering diolah menjadi berbagai hidangan lezat dan sehat, seperti sayur bayam, tumis bayam, atau bahkan sebagai bahan tambahan dalam sup atau salad.\r\n\r\nTerdapat berbagai jenis bayam yang dikenal, antara lain bayam cabut (Amaranthus tricolor) dan bayam duri (Amaranthus spinosus). Bayam cabut memiliki batang yang lunak dan daun yang lebar, sementara bayam duri memiliki duri pada batangnya. Bayam bukan hanya sekadar sayuran yang lezat, tetapi juga memiliki manfaat kesehatan yang signifikan. Kandungan zat besi yang tinggi dalam bayam dapat membantu mencegah anemia, sementara antioksidan dalam bayam berperan dalam melindungi tubuh dari kerusakan radikal bebas.', 'bayam.jpeg', 2),
(9, 'Terong', 'Terong (Solanum melongena L.) adalah tanaman yang menghasilkan buah yang umum dikenal dan dikonsumsi sebagai sayuran. Berasal dari India dan Sri Lanka, terong kini telah dibudidayakan di berbagai belahan dunia. Terong memiliki ciri khas buahnya yang berbentuk lonjong atau bulat, dengan kulit yang umumnya berwarna ungu, meskipun ada juga varietas yang berwarna hijau, putih, atau bahkan belang-belang. Daging buah terong memiliki tekstur lembut dan rasa yang sedikit manis.\r\n\r\nTerong tidak hanya lezat untuk disantap, tetapi juga kaya akan nutrisi. Terong mengandung serat, vitamin, dan mineral yang penting bagi kesehatan tubuh. Selain itu, terong juga mengandung antioksidan yang berperan dalam melindungi sel-sel tubuh dari kerusakan akibat radikal bebas. Terong dapat diolah menjadi berbagai macam hidangan, seperti tumis terong, terong balado, atau bahkan dipanggang.', 'terong.jpg', 2),
(10, 'Jagung', 'Jagung (Zea mays) adalah salah satu tanaman pangan yang paling penting di dunia, selain padi dan gandum. Tanaman ini menghasilkan biji yang kaya akan karbohidrat, sehingga menjadi sumber makanan pokok bagi banyak masyarakat di berbagai belahan dunia. Jagung juga memiliki nilai ekonomi yang tinggi, karena selain dikonsumsi oleh manusia, jagung juga digunakan sebagai pakan ternak dan bahan baku industri. Berbagai produk olahan jagung seperti tepung jagung, jagung manis, dan minyak jagung juga memiliki nilai komersial yang signifikan.\r\n\r\nJagung memiliki beragam varietas, mulai dari jagung manis yang cocok untuk dikonsumsi langsung, hingga jagung hibrida yang menghasilkan biji dalam jumlah besar dan tahan terhadap hama penyakit. Selain bijinya, bagian lain dari tanaman jagung juga dapat dimanfaatkan. Batang jagung dapat diolah menjadi silase untuk pakan ternak, sementara daun jagung kering dapat digunakan sebagai bahan kerajinan atau pupuk organik. Jagung adalah tanaman serbaguna yang memiliki peran penting dalam ketahanan pangan dan ekonomi masyarakat.', 'jagung.webp', 2),
(11, 'Kacang', 'Kacang-kacangan adalah kelompok tanaman polong-polongan (Fabaceae) yang menghasilkan biji yang dapat dimakan. Biji kacang-kacangan kaya akan protein, serat, vitamin, dan mineral, sehingga menjadikannya sumber nutrisi yang penting bagi manusia dan hewan. Kacang-kacangan juga berperan penting dalam pertanian karena kemampuannya mengikat nitrogen dari udara, sehingga menyuburkan tanah. Beberapa contoh kacang-kacangan yang umum dikonsumsi antara lain kacang tanah, kacang kedelai, kacang hijau, kacang merah, dan kacang almond.\r\n\r\nSelain nilai gizinya yang tinggi, kacang-kacangan juga memiliki peran penting dalam berbagai budaya di seluruh dunia. Kacang-kacangan sering diolah menjadi berbagai macam hidangan tradisional, seperti sambal kacang, gado-gado, atau bahkan dijadikan bahan dasar untuk membuat tempe dan tahu. Kacang-kacangan juga dapat diolah menjadi berbagai produk makanan modern, seperti selai kacang, susu kacang, atau tepung kacang. Dengan kandungan nutrisinya yang melimpah dan fleksibilitasnya dalam pengolahan, kacang-kacangan merupakan bagian penting dari pola makan sehat dan berkelanjutan.', 'kacang.jpg', 1),
(12, 'Kacang Panjang', 'Kacang panjang (Vigna unguiculata ssp. sesquipedalis) adalah salah satu jenis sayuran polong yang populer di Indonesia dan negara-negara Asia Tenggara lainnya. Kacang panjang memiliki ciri khas polongnya yang panjang, bahkan bisa mencapai hingga 1 meter. Selain rasanya yang lezat dan teksturnya yang renyah, kacang panjang juga kaya akan nutrisi seperti protein, vitamin, dan mineral. Kacang panjang sering diolah menjadi berbagai hidangan, seperti tumis kacang panjang, sayur asam, atau sebagai lalapan.\r\n\r\nSelain nilai gizinya yang tinggi, kacang panjang juga memiliki manfaat kesehatan yang beragam. Kandungan serat yang tinggi dalam kacang panjang membantu menjaga kesehatan pencernaan dan mencegah sembelit. Kacang panjang juga mengandung antioksidan yang berperan dalam melindungi tubuh dari kerusakan akibat radikal bebas. Selain itu, kacang panjang juga dipercaya dapat membantu mengontrol kadar gula darah dan menurunkan risiko penyakit jantung.', 'panjang.jpg', 2),
(13, 'Kangkung', 'Kangkung (Ipomoea aquatica) adalah sayuran daun yang populer dan mudah ditemukan di Asia Tenggara. Dikenal juga dengan nama water spinach atau swamp cabbage, kangkung tumbuh subur di daerah berair atau lembab. Daunnya yang hijau panjang danBatangnya yang berongga menjadikannya mudah dikenali. Kangkung tidak hanya lezat disantap, tetapi juga kaya akan nutrisi seperti vitamin, mineral, dan serat.\r\n\r\nKangkung memiliki dua jenis utama, yaitu kangkung air dan kangkung darat. Kangkung air tumbuh di air atau lumpur dan memiliki daun yang lebih lebar serta batang yang berongga. Sementara itu, kangkung darat ditanam di lahan yang lembab dan memiliki daun yang lebih sempit. Kangkung dapat diolah menjadi berbagai hidangan lezat, seperti tumis kangkung, cah kangkung, atau sebagai lalapan. Selain nikmat, kangkung juga memiliki manfaat kesehatan karena kandungan antioksidan dan seratnya yang tinggi.', 'kangkung.jpg', 2),
(14, 'Kedelai', 'Kedelai (Glycine max) adalah salah satu jenis tanaman polong-polongan yang memiliki nilai gizi tinggi dan serbaguna. Biji kedelai kaya akan protein, lemak, karbohidrat, serta berbagai vitamin dan mineral penting. Kandungan protein nabati yang tinggi membuat kedelai menjadi sumber protein alternatif yang baik, terutama bagi vegetarian dan vegan. Selain itu, kedelai juga mengandung isoflavon, senyawa yang memiliki berbagai manfaat kesehatan.\r\n\r\nKedelai dapat diolah menjadi berbagai macam produk pangan, seperti tahu, tempe, susu kedelai, kecap, dan tauco. Produk-produk olahan kedelai ini tidak hanya lezat tetapi juga memiliki nilai gizi yang tinggi. Selain digunakan sebagai bahan pangan, kedelai juga dimanfaatkan dalam industri, antara lain sebagai bahan baku pembuatan minyak kedelai, tepung kedelai, dan lesitin. Dengan kandungan nutrisinya yang melimpah dan beragamnya manfaatnya, kedelai merupakan salah satu komoditas pertanian yang penting dan memiliki nilai ekonomi yang tinggi.', 'kedelai.jpg', 2),
(15, 'Pisang', 'Pisang adalah buah yang sangat populer dan mudah ditemukan di seluruh dunia. Tanaman pisang termasuk dalam keluarga Musaceae dan tumbuh subur di daerah tropis. Buah pisang memiliki kulit berwarna kuning ketika matang, meskipun ada juga varietas yang berwarna hijau atau merah. Daging buah pisang berwarna putih atau kekuningan dengan rasa manis yang khas. Pisang tidak hanya lezat untuk dimakan langsung, tetapi juga dapat diolah menjadi berbagai macam makanan dan minuman, seperti keripik pisang, kue pisang, atau jus pisang.\r\n\r\nSelain rasanya yang enak, pisang juga kaya akan nutrisi. Pisang mengandung karbohidrat, kalium, vitamin C, dan serat. Kalium penting untuk menjaga kesehatan jantung dan mengatur tekanan darah, sedangkan serat membantu pencernaan dan memberikan rasa kenyang. Kandungan nutrisi yang tinggi membuat pisang menjadi pilihan camilan sehat dan sumber energi yang baik.', 'pisang.jpg', 1),
(16, 'Sawi', 'Sawi adalah sekelompok tumbuhan dari genus Brassica yang umum dibudidayakan sebagai sayuran.  Sawi memiliki daun yang lebar dan berwarna hijau, dengan beberapa varietas memiliki rasa yang sedikit pahit.  Sawi merupakan sumber nutrisi yang baik, mengandung vitamin, mineral, dan serat yang penting bagi kesehatan tubuh.  Sayuran ini sangat serbaguna dan dapat diolah menjadi berbagai hidangan, seperti tumisan, sup, atau sebagai lalapan.\r\n\r\nAda berbagai jenis sawi yang dikenal, antara lain sawi hijau (caisim), sawi putih (petsai), dan sawi pahit.  Setiap jenis sawi memiliki karakteristik dan kegunaan yang berbeda dalam masakan.  Sawi hijau, misalnya, sering digunakan dalam tumisan atau sebagai campuran dalam mie, sementara sawi putih lebih cocok untuk diolah menjadi sup atau kimchi.  Sawi tidak hanya lezat dan bergizi, tetapi juga mudah dibudidayakan, menjadikannya pilihan sayuran yang populer di berbagai belahan dunia.', 'sawi.jpg', 2),
(17, 'Singkong', 'Singkong (Manihot esculenta) adalah umbi akar yang menjadi sumber karbohidrat penting bagi masyarakat di berbagai belahan dunia, terutama di wilayah tropis. Singkong dikenal dengan kemampuannya tumbuh di tanah yang kurang subur dan tahan terhadap kekeringan, menjadikannya tanaman pangan yang andal di daerah-daerah yang sulit untuk bercocok tanam tanaman lain. Selain umbinya, daun singkong juga dapat diolah menjadi sayuran yang lezat dan bergizi.\r\n\r\nSingkong memiliki beragam manfaat, baik sebagai sumber pangan maupun dalam industri. Umbi singkong dapat diolah menjadi berbagai macam makanan, seperti getuk, tiwul, tape, atau keripik singkong. Selain itu, singkong juga dapat diolah menjadi tepung tapioka, yang digunakan dalam berbagai industri makanan dan non-makanan. Daun singkong, yang kaya akan vitamin dan mineral, sering diolah menjadi sayur yang lezat dan menyehatkan. Dengan kandungan karbohidratnya yang tinggi, singkong juga menjadi sumber energi yang penting bagi masyarakat.', 'singkong.jpg', 1),
(18, 'Talas', 'Talas (Colocasia esculenta) adalah tanaman umbi-umbian yang banyak dibudidayakan di daerah tropis dan subtropis. Umbi talas memiliki rasa yang lezat dan tekstur yang lembut setelah dimasak. Selain umbinya, daun talas juga dapat diolah menjadi sayuran yang lezat. Talas merupakan sumber karbohidrat yang baik dan mengandung serat, vitamin, serta mineral yang penting bagi kesehatan tubuh.\r\n\r\nTerdapat berbagai jenis talas yang dikenal, antara lain talas ketan, talas bogor, dan talas mentega. Setiap jenis talas memiliki karakteristik dan rasa yang sedikit berbeda. Talas dapat diolah menjadi berbagai macam hidangan, seperti kolak talas, keripik talas, atau getuk talas. Selain nikmat, talas juga memiliki manfaat kesehatan karena kandungan seratnya yang tinggi, yang baik untuk pencernaan.', 'talas.jpg', 1),
(19, 'Timun', 'Timun (Cucumis sativus L.) adalah buah yang populer dan menyegarkan, termasuk dalam keluarga Cucurbitaceae bersama dengan melon dan labu. Berasal dari Asia Selatan, timun kini telah dibudidayakan di seluruh dunia. Buah timun memiliki kulit yang tipis berwarna hijau, meskipun ada juga varietas yang berwarna kuning atau putih. Daging buah timun berwarna putih dan berair, dengan rasa yang segar dan sedikit manis. Timun sering dikonsumsi mentah sebagai lalapan, salad, atau acar.\r\n\r\nSelain menyegarkan, timun juga kaya akan nutrisi. Timun mengandung banyak air, vitamin K, vitamin C, dan kalium. Kandungan air yang tinggi membuat timun baik untuk menghidrasi tubuh, sementara vitamin dan mineralnya berperan penting dalam menjaga kesehatan tulang, kulit, dan jantung. Timun juga rendah kalori, sehingga cocok sebagai camilan sehat bagi mereka yang sedang menjaga berat badan.', 'timun.jpg', 2),
(20, 'Tomat', 'Tomat (Solanum lycopersicum) adalah buah yang sangat populer dan serbaguna, sering dianggap sebagai sayuran dalam masakan. Berasal dari Amerika Selatan, tomat kini telah dibudidayakan di seluruh dunia. Buah tomat memiliki kulit yang halus dan berwarna merah ketika matang, meskipun ada juga varietas yang berwarna kuning, oranye, atau hijau. Daging buah tomat berair dan memiliki rasa yang sedikit asam dan manis. Tomat dapat dinikmati dalam berbagai cara, baik mentah sebagai lalapan, salad, atau diolah menjadi saus, sup, atau jus.\r\n\r\nSelain lezat, tomat juga kaya akan nutrisi. Tomat merupakan sumber vitamin C, kalium, folat, dan vitamin K yang baik. Tomat juga mengandung antioksidan likopen yang kuat, yang dikaitkan dengan berbagai manfaat kesehatan, termasuk mengurangi risiko penyakit jantung dan kanker tertentu. Kandungan nutrisi yang tinggi membuat tomat menjadi pilihan makanan yang sehat dan bergizi.', 'tomat.jpg', 2),
(21, 'Ubi', 'Ubi adalah tanaman umbi-umbian yang menjadi sumber karbohidrat penting di berbagai belahan dunia. Ada berbagai macam jenis ubi, yang paling umum adalah ubi jalar (Ipomoea batatas) dan ubi kayu (Manihot esculenta). Ubi jalar memiliki rasa manis dan warna daging yang bervariasi, seperti ungu, kuning, atau oranye. Ubi kayu, di sisi lain, memiliki rasa yang netral dan daging berwarna putih atau kekuningan.\r\n\r\nUbi bukan hanya sumber karbohidrat, tetapi juga mengandung nutrisi penting lainnya, seperti serat, vitamin, dan mineral. Ubi jalar, khususnya yang berwarna oranye, kaya akan beta-karoten, yang merupakan antioksidan dan sumber vitamin A. Ubi dapat diolah menjadi berbagai macam hidangan, mulai dari makanan tradisional seperti getuk dan tiwul, hingga hidangan modern seperti keripik ubi atau sup ubi.', 'ubi.jpg', 1),
(22, 'Kunyit', 'Kunyit (Curcuma longa) adalah tanaman rimpang yang dikenal karena warna kuning cerahnya dan perannya yang penting dalam masakan serta pengobatan tradisional. Kunyit berasal dari wilayah Asia Selatan dan telah lama digunakan sebagai rempah-rempah, pewarna alami, dan obat herbal. Rimpang kunyit mengandung senyawa aktif kurkumin yang memiliki sifat anti-inflamasi, antioksidan, dan antikanker. Kunyit sering digunakan dalam masakan Indonesia, seperti nasi kuning, sate, atau gulai.\r\n\r\nSelain digunakan dalam masakan, kunyit juga memiliki banyak manfaat kesehatan. Kurkumin dalam kunyit telah terbukti efektif dalam mengurangi peradangan pada berbagai kondisi, seperti arthritis dan penyakit radang usus. Kunyit juga dapat membantu meningkatkan fungsi kognitif, melindungi jantung, dan mencegah beberapa jenis kanker. Kunyit dapat dikonsumsi dalam bentuk segar, bubuk, atau sebagai suplemen.', 'kunyot.jpg', 1),
(23, 'Jahe', 'Jahe (Zingiber officinale) adalah tanaman rimpang yang dikenal karena aroma dan rasa pedasnya yang khas. Berasal dari Asia Selatan, jahe telah lama digunakan sebagai bumbu masakan, obat tradisional, dan minuman kesehatan. Rimpang jahe mengandung senyawa aktif gingerol yang memiliki sifat anti-inflamasi, antioksidan, dan dapat memberikan efek hangat pada tubuh. Jahe sering digunakan dalam masakan Indonesia, seperti rendang, soto, atau wedang jahe.\r\n\r\nSelain sebagai bumbu masakan, jahe juga memiliki banyak manfaat kesehatan. Jahe dapat membantu meredakan mual, muntah, dan gangguan pencernaan. Jahe juga dipercaya dapat meningkatkan sirkulasi darah, mengurangi nyeri otot, dan memperkuat sistem kekebalan tubuh. Jahe dapat dikonsumsi dalam bentuk segar, bubuk, atau sebagai minuman jahe hangat.', 'jahe.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id_wilayah` int(11) NOT NULL,
  `nama_wilayah` varchar(255) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id_wilayah`, `nama_wilayah`, `latitude`, `longitude`) VALUES
(1, 'Pamekasan', -7.11, 113.4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `data_cuaca`
--
ALTER TABLE `data_cuaca`
  ADD PRIMARY KEY (`id_cuaca`),
  ADD KEY `id_wilayah` (`id_wilayah`);

--
-- Indexes for table `musim`
--
ALTER TABLE `musim`
  ADD PRIMARY KEY (`id_musim`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`id_tanaman`),
  ADD KEY `FK_MusimTanaman` (`id_musim`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id_wilayah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_cuaca`
--
ALTER TABLE `data_cuaca`
  MODIFY `id_cuaca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `musim`
--
ALTER TABLE `musim`
  MODIFY `id_musim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id_tanaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id_wilayah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_cuaca`
--
ALTER TABLE `data_cuaca`
  ADD CONSTRAINT `data_cuaca_ibfk_1` FOREIGN KEY (`id_wilayah`) REFERENCES `wilayah` (`id_wilayah`);

--
-- Constraints for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD CONSTRAINT `FK_MusimTanaman` FOREIGN KEY (`id_musim`) REFERENCES `musim` (`id_musim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
