/*
  Warnings:

  - You are about to drop the column `banner` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `firstname` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `lastname` on the `user` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "Type" AS ENUM ('public', 'unlisted', 'private');

-- AlterTable
ALTER TABLE "user" DROP COLUMN "banner",
DROP COLUMN "firstname",
DROP COLUMN "lastname",
ADD COLUMN     "coverphoto" TEXT,
ALTER COLUMN "gender" DROP NOT NULL;

-- CreateTable
CREATE TABLE "uploads" (
    "id" TEXT NOT NULL,
    "userid" TEXT NOT NULL,
    "video_url" TEXT NOT NULL,
    "thumbnail" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "views" INTEGER NOT NULL DEFAULT 0,
    "type" "Type",
    "likes" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "uploads_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "uploads" ADD CONSTRAINT "uploads_userid_fkey" FOREIGN KEY ("userid") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
