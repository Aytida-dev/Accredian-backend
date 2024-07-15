/*
  Warnings:

  - You are about to drop the `Referrals` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `Referrals`;

-- CreateTable
CREATE TABLE `referrals` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referralCode` VARCHAR(191) NOT NULL,
    `referrerName` VARCHAR(191) NOT NULL,
    `referrerEmail` VARCHAR(191) NOT NULL,
    `referreeName` VARCHAR(191) NOT NULL,
    `referreeEmail` VARCHAR(191) NOT NULL,
    `courseName` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `referrals_referralCode_key`(`referralCode`),
    UNIQUE INDEX `referrals_referrerEmail_referreeEmail_courseName_key`(`referrerEmail`, `referreeEmail`, `courseName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
