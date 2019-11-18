-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2019 at 03:53 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectone`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(198, '2014_10_12_000000_create_users_table', 1),
(199, '2014_10_12_100000_create_password_resets_table', 1),
(200, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(201, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(202, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(203, '2016_06_01_000004_create_oauth_clients_table', 1),
(204, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(205, '2019_08_19_000000_create_failed_jobs_table', 1),
(206, '2019_11_14_163710_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('3c9e5809020c754b80d5cf01a1bcae69f0d83d5b0d14e25e0e4ed40fc898a08e171af47e4acb4010', 1, 2, NULL, '[]', 0, '2019-11-17 18:54:12', '2019-11-17 18:54:12', '2020-11-18 00:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'hQczOcXNiLR2RFQqspVTQ6eeRGt7yZ8ARHIWyAdZ', 'http://localhost', 1, 0, 0, '2019-11-16 21:05:19', '2019-11-16 21:05:19'),
(2, NULL, 'Laravel Password Grant Client', 'h5ZvVFOnKS9dsRyhMIo3uNZUFgblbkMSFIMmgW0U', 'http://localhost', 0, 1, 0, '2019-11-16 21:05:19', '2019-11-16 21:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-11-16 21:05:19', '2019-11-16 21:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('00b2f32f422ebb12bf2dc2ec54f266d9a398fa08837c32b648fc475d0f812201d2745775cf426a04', '7f8f276d1020ab937e7a6839d58d209299107f5acdc76364a0bb040f97922e30ce546d10518c96ba', 0, '2020-11-17 14:42:08'),
('03203ecd3041d2a7147a696a4e827233165d956aa4a888c8f96ccf3a28e8d549a473b9f44facfeb3', 'eeeab29cbd1ce20f98bdca7adcc83a3f57825775c364c1d3f9f7e294d6c5098787ace65f3f8fce2d', 0, '2020-11-17 17:07:05'),
('03f71800a5a225e921bebb50a3f64cf526c63e523ee98fbcc2673f1ac23274f00bfd73e28274120e', 'd1b3d2272545856773a7b81d55dfa5fbe503b501885dd96f3f6a7f3143ceb5817121dfffc487f92c', 0, '2020-11-17 13:27:06'),
('0f1c291a03af0c4f3de4bd4f400b5325265a0ded9bc87ade797840c9b449420ce4dae947f009841f', '1918e2d8a506e37d1ce452a188c0b95c3ce7d43fe34edc0b8c57027b007c7f8e67e08bb0e62fda2e', 0, '2020-11-17 14:22:05'),
('1484cac43c724503b5b4eb09c276af67fe00a024195faafcafe626ae17e92214d9ac4ce7706e3692', 'e2437c686f10a38b3dc311f00cf55de845cc3b4a90b10c221ee86ba6ff05994f47957cee04a09f9d', 0, '2020-11-17 13:08:08'),
('1594f2b500bad55d607a4ae35af9b14bfa4835b486f0f6ec217c54396a967c6a98730934f5035e9d', '1c199c17b168fca7ef7c308cfe136890f454341efd69cc31372af168d16cbd9136864e83c473d3a9', 0, '2020-11-17 09:57:19'),
('1945ea7b6a36543314d9c544a209a3788535a7f0a4f35d98af9144f1edb882a3c5195aa7bea1c468', '13b8775390e62e78dcc2b34edb27a71f2a03a9164d25f43c1bcbc2b50ea6b376ee7006288c14b648', 0, '2020-11-17 15:42:31'),
('1fb45bc5f5fd4422c40a7023f3cf6f87699eed76bf73fb7bb6e9de7cbf2baf7f57940e5a865595b9', '1da9d4b6a8235569dbae80aae08b70d4205bc177a9ed9f4ddec44d28a245c0b9eb21015fe26ab215', 0, '2020-11-17 14:57:16'),
('22365487d0ca064df4ef5a1fc47affa15400f323795360f05bf54f58e885ce2b2aa927386b413292', '2b809191e012c6dd9a0f623ef49af9a49cefd680669d39649e788083167ff3f581fb0e00dcbf1060', 0, '2020-11-17 15:08:43'),
('2387c1f7d3796f4650b0c346945f9cf1be23ac38a5b0b4c810ab00293603bcb66ba3c113d6539a11', 'bfe5a50d36f4b7a5064b9783f345306f6caf124975097ff184a364e7385a8a6e0324340cd5aec4a2', 0, '2020-11-17 09:54:09'),
('38b39aa4313d286829a607aa520f75f223b88cdafd79824978363fd0dbca4f6407e68f8c1511068b', '0b198755122a1900c1f02ec4e481585eb219f9fd80155400907e92e8260fad5236a5ddba496e1aae', 0, '2020-11-17 15:39:48'),
('3b2da6a6c9463e8fd885ac1b3181796544d0cf1111fe4cef95fd74a672a0d9e78dab39e430248dab', 'db0777f20af5f4af98a6a05e95d3ec23e0002f9313f36747154cbc6485dc5f653b6aafa8b601985f', 0, '2020-11-17 09:48:14'),
('3da9e4a56b21c4d1547bf436fa15d03a558bdc98138e468bc32d5adc672c99dff450ed72094851e5', 'fc05d01b851e896969daa661ad95f918c8920b1bd92dab60769897cc0e76fadf4bb5466cee67cc3f', 0, '2020-11-17 15:55:00'),
('46b1d33baa502274506c01d012084248b7fd2042f9762f3eb982ca8350fefe876e86af847f717a54', '0b31290b3c21e49d0f8b74178d365109cd80e1eb2eaae34efbfc347ccb5d143b8f4885ce8035d41a', 0, '2020-11-17 14:58:45'),
('49896d6a6becd29602c78f93099d0c5014063538c3f8dd530f682c0bd10ad46e925bf7ba337bb378', '419c8c02a12c973a613b06c73fd7dfa795bc77a184865867c7892b1ae8ec126b7d923e5b29ac1774', 0, '2020-11-17 12:51:07'),
('4b21e0c92c834ed016bd6c4909c2c9fbca30c23814804bc4a67421aab0a020c645af5fe78d92fe43', 'fe3f2f1995be16c42ba6a14284b76be901f6f49eab406d1995e794ab1d884bebfe0b3cb095de0570', 0, '2020-11-17 09:46:25'),
('4bbfa45fabe9382925ee8eba7e46da85a535eb6d32a3db557b156f72765db93a9fd810b07ba3498f', 'cc72dc017c24ee2fba7521f928e8850936018a6100d252f24bbebb9d004150a146adfdb1d3370e09', 0, '2020-11-17 15:02:08'),
('500b69d6f9c9a898b5544169caacdd801c3f608c1609ca4fd5be1f82ead5043795a0a1f40123bac3', '06fdd749b202a4c34912f9c7b53af9be82a0fa761d54dc8a77ebdc6dbaf0523680b0494ceb4ba71a', 0, '2020-11-17 14:54:18'),
('53db23ca1555b1d77754057163182c23495457ce8affc84918e374538a5cd53b25e7a3453cdc0810', 'd1d2bbba363714999b2e393148539124768085abac2f61a17d52cf1375340e0cede3c5320ca88ebe', 0, '2020-11-17 13:25:03'),
('57a71e4b548714c08f32d1baf58b7e03756deb28d7dea75f148ffbc9b6527a699d4f24b738f97dcc', '3c9e5809020c754b80d5cf01a1bcae69f0d83d5b0d14e25e0e4ed40fc898a08e171af47e4acb4010', 0, '2020-11-18 00:39:12'),
('5d13d44ca21c343318d3bdcd5c3ff70a109dd662a714cb3fde23bd257f4f89ad2e6174b0f25517bb', 'c16d1717a69773631ce1b6304574e5a0cce95e84941750791df5deade2b3b248c161b0cfc85174ac', 0, '2020-11-17 13:02:43'),
('5d4488d3236b38989d545329e5685f6c3067feb0e6ba3e649e183264deb3b62979dd1199e7a1b5f7', 'a209957e2da49cda6f8314b2a24f05b3b2b0566612628a0a4d3252118bb1939f63714f688bda811b', 0, '2020-11-17 09:31:47'),
('5dee1a42d9d1db4e4d40739ca3317ce4a8ba8f5af7ef11792fa7370ef2eab467e427fbb643b9074a', '4728ef106f49e3f0ead73f152f0a4a189b7e49d3ece74cddd8138a430b621aa58d384d4bc7d053dd', 0, '2020-11-17 13:22:38'),
('604c710e33cc6cd8ec5f0b7dc4c24044f876cbfa6b402c03cc0ec88585c0fc1824a4a4ca6eb90b8c', 'f7f4c6dd2db47d3a8c8c9984a81d203f14aa9bb60c6b233baca8982d7dbdbee48d29941486372c61', 0, '2020-11-17 13:31:24'),
('63caf3cf4be36c64d95e88fd49be1b840c50d04ff59ea5f0c3339c502fe1b69abbd2cdfef6a07017', 'd8fb5b5253ea5d74a0c65cde4255528e417a667a7756b2009733e9a7b503bad218c435bae7314178', 0, '2020-11-17 15:04:59'),
('64c3829e9124e69817823b32b1fe40d6ead286765f3875da60a5b9b4d21e1f5312122f666773c555', '6a503107f9d2c294d46ee682f3bb3f1f91ceaf82a9ca559e3ffa54077d71465099fe56a4f48853c9', 0, '2020-11-17 13:27:41'),
('65808369c6dbecb055c2125479fdd26ca1a4b41197e6293161aa54b562c246f36b85a4c93c258a7e', '62388a072fd2706a29b300a0e8180e79b0a73d8417999eadafda5bba7975b037822d73bea7b5e357', 0, '2020-11-17 18:47:42'),
('69bace0081367ee09204a718d2176b61ea55f6814f4eb91d15d542bb82cfef0a21567a6bedbca227', '0c33b6ba9b277f26ef57769f0d1dd65439644f1add3182cd036e5a7fe0ed8d54a0c767fee2d2a9e5', 0, '2020-11-17 12:40:54'),
('6e70097b6304864a8b15ad63b06b788e0b3e9647445d17eaeebd5a2821d811e73c208335670f4f94', 'e1bafb0fb2fad8a5480aab8f211c54f0e1681ecf0e67d63ba06c4aa12ffc8db74772f0299e9eb121', 0, '2020-11-17 15:34:03'),
('6fd61706c456d4ea2c1da1e13afe6f3e1348ff71b5de9671c1a9501dc68142d9de1ef4aed08db38e', '98ccab45b302571a1751b3a13de07eb34b439f1971f39b5598612031ca8d21698420dbadee0bf75f', 0, '2020-11-17 10:03:56'),
('735fbe25037b768e419086803191ea91282b33b83856a3c10f8a43695ed4efa9cdc3f7683b663cf6', '8a3767e1e558f22e7f150f9b432094056d8dba530d368c8854cea228a3cec1c782dfba08343a64d9', 0, '2020-11-17 16:23:00'),
('73a1ce7eaa70a433a715022595f60060a8e5454909cd4780b9e163f75cb994f937468c38742c4516', '361c1073c12ae8bcdef9580e33c8c4945cee8fcaa056220f260010fd653ff470f6d369bb4202f0a4', 0, '2020-11-17 09:46:59'),
('74aeb091322109a3d9f64ad933343afa7d7c1bf1316de9d69f8b22c4314ce42f75eee4b1d5a0017d', '984f97a53a0b163ce642de2bacd8bebb0726bf0811b49f671fa1bab4f6fb5811aeeb09214636da90', 0, '2020-11-17 21:51:08'),
('80e4afe6ae48c4102ad6cb6b8030da7bd7b4fe19010806573dbd9157f5274de1f0e137a675065526', '30ebec302744360639b9550087e670874e7957ac9f95d02a1d8602533cfa81f719031608020591fe', 0, '2020-11-17 13:12:36'),
('8254ea1fdfa685374795147e2bc23adfc38ccdef8d0f81c24321a58b00054b60272d7ab45de8ea11', '6b5a6b7b261b5bac182d8422a115c96c819aee7e205fea54948859da006d1f59521cd96195ac51f4', 0, '2020-11-17 12:53:19'),
('857341793a588f58103e55cfbac04a367f107452a668bbfb534b6db53118452f2ac9e981857817ce', '2b46fad6d5601764d764f347405a4d9a48c809b2db55f3b5bac6d65f6fcc06b46a24dcf40f17cc31', 0, '2020-11-17 13:30:17'),
('86bbe0a0f6fc59d8b45eb6c575e676c78248d60587a4a85795ddf8fe598c1195c88fee792c76da90', '4060aa6ed2f906a0d6bc9e4c4d13c4d367acee0740eb8e4266d5aa5215638466654912748ceee71e', 0, '2020-11-17 09:46:35'),
('87156d53dd60df0af64f46cd5779d868f8868ce3b2b80fddccd6cf8d2c4043ff4837dc2fb011d609', '2f8e90fa09cebc5a9c3d7611eb2c465b064599a438669c0476947d62fd48724e5e5535672536be4b', 0, '2020-11-17 19:32:49'),
('871ba53eaa6497862ffcfbbc04597c5f4f6d5e0417e27f94fec76406422aef9bedb0f79cf0432a6a', '2665e57db5404758fa798bb0dd7620886e45b256048168eb8b0f85ab73031a338ffd3d7ff1eb2455', 0, '2020-11-17 10:02:08'),
('94feb9793bab6f9585513e81ef155f545e59bf32fe515dc00ebca9ab839c60a802ec184520192456', 'bb12d20b3a5c5ce027ea5fe07dda4ebca8450247340a18f3df5c86bd8fc7ef2b95e64bb709b4877e', 0, '2020-11-17 13:37:48'),
('954f77ac03cf9abb699e2c4feb0afeac3ef018242c2d0dbdfd64f70e588a0ce2ec038d4c3c24bd79', '483a8beab24e3cf3472da22e7e47606ac207ab9d5940a772191baf7534d4d405c35e4a32dbb0e1b2', 0, '2020-11-17 18:47:48'),
('96f918b6520b2ba3b04b13769a0268f6326b5180df06889e4d90c6e99b31eebd56e98d68df2f0d8f', '6a62f275bb11e751e464c105df62569837e1f048bd946b89b13e2cb06a8bac79280fcfb1b79048c2', 0, '2020-11-17 09:56:25'),
('993bdebcf95c1eba022127e341ca62424af46c559f98fa52656a5ec8c4da4fa95ff5779aefe45d9f', '47114e8fa26b093e8ba341d0816af52dce98d0d89f2a18c4618e5863ea7e50deeaee0a3fcf3aafa5', 0, '2020-11-17 15:27:28'),
('a490defc753b42dce46f96be9da7986a64c684662af78d25f2c775b030661a840d1bceacf2737bd4', 'c1abd434b33eccf18da66e592ba343b2d1471dd76a9b95bb5d820ba620f23db7a7b3b2ba6908cba2', 0, '2020-11-17 12:52:15'),
('a5f3a329e6e0739437b51916954bc71e1dd20d3adcb6c0c9330aaaebb2a15f72ac9082fecc9dd77d', '8adf579d89970de321b1228e4da97bf1f4082636a95ce2dae58674ae34ad292bab55e7f4dfb8c2d7', 0, '2020-11-17 13:07:36'),
('a8d18c6c15640de0f10dfdce813352ac2f08f7c511f401f5c2fb9e27a25ef83a5b9926dba165deed', 'e895a35bc1f6d0b25efa77dfd91af94afa804e3c9023bcddaa38511ebeb379b19a84ee11c6264e2d', 0, '2020-11-17 15:59:54'),
('a9dcd42d6263638ed293db57157999f4ce714ccc216a19f1ee712b4f1465323d89c767aa99759cb8', '620b7230e44298230dc5863c3fd7ed2a1672bb9b679a9a99d0382781cff1235349dd2b739ceeb4f9', 0, '2020-11-17 02:51:05'),
('afc96c406e7f63e6329e6ddffd09b4da6dd49b0d1b09d9ea34c70a7c568f95088c0e43b1dcd4a207', 'e1804f7d0924d9afefbf2b12fdfb22cfc8ae65146e0df7da5294f9d62427a6360ddefbcec9a9a360', 0, '2020-11-17 11:56:56'),
('b0f08e9b2547a8e609840c10ea8c659757dcc01ba07024349e0cb5b4637105f4c48a14edd6ea8606', '922565d613016d79966c359ef3d9a546e6b9967a4c2cbf05a7cf703372c320ca1f59460cf8c6626b', 0, '2020-11-17 15:35:20'),
('bb5e766e8c55510fe329cc6d3b10a89d66fc15a0280993c58df96cef8d425ca1a643ce01b923b79d', '127f32778c26b07c17a1e3cb13a1a7c69a6854b79e8d9aca9d46472ef7f5823bd7d3547cb1122162', 0, '2020-11-17 15:38:25'),
('bcb9e92b8129fa101362ddd0cfbde371d85b9c9543cf76dea1bd84e5a1e28a90e61289dc16437ab1', '0aa2dff410578c601b51afdaff6d04ebc7da2f916991afe956856265bf9ad9358546fea8982d7f16', 0, '2020-11-17 13:06:51'),
('bf77c6af93dfd5893e31ce74231a0480cf9acdaa8968a7a166d0e83711231898bdc0021e080a0e93', 'ea3edee3a0ed830911bdd0f715832f8e9aee4758c652690acad3e4555c7771dae45b44aa9c2e22d8', 0, '2020-11-17 15:37:06'),
('c0010a1f13ddaf3fefa658528d8946b18eb2e1cb6687699190e7df4bc7a5ca7433a8ba09ae2f3a55', '88036193b731c066404d5b2738c7a1590d544af7b682c752c7d96121922a392ac7c320ece5444acd', 0, '2020-11-17 10:49:06'),
('c29f1db47ec2b2160b6b86ca37eb699a652df3b57e6385326bba297050ba48c843815c3c3940c0eb', 'f6a48fb6ec0d82a4e742f290abecbc89a9de9cb67f1a3027b434931fcd976e4e285f2aae47f10991', 0, '2020-11-17 13:23:54'),
('c45d7168a1a0109f72ee9092b2e71e5380536975e9996ea56c081cb610d87efcc3d49ab9a7c9cfbc', 'f82030c160e33f5d572c66a6fe4cc650d25253374882cfb183346d73e779b9a9d95384a2a467fcf1', 0, '2020-11-17 15:15:05'),
('c7e110086548a8038ac976be712e9feee917d26726b2d9243bd152c9ebc2fa7b299e23a0b3f62f6e', '2c200e4ee037e45d79eb1c22f93a2811720f1f2d4d9c7082304953aee91a4f25259b3df86b20d472', 0, '2020-11-17 19:01:06'),
('c7f9619934ca150024c8e90d4f9ef6fd54e2ce76f97a0ec8bc8b08c98f03afd953c3d48b2addcfd2', 'bbee297c56d083d55203d975af222249e1aae503ed8328a9c2bde44692072976aaf9990a66e007a8', 0, '2020-11-17 15:00:15'),
('c9c35635ff9283debd664dc52d23c512c831ed44d9ab4c9482c735566528a7d6121087d6bc9887bd', '840bf3e16f7dc4cfc9865872225af99c6316b8122de79f39215a512b123540c84eb5baf27c607c85', 0, '2020-11-17 09:46:12'),
('cc5fb76294e8c43d2263c195b0378a806bdad178e0a637f5b01869aa022304c5bfb295149fb640ad', 'f496e4803ac3c04dbcdb5f4b11cc4fd8881c1714713697bcd6ea67dee82821f9b15bc6d39b3fd7da', 0, '2020-11-17 15:56:45'),
('cf052398046f34f2222acad8612013bc7b271e05e800656adbb35626698f5984a200aa02ffcc3dd5', '2f99fbd37d7fffe71a8a5ca1ce586dca30a56dd193aa7a2cdaff9650096615465ba64c6d91491ed9', 0, '2020-11-17 13:03:13'),
('d044ca0735215a67a1f5efaed8505d1e5b75debe0576d7903879bd9fc5c7c37ec5794e9445bbc909', '49c7b7437a9ce082c00d8858b64f6c59fa64f40a2cba3cbb5ba3f2e6d8b6eb02aabe86b60ad36f4f', 0, '2020-11-17 13:48:13'),
('d232f3cb2ca7fdd5423b209a88c18960aed383d1785e1bdd10c23259a2d324761dc81a0d40671b20', '016d4e3600e9c0ee0da1375e2fc5aabe03faa4b779d5f824e572161e2c6f303238293376dc89bb7e', 0, '2020-11-17 15:31:07'),
('d502f43794aaa27e8a28cd83eaf2ae6070aca424fd72998bdd01b750ed11f9822cc84bac6f11c664', '46851ed661855082726743e72922827494a846c31943dd7119c84482785e62102d563fe85e868b10', 0, '2020-11-17 13:05:12'),
('d55aa0dc7a1eecac5d6061b10d0f1dba7cd79c6f9ec6671567198efb33114cc96f042ac02e3fd62f', 'cc684efd6b195bb4ed782876081b4ecbf15bf3766999ad912068b6c801ca1b26dd303c1fef835b1a', 0, '2020-11-17 15:34:53'),
('d5d8882410de59f7014343342ac7e034f14cca6549971229a6e5f35582620cda11b4151da78da0f7', '256f7090b5bd6f089051b28c61f7c61db9548daca3ff6311e2d3cc43481c39fc2f8ca3c7ac4fc422', 0, '2020-11-17 13:14:30'),
('d6644bdb912c6b66a536fe37d6ca99c4f24984b3775f1989f0e915693dd786a48c69131108c21ec8', '833c12f486d4fef3a5af91c721d1ce1b1f681c3c223a1686fe4e587bee95ab85decd65c433b4dc91', 0, '2020-11-17 13:01:03'),
('d6bbb982765821d6588b0d007e5e405188d4672a8680427a97b072974e29fed5407e9a4d76ba2ee8', 'e8d2655bd56d3aabb504fc8e516aecc5e8549be9a5ccf55c6cf6cec1e6398aa61937de6592ec6a8c', 0, '2020-11-17 12:32:02'),
('da1c9bda04477932f75242ab0ce5f4c9c438dccce7d7d3aa88ccb8a6e6b8986462ab684386da49ce', '1f181965a5705db05f111bac0751ad19389a561bab84f29db41b3227cad999820e1bbbf64565c589', 0, '2020-11-17 20:44:00'),
('e213994cd5145a9d5a62f29cd2f645df1511479bf701dcc7e164a51d5641412ebaa9110549bc1c25', '77ba78b47ed9e8c82f787e0ffdab9b2a5efbddb258ee777a6bb0041f7c761ebf087144e3e12753af', 0, '2020-11-17 15:07:58'),
('e22d0768240c5f64cfafbb458d1be72d7bfdc43446eae145307e88df280eacfed7644cd886c3baeb', '1cd167596b3fe439c1ec962dd861747328017aea48588c873f24b6324f0d54cfed60a3b4f3b9356c', 0, '2020-11-17 09:53:02'),
('e5e01022ab50f0419f73a8e1ae87e3bd8bbd41a9e4b2c913a0a210cac67c01fa61f7e6d65f84f3e5', 'df263a2c362deba0d2477d928e2b101a97011e657a1c69cb0bc76e56e5046347435186c5bc3dd289', 0, '2020-11-17 15:31:59'),
('e67e2e806dec7fe5b65354f4f9d66449691c34a3e86f8e316aba18e8568bfd1d59e503077bc21b7a', '25d0bb1d67138263f4ce07655924608299a9608c574b4b5fb525f62d8fd590ed7ae606901f3b80be', 0, '2020-11-17 15:58:45'),
('e710575351020258f4c1bddf5c41930baa1bee4f855c135e7200f553b51d9effc02a59445249871d', '08497676622105bc68af2fb20a6691fb1c0f4778f769862a9bffb460c0275e62b37b9062a3639647', 0, '2020-11-17 13:10:01'),
('e733e2c477f50efb0a51f8ec88f769ce8bb92d8f6056bd2a6492897efa5213ade1bc0d6c65f017c8', '300fe69a4b1060a05a0a8dbb57975d12b0eed3320b45913135eca6c3799d6c0d0ffd89f20347d6b6', 0, '2020-11-17 15:41:52'),
('ee2778ace7cc859b908195da6686f566c755f4a66e78b64b054b4f00d8a5e64e419e862d811c516f', 'addb314680831d5d58f74d8ea214dee6ae788243eed59191ed38c4a5482dbbb3dacd42eee3cefedf', 0, '2020-11-17 13:36:59'),
('f37afc9e3b355243a389eadd4b1e1afd3220bac1b169bf41f0538b65fa1972ff2d38fc035cf2f8ea', '1e7b2a9057ff6f62ea76aeb321b27e9ab1dc64b82d848146589b77f50007b602004504fc87c01af9', 0, '2020-11-17 12:53:55'),
('f4d51c677fd449e71806174cbecdbbf1b58e6fd519267dc2c746f86ddc98375c4a4414a726b75a72', 'c431a24e412de3a35fec8573cfabf8b81da122981865eb7b55e624baf7e0a01d7dcd69293e3a8649', 0, '2020-11-17 15:54:24'),
('ffb3be60a95bcdc5c5a66e2e4531928b5cbd721156992533258ffa094695c8c2ca270822996558d6', '081a409d99853627af846b5460a78277f46d0b770b89192deda747df5b5d4a035a3ae66c6fc20d01', 0, '2020-11-17 21:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'list_user', 'api', NULL, NULL),
(2, 'create_user', 'api', NULL, NULL),
(3, 'edit_user', 'api', NULL, NULL),
(4, 'show_user', 'api', NULL, NULL),
(5, 'delete_user', 'api', NULL, NULL),
(6, 'list_role', 'api', NULL, NULL),
(7, 'create_role', 'api', NULL, NULL),
(8, 'edit_role', 'api', NULL, NULL),
(9, 'show_role', 'api', NULL, NULL),
(10, 'delete_role', 'api', NULL, NULL),
(11, 'list_permission', 'api', NULL, NULL),
(12, 'create_permission', 'api', NULL, NULL),
(13, 'edit_permission', 'api', NULL, NULL),
(14, 'show_permission', 'api', NULL, NULL),
(15, 'delete_permission', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'api', NULL, NULL),
(2, 'admin', 'api', NULL, NULL),
(3, 'customer', 'api', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'profile.png',
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `photo`, `is_verified`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Amit Gwachha', 'gwachhamit@gmail.com', NULL, '$2y$10$ZV2B1dJA13ZDRI3pYUJDR.EL0I2qIpngZ2iVi7y7Ts53.1xJLm/bO', 'super_admin', 'profile.png', 1, NULL, '2019-11-16 21:03:59', '2019-11-16 21:03:59'),
(2, 'Amit Gwachha', 'amitgwachha5@gmail.com', NULL, '$2y$10$9Ml3e.qGASQ03YSxzFLyoOCyCGMtxvz0/8OgF3DRb7/6zcvqXcf3G', 'admin', '1574023516.cxampptmpphpf243tmp.jpg', 0, NULL, '2019-11-17 15:00:17', '2019-11-17 15:00:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
