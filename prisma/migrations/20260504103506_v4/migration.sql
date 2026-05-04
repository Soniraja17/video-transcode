-- CreateEnum
CREATE TYPE "Videostatus" AS ENUM ('READY', 'FAILED', 'PROCESSING');

-- AlterTable
ALTER TABLE "uploads" ADD COLUMN     "status" "Videostatus" NOT NULL DEFAULT 'PROCESSING';
