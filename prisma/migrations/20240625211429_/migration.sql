/*
  Warnings:

  - You are about to drop the column `name` on the `Admin` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[admin_name]` on the table `Admin` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[DNI]` on the table `PersonalData` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `admin_name` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `ant` on the `WorkData` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Admin" DROP COLUMN "name",
ADD COLUMN     "admin_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "permits" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "WorkData" DROP COLUMN "ant",
ADD COLUMN     "ant" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Admin_admin_name_key" ON "Admin"("admin_name");

-- CreateIndex
CREATE UNIQUE INDEX "PersonalData_DNI_key" ON "PersonalData"("DNI");
