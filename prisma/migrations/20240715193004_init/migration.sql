/*
  Warnings:

  - You are about to drop the `referral` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `referral`;

-- CreateTable
CREATE TABLE `Referrer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `referral_code` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Referrer_phone_key`(`phone`),
    UNIQUE INDEX `Referrer_referral_code_key`(`referral_code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Referee` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Referee_phone_key`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Referrals` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referrer_id` INTEGER NOT NULL,
    `referee_id` INTEGER NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `course_name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Referrals_referrer_id_referee_id_course_name_key`(`referrer_id`, `referee_id`, `course_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Referrals` ADD CONSTRAINT `Referrals_referrer_id_fkey` FOREIGN KEY (`referrer_id`) REFERENCES `Referrer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Referrals` ADD CONSTRAINT `Referrals_referee_id_fkey` FOREIGN KEY (`referee_id`) REFERENCES `Referee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
