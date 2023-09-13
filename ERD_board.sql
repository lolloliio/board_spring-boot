-- MySQL Script generated by MySQL Workbench
-- Wed Sep  6 17:49:35 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema board
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `board` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `board` ;

-- -----------------------------------------------------
-- Table `board`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`board` (
  `board_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '게시판 ID',
  `category` VARCHAR(10) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT '게시판 카테고리',
  `title` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT '제목',
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL COMMENT '내용',
  `view_count` INT UNSIGNED NULL DEFAULT '0' COMMENT '조회수',
  `fixed` CHAR(1) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT 'N' COMMENT '공지사항여부',
  `fixed_at` TIMESTAMP NULL DEFAULT NULL COMMENT '공지사항 게시종료시간',
  `created_by` INT UNSIGNED NULL DEFAULT NULL COMMENT '생성자',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',
  `modified_by` INT UNSIGNED NULL DEFAULT NULL COMMENT '수정자',
  `modified_at` TIMESTAMP NULL DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`board_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `board`.`board_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`board_comment` (
  `comment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '댓글 ID',
  `content` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL COMMENT '내용',
  `parent_comment_id` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '부모 댓글 ID',
  `board_id` INT UNSIGNED NOT NULL COMMENT '게시판 ID',
  `created_by` INT UNSIGNED NULL DEFAULT NULL COMMENT '생성자',
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',
  PRIMARY KEY (`comment_id`, `board_id`),
  INDEX `fk_BOARD_COMMENT_idx` (`board_id` ASC) VISIBLE,
  CONSTRAINT `fk_BOARD_COMMENT`
    FOREIGN KEY (`board_id`)
    REFERENCES `board`.`board` (`board_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `board`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '사용자 ID',
  `user_name` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT '이름',
  `password` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT '비밀번호',
  `email` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT '이메일',
  `created_by` INT UNSIGNED NULL DEFAULT NULL COMMENT '생성자',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일',
  `modified_by` INT UNSIGNED NULL DEFAULT NULL COMMENT '수정자',
  `modified_at` DATETIME NULL DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;