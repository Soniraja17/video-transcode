-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('male', 'female', 'others');

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "gender" "Gender" NOT NULL,
    "channelname" TEXT NOT NULL,
    "banner" TEXT,
    "profilepicture" TEXT,
    "subscount" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);
