/*
  Warnings:

  - You are about to drop the column `course_name` on the `Referrals` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Referrals` table. All the data in the column will be lost.
  - You are about to drop the column `referee_id` on the `Referrals` table. All the data in the column will be lost.
  - You are about to drop the column `referrer_id` on the `Referrals` table. All the data in the column will be lost.
  - You are about to drop the `Referee` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Referrer` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[referralCode]` on the table `Referrals` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[referrerEmail,referreeEmail]` on the table `Referrals` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `referralCode` to the `Referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referreeEmail` to the `Referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referreeName` to the `Referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referrerEmail` to the `Referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referrerName` to the `Referrals` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Referrals` DROP FOREIGN KEY `Referrals_referee_id_fkey`;

-- DropForeignKey
ALTER TABLE `Referrals` DROP FOREIGN KEY `Referrals_referrer_id_fkey`;

-- DropIndex
DROP INDEX `Referrals_referrer_id_referee_id_course_name_key` ON `Referrals`;

-- AlterTable
ALTER TABLE `Referrals` DROP COLUMN `course_name`,
    DROP COLUMN `created_at`,
    DROP COLUMN `referee_id`,
    DROP COLUMN `referrer_id`,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `referralCode` VARCHAR(191) NOT NULL,
    ADD COLUMN `referreeEmail` VARCHAR(191) NOT NULL,
    ADD COLUMN `referreeName` VARCHAR(191) NOT NULL,
    ADD COLUMN `referrerEmail` VARCHAR(191) NOT NULL,
    ADD COLUMN `referrerName` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `Referee`;

-- DropTable
DROP TABLE `Referrer`;

-- CreateIndex
CREATE UNIQUE INDEX `Referrals_referralCode_key` ON `Referrals`(`referralCode`);

-- CreateIndex
CREATE UNIQUE INDEX `Referrals_referrerEmail_referreeEmail_key` ON `Referrals`(`referrerEmail`, `referreeEmail`);
