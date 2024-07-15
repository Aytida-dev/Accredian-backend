/*
  Warnings:

  - You are about to drop the column `referreeEmail` on the `referrals` table. All the data in the column will be lost.
  - You are about to drop the column `referreeName` on the `referrals` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[referrerEmail,referreEmail,courseName]` on the table `referrals` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `referreEmail` to the `referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referreName` to the `referrals` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `referrals_referrerEmail_referreeEmail_courseName_key` ON `referrals`;

-- AlterTable
ALTER TABLE `referrals` DROP COLUMN `referreeEmail`,
    DROP COLUMN `referreeName`,
    ADD COLUMN `referreEmail` VARCHAR(191) NOT NULL,
    ADD COLUMN `referreName` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `referrals_referrerEmail_referreEmail_courseName_key` ON `referrals`(`referrerEmail`, `referreEmail`, `courseName`);
