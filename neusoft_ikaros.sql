-- 数据库
CREATE DATABASE IF NOT EXISTS neusoft_ikaros 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE neusoft_ikaros;

-- 用户表
CREATE TABLE IF NOT EXISTS `user_info` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username` VARCHAR(20) NOT NULL COMMENT '账号',
    `password_hash` VARCHAR(32) NOT NULL COMMENT '密码(MD5)',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';


-- 答疑记录表
CREATE TABLE IF NOT EXISTS `qa_record` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id` BIGINT NOT NULL COMMENT '关联用户ID',
    `session_id` VARCHAR(64) NOT NULL COMMENT '会话ID',
    `question` TEXT NOT NULL COMMENT '用户提问',
    `answer` TEXT NOT NULL COMMENT 'AI回答',
    `mode` VARCHAR(20) NOT NULL COMMENT '回答模式',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

    PRIMARY KEY (`id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='答疑记录表';

-- 会话维护表
CREATE TABLE IF NOT EXISTS `chat_session` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `session_id` VARCHAR(64) NOT NULL COMMENT '会话ID',
    `user_id` BIGINT NOT NULL COMMENT '关联用户ID',
    `title` VARCHAR(255) COMMENT '会话标题',
    `last_time` DATETIME COMMENT '最后活跃时间',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_session_id` (`session_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_last_time` (`last_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会话维护表';
