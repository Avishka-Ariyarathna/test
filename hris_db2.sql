-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 10:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hris_db2`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_records`
--

CREATE TABLE `attendance_records` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `total_hours` decimal(5,2) NOT NULL,
  `regular_hours` decimal(5,2) NOT NULL DEFAULT 8.00,
  `ot_hours` decimal(5,2) NOT NULL,
  `dot_hours` decimal(5,2) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `event_type` enum('public','poya','custom') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `emp_no` varchar(50) NOT NULL,
  `appointed_date` date NOT NULL,
  `designation` varchar(100) NOT NULL,
  `contract_type` enum('probation','permanent') NOT NULL,
  `plant_id` int(11) NOT NULL,
  `profile_pic_path` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `user_type` enum('Executive','NonExecutive') NOT NULL,
  `is_manager` tinyint(1) DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `department` varchar(50) NOT NULL,
  `manager` varchar(100) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `emergency_contact` varchar(100) DEFAULT NULL,
  `annual_salary` decimal(15,2) DEFAULT NULL,
  `monthly_salary` decimal(15,2) DEFAULT NULL,
  `pay_grade` varchar(50) DEFAULT NULL,
  `job_level` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `branch` varchar(100) DEFAULT NULL,
  `tax_id` varchar(50) DEFAULT NULL,
  `tax_filing_status` enum('Single','Married','Head of Household') DEFAULT NULL,
  `nic_no` varchar(20) DEFAULT NULL,
  `nic_issue_date` date DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `initials` varchar(50) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `other_names` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address_no` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `tel_no` varchar(20) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `police_station` varchar(100) DEFAULT NULL,
  `gr_division` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `key_role` varchar(100) DEFAULT NULL,
  `grade_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `manager_location` varchar(100) DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `epf_no` varchar(50) DEFAULT NULL,
  `etf_no` varchar(50) DEFAULT NULL,
  `job_description` text DEFAULT NULL,
  `medical_certificate` tinyint(1) DEFAULT 0,
  `shift_basis` tinyint(1) DEFAULT 0,
  `emergency_contact_name` varchar(100) DEFAULT NULL,
  `emergency_contact_relationship` varchar(50) DEFAULT NULL,
  `emergency_contact_no` varchar(20) DEFAULT NULL,
  `emergency_contact_mobile` varchar(20) DEFAULT NULL,
  `leave_l1` int(11) DEFAULT NULL,
  `leave_l2` int(11) DEFAULT NULL,
  `leave_clerk` int(11) DEFAULT NULL,
  `documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`documents`)),
  `bank_code` varchar(4) DEFAULT NULL,
  `branch_code` varchar(4) DEFAULT NULL,
  `transaction_type` enum('SBA','SLI') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `emp_no`, `appointed_date`, `designation`, `contract_type`, `plant_id`, `profile_pic_path`, `email`, `mobile`, `user_type`, `is_manager`, `password`, `department`, `manager`, `skills`, `education`, `emergency_contact`, `annual_salary`, `monthly_salary`, `pay_grade`, `job_level`, `bank_name`, `account_number`, `branch`, `tax_id`, `tax_filing_status`, `nic_no`, `nic_issue_date`, `title`, `initials`, `last_name`, `other_names`, `gender`, `marital_status`, `date_of_birth`, `address_no`, `street`, `city`, `district`, `tel_no`, `mobile_no`, `email_address`, `police_station`, `gr_division`, `nationality`, `religion`, `key_role`, `grade_name`, `company`, `branch_name`, `manager_location`, `contract_end_date`, `epf_no`, `etf_no`, `job_description`, `medical_certificate`, `shift_basis`, `emergency_contact_name`, `emergency_contact_relationship`, `emergency_contact_no`, `emergency_contact_mobile`, `leave_l1`, `leave_l2`, `leave_clerk`, `documents`, `bank_code`, `branch_code`, `transaction_type`) VALUES
(12, 'Vilochana Udantha', '124', '2025-06-11', 'Software Engineer', 'probation', 2, NULL, '', '', 'Executive', 1, '', '', NULL, NULL, NULL, NULL, 1980000.00, 165000.00, 'grade1', 'Engineer', 'Sampath Bank PLC', '10015232323', 'Colombo Main', 'Not provided', 'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7278', '001', 'SBA'),
(14, 'Sunil', '2121', '2025-04-07', 'Laborer', 'permanent', 4, NULL, '', '', 'NonExecutive', 0, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SBA'),
(15, 'P M Indrachapa', 'E000120', '2025-06-26', 'Software Engineer', 'probation', 4, 'profile_pic-1750999247253-248836798.png', 'vilochanaudanthaaa@gmail.com', '+94704756072', 'Executive', 0, 'vilo12', 'IT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SLI'),
(16, 'Indrachapa', 'E000128', '2025-01-23', 'Software Engineer', 'probation', 4, 'profile_pic-1751616035143-744047940.jpeg', 'indrachapa@gmail.com', '+94704756071', 'Executive', 0, '$2b$10$IQNiAlQL2omemRNck7VPV.HU8pXsScsacT/URkxrl29iyJEGeWoha', 'IT', 'P M Indrachapa', '[\"MERN\"]', 'BSC (Hons) Software Engineering', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2003162545', '2019-11-20', 'Software Engineer', 'P M', 'Indrachapa', 'Udantha', 'Male', 'Single', '2003-05-04', '339/A', 'Rathmalgoda, Poruwadanda', 'Horana', 'Kaluthara', '0112343222', '0723456757', 'vilochanaudanthaa@gmail.com', 'Horana', 'Ingiriya', 'sinhala', 'Buddhist', 'Software', 'Grade1', 'SLE', 'SLE', 'MEMP', '2028-01-25', '00124', '00124', 'Software ', 1, 1, '0723243555', '0723243555', '0723243555', '0723243555', NULL, NULL, NULL, '[{\"name\":\"Degree\",\"type\":\"PDF\",\"size\":\"654.76 KB\",\"path\":\"/Uploads/docs/1751455535185-429432413-6. Shift Dispatch Summary 2025.pdf\"}]', NULL, NULL, 'SBA'),
(18, 'Amal', 'E000129', '2025-07-01', 'Supervisor', 'permanent', 2, 'profile_pic-1751814095771-575860056.png', 'amal@gmail.com', '+94704756033', 'NonExecutive', 0, '$2b$10$RSOaCR3iNHpp.AwUZ3C5ZeJiqMnCId8/tdzqaztQu.0wLFP/bpTj.', 'HR', NULL, NULL, NULL, NULL, NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SBA'),
(19, 'Kasun', 'E000130', '2025-07-02', 'Supervisor', 'permanent', 4, 'profile_pic-1751814150974-838656505.jpeg', 'kasun@gmail.com', '+94723456722', 'NonExecutive', 0, '$2b$10$mIDUmFMbmls10rZXpqC/8uTdm4XYtN8JchvX3qXdgkectFpsXxs/e', 'HR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SLI'),
(20, 'Kamal', 'E000148', '2025-07-03', 'Laborer', 'probation', 2, 'profile_pic-1752731329899-86798042.jpg', 'kamal@gmail.com', '+94723456757', 'NonExecutive', 0, '$2b$10$t594b/1YAhlxQzVZj53LuuPDzRlkgM2VgQa5KeDmwTm4pplgzo.6K', 'HR', NULL, NULL, NULL, NULL, 720000.00, 60000.00, 'grade4', 'level2', 'Bank of Ceylon', '23432345432', 'Aluthgama', '34534332', 'Single', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7010', '680', 'SLI');

-- --------------------------------------------------------

--
-- Table structure for table `executive_attendance_records`
--

CREATE TABLE `executive_attendance_records` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `shift` varchar(50) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `total_hours` decimal(5,2) NOT NULL,
  `regular_hours` decimal(5,2) NOT NULL,
  `holiday_pay` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `executive_attendance_records`
--

INSERT INTO `executive_attendance_records` (`id`, `plant_id`, `employee_id`, `employee_name`, `date`, `shift`, `in_time`, `out_time`, `total_hours`, `regular_hours`, `holiday_pay`, `status`, `created_at`, `updated_at`) VALUES
(4, 2, 12, 'Vilochana Udantha', '2025-06-04', 'Day', '04:36:00', '15:30:00', 10.90, 8.00, 0, 'Pending', '2025-07-15 06:08:22', '2025-07-15 06:08:22');

-- --------------------------------------------------------

--
-- Table structure for table `executive_summary_records`
--

CREATE TABLE `executive_summary_records` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `total_days_worked` int(11) NOT NULL,
  `no_pay_days` int(11) NOT NULL,
  `holiday_claims` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL,
  `approved_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `executive_summary_records`
--

INSERT INTO `executive_summary_records` (`id`, `plant_id`, `employee_id`, `year`, `month`, `total_days_worked`, `no_pay_days`, `holiday_claims`, `leave_days`, `approved_at`) VALUES
(12, 2, 12, 2025, 7, 1, 19, 1, 1, '2025-07-13 13:57:52'),
(18, 2, 12, 2025, 6, 1, 19, 1, 0, '2025-07-15 06:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `final_attendance_records`
--

CREATE TABLE `final_attendance_records` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `salary_month` int(11) NOT NULL,
  `total_days_worked` int(11) NOT NULL,
  `no_pay_days` int(11) NOT NULL,
  `holiday_claims` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL,
  `approved_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `salary_arrears` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `final_attendance_records`
--

INSERT INTO `final_attendance_records` (`id`, `plant_id`, `employee_id`, `year`, `month`, `salary_month`, `total_days_worked`, `no_pay_days`, `holiday_claims`, `leave_days`, `approved_at`, `salary_arrears`) VALUES
(1, 2, 12, 2025, 7, 7, 18, 1, 1, 0, '2025-07-17 04:59:05', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` enum('Poya','Public','Custom') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `date`, `name`, `type`, `created_at`) VALUES
(1, '2025-07-07', 'kk', 'Public', '2025-07-07 09:06:14'),
(4, '2025-06-04', 'jj', 'Public', '2025-07-11 10:42:26'),
(5, '2025-07-11', 'njm', 'Public', '2025-07-11 12:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` enum('Casual','Annual','Medical') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 12, 'Casual', '2025-07-10', NULL, 'Approved', '2025-07-11 05:09:47', '2025-07-11 09:58:47'),
(2, 18, 'Annual', '2025-07-10', NULL, 'Approved', '2025-07-11 12:15:38', '2025-07-11 12:15:38'),
(3, 18, 'Casual', '2025-07-13', NULL, 'Approved', '2025-07-14 11:17:40', '2025-07-14 11:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `monthly_loan_amount` decimal(15,2) NOT NULL,
  `loan_month` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `employee_id`, `monthly_loan_amount`, `loan_month`, `created_at`) VALUES
(1, 12, 15000.00, '2025-07', '2025-07-20 12:00:27');

-- --------------------------------------------------------

--
-- Table structure for table `non_executive_attendance_records`
--

CREATE TABLE `non_executive_attendance_records` (
  `id` bigint(20) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `salary_month` int(11) NOT NULL,
  `shift1` int(11) NOT NULL DEFAULT 0,
  `shift2` int(11) NOT NULL DEFAULT 0,
  `shift3` int(11) NOT NULL DEFAULT 0,
  `ot` int(11) NOT NULL DEFAULT 0,
  `dot` int(11) NOT NULL DEFAULT 0,
  `no_pay_days` int(11) NOT NULL DEFAULT 0,
  `leave_days` int(11) NOT NULL DEFAULT 0,
  `approved_at` datetime NOT NULL,
  `salary_arrears` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `non_executive_attendance_records`
--

INSERT INTO `non_executive_attendance_records` (`id`, `plant_id`, `employee_id`, `year`, `month`, `salary_month`, `shift1`, `shift2`, `shift3`, `ot`, `dot`, `no_pay_days`, `leave_days`, `approved_at`, `salary_arrears`) VALUES
(2, 2, 18, 2025, 7, 7, 2, 3, 2, 43, 21, 4, 2, '2025-07-16 16:33:03', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `non_executive_summary_records`
--

CREATE TABLE `non_executive_summary_records` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `total_days_worked` int(11) NOT NULL,
  `no_pay_days` int(11) NOT NULL,
  `ot_hours` int(11) NOT NULL,
  `dot_hours` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL,
  `approved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `power_plants`
--

CREATE TABLE `power_plants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `power_plants`
--

INSERT INTO `power_plants` (`id`, `name`) VALUES
(2, 'BMHPP'),
(1, 'DMHPP'),
(3, 'KMHPP'),
(4, 'MEMP'),
(5, 'SCALP'),
(7, 'SLE'),
(6, 'SOLAR');

-- --------------------------------------------------------

--
-- Table structure for table `rosters`
--

CREATE TABLE `rosters` (
  `id` int(11) NOT NULL,
  `plant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `shift` enum('Morning','Day','Night') NOT NULL,
  `supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rosters`
--

INSERT INTO `rosters` (`id`, `plant_id`, `date`, `shift`, `supervisor_id`) VALUES
(303, 2, '2025-07-01', 'Day', 18);

-- --------------------------------------------------------

--
-- Table structure for table `roster_laborers`
--

CREATE TABLE `roster_laborers` (
  `roster_id` int(11) NOT NULL,
  `laborer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `emp_no` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `basic_salary` decimal(10,2) NOT NULL,
  `epf_deduction` decimal(10,2) NOT NULL,
  `employer_epf` decimal(10,2) NOT NULL,
  `etf` decimal(10,2) NOT NULL,
  `tax_deduction` decimal(10,2) NOT NULL,
  `loan_deduction` decimal(10,2) NOT NULL,
  `telephone_bill_deduction` decimal(10,2) NOT NULL,
  `stamp_deduction` decimal(10,2) NOT NULL,
  `welfare_deduction` decimal(10,2) NOT NULL,
  `insurance_deduction` decimal(10,2) NOT NULL,
  `no_pay_days` decimal(5,2) NOT NULL,
  `no_pay_deduction` decimal(10,2) NOT NULL,
  `leave_days` decimal(5,2) NOT NULL,
  `holiday_claims` decimal(5,2) DEFAULT 0.00,
  `holiday_claim_amount` decimal(10,2) DEFAULT 0.00,
  `ot_hours` int(11) DEFAULT NULL,
  `ot_amount` decimal(10,2) DEFAULT 0.00,
  `dot_hours` int(11) DEFAULT NULL,
  `dot_amount` decimal(10,2) DEFAULT 0.00,
  `salary_arrears` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gross_salary` decimal(10,2) NOT NULL,
  `total_deductions` decimal(10,2) NOT NULL,
  `net_pay` decimal(10,2) NOT NULL,
  `salary_month` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `emp_no`, `employee_name`, `basic_salary`, `epf_deduction`, `employer_epf`, `etf`, `tax_deduction`, `loan_deduction`, `telephone_bill_deduction`, `stamp_deduction`, `welfare_deduction`, `insurance_deduction`, `no_pay_days`, `no_pay_deduction`, `leave_days`, `holiday_claims`, `holiday_claim_amount`, `ot_hours`, `ot_amount`, `dot_hours`, `dot_amount`, `salary_arrears`, `gross_salary`, `total_deductions`, `net_pay`, `salary_month`, `created_at`) VALUES
(3, 12, '124', 'Vilochana Udantha', 165000.00, 16500.00, 24750.00, 4950.00, 900.00, 15000.00, 2500.00, 25.00, 500.00, 900.00, 1.00, 5500.00, 0.00, 1.00, 8250.00, NULL, 0.00, NULL, 0.00, 0.00, 173250.00, 41825.00, 131425.00, '2025-07', '2025-07-20 18:14:45'),
(4, 14, '2121', 'Sunil', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45'),
(5, 15, 'E000120', 'P M Indrachapa', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, NULL, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45'),
(6, 16, 'E000128', 'Indrachapa', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, NULL, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45'),
(7, 18, 'E000129', 'Amal', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 4.00, 0.00, 2.00, 0.00, 0.00, 43, 0.00, 21, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45'),
(8, 19, 'E000130', 'Kasun', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45'),
(9, 20, 'E000148', 'Kamal', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25.00, 500.00, 900.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 0.00, 0.00, 0.00, 1425.00, -1425.00, '2025-07', '2025-07-20 18:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `telephone_bills`
--

CREATE TABLE `telephone_bills` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `monthly_bill_amount` decimal(10,2) NOT NULL,
  `bill_month` char(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `telephone_bills`
--

INSERT INTO `telephone_bills` (`id`, `employee_id`, `monthly_bill_amount`, `bill_month`, `created_at`) VALUES
(2, 12, 2500.00, '2025-07', '2025-07-20 14:42:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_plant_id` (`plant_id`),
  ADD KEY `idx_employee_id` (`employee_id`),
  ADD KEY `idx_date` (`date`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_no` (`emp_no`),
  ADD KEY `plant_id` (`plant_id`),
  ADD KEY `leave_l1` (`leave_l1`),
  ADD KEY `leave_l2` (`leave_l2`),
  ADD KEY `leave_clerk` (`leave_clerk`);

--
-- Indexes for table `executive_attendance_records`
--
ALTER TABLE `executive_attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `idx_plant_date` (`plant_id`,`date`);

--
-- Indexes for table `executive_summary_records`
--
ALTER TABLE `executive_summary_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plant_id` (`plant_id`,`employee_id`,`year`,`month`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `leave_days` (`leave_days`),
  ADD KEY `leave_days_2` (`leave_days`);

--
-- Indexes for table `final_attendance_records`
--
ALTER TABLE `final_attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_attendance` (`plant_id`,`employee_id`,`year`,`month`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_date` (`date`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `idx_loan_month` (`loan_month`);

--
-- Indexes for table `non_executive_attendance_records`
--
ALTER TABLE `non_executive_attendance_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`plant_id`,`employee_id`,`year`,`month`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `non_executive_summary_records`
--
ALTER TABLE `non_executive_summary_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_plant_id` (`plant_id`),
  ADD KEY `idx_employee_id` (`employee_id`),
  ADD KEY `idx_year` (`year`),
  ADD KEY `idx_month` (`month`),
  ADD KEY `idx_leave_days` (`leave_days`);

--
-- Indexes for table `power_plants`
--
ALTER TABLE `power_plants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `rosters`
--
ALTER TABLE `rosters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_roster` (`plant_id`,`date`,`shift`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Indexes for table `roster_laborers`
--
ALTER TABLE `roster_laborers`
  ADD PRIMARY KEY (`roster_id`,`laborer_id`),
  ADD KEY `laborer_id` (`laborer_id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_salary` (`employee_id`,`salary_month`);

--
-- Indexes for table `telephone_bills`
--
ALTER TABLE `telephone_bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employee_id` (`employee_id`),
  ADD KEY `idx_bill_month` (`bill_month`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_records`
--
ALTER TABLE `attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `executive_attendance_records`
--
ALTER TABLE `executive_attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `executive_summary_records`
--
ALTER TABLE `executive_summary_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `final_attendance_records`
--
ALTER TABLE `final_attendance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `non_executive_attendance_records`
--
ALTER TABLE `non_executive_attendance_records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `non_executive_summary_records`
--
ALTER TABLE `non_executive_summary_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `power_plants`
--
ALTER TABLE `power_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rosters`
--
ALTER TABLE `rosters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `telephone_bills`
--
ALTER TABLE `telephone_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_records`
--
ALTER TABLE `attendance_records`
  ADD CONSTRAINT `attendance_records_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `attendance_records_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`leave_l1`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`leave_l2`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`leave_clerk`) REFERENCES `employees` (`id`);

--
-- Constraints for table `executive_attendance_records`
--
ALTER TABLE `executive_attendance_records`
  ADD CONSTRAINT `executive_attendance_records_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `executive_attendance_records_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `executive_summary_records`
--
ALTER TABLE `executive_summary_records`
  ADD CONSTRAINT `executive_summary_records_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `executive_summary_records_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `final_attendance_records`
--
ALTER TABLE `final_attendance_records`
  ADD CONSTRAINT `final_attendance_records_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `final_attendance_records_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `non_executive_attendance_records`
--
ALTER TABLE `non_executive_attendance_records`
  ADD CONSTRAINT `non_executive_attendance_records_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `non_executive_attendance_records_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `rosters`
--
ALTER TABLE `rosters`
  ADD CONSTRAINT `rosters_ibfk_1` FOREIGN KEY (`plant_id`) REFERENCES `power_plants` (`id`),
  ADD CONSTRAINT `rosters_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `roster_laborers`
--
ALTER TABLE `roster_laborers`
  ADD CONSTRAINT `roster_laborers_ibfk_1` FOREIGN KEY (`roster_id`) REFERENCES `rosters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roster_laborers_ibfk_2` FOREIGN KEY (`laborer_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `telephone_bills`
--
ALTER TABLE `telephone_bills`
  ADD CONSTRAINT `telephone_bills_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
