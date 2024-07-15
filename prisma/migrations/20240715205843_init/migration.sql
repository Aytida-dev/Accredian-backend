/*
  Warnings:

  - You are about to drop the `referrals` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `referrals`;

-- CreateTable
CREATE TABLE `referral` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `referralCode` VARCHAR(191) NOT NULL,
    `referrerName` VARCHAR(191) NOT NULL,
    `referrerEmail` VARCHAR(191) NOT NULL,
    `refereeName` VARCHAR(191) NOT NULL,
    `refereeEmail` VARCHAR(191) NOT NULL,
    `courseName` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `referral_referralCode_key`(`referralCode`),
    UNIQUE INDEX `referral_referrerEmail_refereeEmail_courseName_key`(`referrerEmail`, `refereeEmail`, `courseName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
